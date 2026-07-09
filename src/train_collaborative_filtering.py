"""User-based collaborative filtering: recommend content favorited by similar users."""
from pathlib import Path

import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity

from db_config import get_connection

DATA_DIR = Path(__file__).resolve().parent.parent / "data"
TOP_K = 5   # number of similar users to consider
TOP_N = 3   # number of recommendations per user

# 1. Load tables from MySQL
conn = get_connection()
members_df = pd.read_sql("SELECT * FROM member", conn)
contents_df = pd.read_sql("SELECT * FROM content_detail", conn)
likes_df = pd.read_sql("SELECT * FROM content_favorite", conn)
region_df = pd.read_sql("SELECT * FROM region_coords", conn)
subcategory_df = pd.read_sql("SELECT * FROM content_sub_category", conn)
category_df = pd.read_sql("SELECT * FROM content_category", conn)
conn.close()

print("members_df:", members_df.shape)
print("contents_df:", contents_df.shape)
print("likes_df:", likes_df.shape)
print("region_df:", region_df.shape)
print("subcategory_df:", subcategory_df.shape)
print("category_df:", category_df.shape)

# 2. Build a user feature matrix from profile fields
user_features = members_df[['id', 'age', 'gender', 'location', 'keyword1', 'keyword2', 'keyword3']].copy()
user_features_encoded = pd.get_dummies(user_features.set_index('id'))
user_feature_matrix = user_features_encoded.sort_index()

# 3. Compute user-user similarity
user_sim_matrix = cosine_similarity(user_feature_matrix)
user_ids = user_feature_matrix.index.tolist()
user_sim_df = pd.DataFrame(user_sim_matrix, index=user_ids, columns=user_ids)

# 4. For each user, recommend content favorited by their most similar users
recommendations = []

for user_id in user_sim_df.index:
    similar_users = (
        user_sim_df.loc[user_id]
        .drop(index=user_id)
        .sort_values(ascending=False)
        .head(TOP_K)
        .index.tolist()
    )

    sim_users_likes = likes_df[likes_df['member_id'].isin(similar_users)]
    liked_contents = sim_users_likes['content_detail_id'].value_counts()

    user_liked = set(likes_df[likes_df['member_id'] == user_id]['content_detail_id'])

    for content_id, count in liked_contents.items():
        if content_id not in user_liked:
            recommendations.append({
                'member_id': user_id,
                'content_detail_id': content_id,
                'like_count': count
            })
            if sum(r['member_id'] == user_id for r in recommendations) >= TOP_N:
                break

recommend_df = pd.DataFrame(recommendations)
recommend_df.rename(columns={'like_count': 'score'}, inplace=True)

DATA_DIR.mkdir(exist_ok=True)
recommend_df.to_csv(DATA_DIR / "collaborative_recommendations.csv", index=False)
print("Saved collaborative_recommendations.csv:", recommend_df.shape)
