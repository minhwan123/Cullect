from pathlib import Path

import pandas as pd

DATA_DIR = Path(__file__).resolve().parent.parent / "data"


def get_hybrid_recommendations(user_id: int, top_n_each: int = 3):
    """Blend collaborative-filtering and XGBoost recommendations for a user.

    Returns up to `top_n_each` collaborative picks followed by `top_n_each`
    XGBoost picks (front N = collaborative, back N = XGBoost).
    """
    xgb_df = pd.read_csv(DATA_DIR / "xgboost_recommendations.csv")
    collaborative_df = pd.read_csv(DATA_DIR / "collaborative_recommendations.csv")

    xgb_top = (
        xgb_df[xgb_df['member_id'] == user_id]
        .sort_values(by='final_score', ascending=False)
        .head(top_n_each)['content_detail_id']
        .tolist()
    )

    collaborative_top = (
        collaborative_df[collaborative_df['member_id'] == user_id]
        .sort_values(by='score', ascending=False)
        .head(top_n_each)['content_detail_id']
        .tolist()
    )

    return collaborative_top + xgb_top
