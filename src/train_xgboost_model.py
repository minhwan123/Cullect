"""Hybrid XGBoost recommender combining user profile, location, and content-text signals."""
import re
from math import atan2, cos, radians, sin, sqrt
from pathlib import Path

import numpy as np
import pandas as pd
from gensim.models import Word2Vec
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from xgboost import XGBClassifier

from db_config import get_connection

DATA_DIR = Path(__file__).resolve().parent.parent / "data"

# 1. Load tables from MySQL
conn = get_connection()
members_df = pd.read_sql("SELECT * FROM member", conn)
contents_df = pd.read_sql("SELECT * FROM content_detail", conn)
likes_df = pd.read_sql("SELECT * FROM content_favorite", conn)
region_df = pd.read_sql("SELECT * FROM region_coords", conn)
subcategory_df = pd.read_sql("SELECT * FROM content_sub_category", conn)
category_df = pd.read_sql("SELECT * FROM content_category", conn)
conn.close()

# 2. time_score: recency of each favorite, decayed by days since the latest favorite
temp_max_date = likes_df['created_at'].max()
likes_df['time_score'] = likes_df['created_at'].apply(lambda d: 1 / (1 + (temp_max_date - d).days))

# 3. Build the full (user, content) grid and merge in the favorite label / time_score
user_ids = members_df['id'].unique()
content_ids = contents_df['id'].unique()
full_df = pd.DataFrame([(u, c) for u in user_ids for c in content_ids], columns=['member_id', 'content_detail_id'])

merged_df = pd.merge(
    full_df,
    likes_df[['member_id', 'content_detail_id', 'time_score']],
    on=['member_id', 'content_detail_id'],
    how='left'
)
merged_df['label'] = merged_df['time_score'].apply(lambda x: 1 if pd.notnull(x) else 0)
merged_df['time_score'] = merged_df['time_score'].fillna(0)
user_time_score_map = likes_df.groupby('member_id')['time_score'].mean().to_dict()
merged_df['time_score'] = merged_df.apply(
    lambda row: user_time_score_map.get(row['member_id'], 0) if (row['label'] == 0 and row['time_score'] == 0) else row['time_score'],
    axis=1
)

# 4. Extract district-level region from free-text addresses and compute user-content distance
def extract_region(text):
    try:
        if ' ' in text:
            for part in text.split():
                if part.endswith('구'):
                    return part
    except TypeError:
        return None
    return None

members_df['region'] = members_df['location'].apply(extract_region)
contents_df['region_content'] = contents_df['address'].apply(extract_region)
region_coords = {row['region']: (row['lat'], row['lon']) for _, row in region_df.iterrows()}

def calculate_distance_km(lat1, lon1, lat2, lon2):
    R = 6371
    dlat = radians(lat2 - lat1)
    dlon = radians(lon2 - lon1)
    a = sin(dlat / 2) ** 2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2) ** 2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

def safe_calculate_distance(row):
    loc1 = region_coords.get(row['region'])
    loc2 = region_coords.get(row['region_content'])
    if loc1 is None or loc2 is None:
        return np.nan
    return calculate_distance_km(loc1[0], loc1[1], loc2[0], loc2[1])

merged_df = merged_df.merge(members_df[['id', 'region']].rename(columns={'id': 'member_id'}), on='member_id', how='left')
merged_df = merged_df.merge(contents_df[['id', 'region_content']].rename(columns={'id': 'content_detail_id'}), on='content_detail_id', how='left')
merged_df['distance'] = merged_df.apply(safe_calculate_distance, axis=1)

# 5. Word2Vec over user preference keywords -> average vector per user
tokens = members_df[['keyword1', 'keyword2', 'keyword3']].values.tolist()
w2v_model = Word2Vec(tokens, vector_size=5, window=2, min_count=1, sg=1, seed=42)

user_vecs = []
for _, row in members_df.iterrows():
    keywords = [row['keyword1'], row['keyword2'], row['keyword3']]
    vectors = [w2v_model.wv[word] for word in keywords if word in w2v_model.wv]
    avg_vec = np.mean(vectors, axis=0) if vectors else np.zeros(w2v_model.vector_size)
    vec_dict = {'member_id': row['id']}
    for i, val in enumerate(avg_vec):
        vec_dict[f'w2v_feature_{i}'] = val
    user_vecs.append(vec_dict)
user_w2v_df = pd.DataFrame(user_vecs)
merged_df = pd.merge(merged_df, user_w2v_df, on='member_id', how='left')

# 6. One-hot encode categorical features, assemble X / y
members_df['gender'] = members_df['gender'].astype(str)
merged_df = merged_df.merge(members_df[['id', 'gender']].rename(columns={'id': 'member_id'}), on='member_id', how='left')
cat_cols = ['gender', 'region', 'region_content']
merged_df = merged_df.dropna(subset=cat_cols)
encoder = OneHotEncoder(sparse_output=False, handle_unknown='ignore')
encoded = encoder.fit_transform(merged_df[cat_cols])
encoded_df = pd.DataFrame(encoded, columns=encoder.get_feature_names_out(cat_cols), index=merged_df.index)

if 'age' not in merged_df.columns:
    merged_df = merged_df.merge(members_df[['id', 'age']].rename(columns={'id': 'member_id'}), on='member_id', how='left')
w2v_cols = [col for col in merged_df.columns if col.startswith('w2v_feature_')]
merged_df['time_score'] = merged_df['time_score'] * 0.1
numeric_df = merged_df[['age', 'distance', 'time_score'] + w2v_cols]

X = pd.concat([encoded_df, numeric_df], axis=1)
y = merged_df['label'].copy()

# 7. Train XGBoost, weighting the minority (favorited) class
X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=0.2, stratify=y, random_state=42)
neg = sum(y_train == 0)
pos = sum(y_train == 1)
scale_pos_weight = neg / pos
model = XGBClassifier(n_estimators=100, learning_rate=0.1, max_depth=5, random_state=42, eval_metric='logloss', scale_pos_weight=scale_pos_weight)
model.fit(X_train, y_train)
merged_df['score'] = model.predict_proba(X)[:, 1]

# 8. Word2Vec over content names -> average vector per content item
contents_df['tokens'] = contents_df['content_name'].str.lower().apply(lambda x: re.sub(r'[^\w\s]', '', x).split() if isinstance(x, str) else [])
content_sentences = contents_df['tokens'].tolist()
content_w2v_model = Word2Vec(content_sentences, vector_size=5, window=2, min_count=1, sg=1, seed=42)

content_vecs = []
for _, row in contents_df.iterrows():
    tokens = row['tokens']
    vectors = [content_w2v_model.wv[word] for word in tokens if word in content_w2v_model.wv]
    avg_vec = np.mean(vectors, axis=0) if vectors else np.zeros(5)
    vec_dict = {'content_detail_id': row['id']}
    for i, val in enumerate(avg_vec):
        vec_dict[f'cvec_{i}'] = val
    content_vecs.append(vec_dict)
content_w2v_df = pd.DataFrame(content_vecs)
merged_df = merged_df.merge(content_w2v_df, on='content_detail_id', how='left')

# 9. For each user, pick their top favorited (or best-scored) content as an anchor
all_users = merged_df['member_id'].unique()
positive_df = (
    merged_df[merged_df['label'] == 1]
    .sort_values(['member_id', 'score'], ascending=[True, False])
    .groupby('member_id')
    .first()
    .reset_index()
    .rename(columns={'content_detail_id': 'positive_content_id'})
)
dummy_positive = (
    merged_df
    .sort_values(['member_id', 'score'], ascending=[True, False])
    .groupby('member_id')
    .first()
    .reset_index()
    .rename(columns={'content_detail_id': 'positive_content_id'})
)
missing_users = set(all_users) - set(positive_df['member_id'])
dummy_positive = dummy_positive[dummy_positive['member_id'].isin(missing_users)]
top_positive = pd.concat([positive_df, dummy_positive], ignore_index=True)

# 10. Recommend content most similar (by content vector) to each user's anchor item
content_vec_cols = [col for col in merged_df.columns if col.startswith('cvec_')]

def recommend_by_content_similarity(row):
    user_id = row['member_id']
    pos_id = row['positive_content_id']
    candidates = merged_df[(merged_df['member_id'] == user_id) & (merged_df['label'] == 0)].copy()
    if candidates.empty:
        return pd.DataFrame()
    pos_vec = merged_df[(merged_df['member_id'] == user_id) & (merged_df['content_detail_id'] == pos_id)][content_vec_cols].values
    cand_vecs = candidates[content_vec_cols].values
    if pos_vec.size == 0 or cand_vecs.size == 0:
        return pd.DataFrame()
    similarities = cosine_similarity(pos_vec, cand_vecs)[0]
    candidates['similarity'] = similarities
    top_n = candidates.sort_values('similarity', ascending=False).head(3)
    return top_n[['member_id', 'content_detail_id', 'score', 'similarity']]

final_recommendations = pd.concat([
    recommend_by_content_similarity(row) for _, row in top_positive.iterrows()
], ignore_index=True)

# 11. Blend model score and content similarity, keep the top 3 per user
final_recommendations['final_score'] = 0.6 * final_recommendations['score'] + 0.4 * final_recommendations['similarity']
top_n = (
    final_recommendations
    .sort_values(['member_id', 'final_score'], ascending=[True, False])
    .groupby('member_id')
    .head(3)
    .reset_index(drop=True)
)

DATA_DIR.mkdir(exist_ok=True)
top_n.to_csv(DATA_DIR / "xgboost_recommendations.csv", index=False)
print("Saved xgboost_recommendations.csv:", top_n.shape)
