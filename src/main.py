import random
import subprocess
from typing import List

from apscheduler.schedulers.asyncio import AsyncIOScheduler
from fastapi import FastAPI
from pydantic import BaseModel

from recommend_model import get_hybrid_recommendations

app = FastAPI(title="Hybrid Recommendation API")


class RecommendationRequest(BaseModel):
    user_id: int


class RecommendationResponse(BaseModel):
    recommended_contents: List[int]


class IntRequest(BaseModel):
    value: int


@app.post("/recommend", response_model=RecommendationResponse)
def recommend(request: RecommendationRequest):
    contents = get_hybrid_recommendations(request.user_id, top_n_each=3)

    # Backfill with random content if a model returned no recommendations for this user
    if len(contents) == 3:
        for i in range(1, 4):
            contents.append(random.randint(1, 1320))

    return {"recommended_contents": contents}


@app.post("/run-model")
def run_notebook(data: IntRequest):
    if data.value == 1:
        try:
            collaborative_result = subprocess.run(
                ["python", "train_collaborative_filtering.py"],
                capture_output=True,
                text=True,
                check=True
            )
            xgboost_result = subprocess.run(
                ["python", "train_xgboost_model.py"],
                capture_output=True,
                text=True,
                check=True
            )

            return {
                "message": "성공",
                "collaborative_output": collaborative_result.stdout,
                "xgboost_output": xgboost_result.stdout,
            }

        except subprocess.CalledProcessError as e:
            return {"message": "실패", "output": e.stdout, "error": e.stderr}
    return 0


def scheduled_job():
    """Retrain both recommendation models. Runs daily via the scheduler below."""
    print("스케줄러 실행: 모델 실행")
    try:
        xgboost_result = subprocess.run(
            ["python", "train_xgboost_model.py"],
            capture_output=True,
            text=True,
            check=True
        )
        collaborative_result = subprocess.run(
            ["python", "train_collaborative_filtering.py"],
            capture_output=True,
            text=True,
            check=True
        )

        print("스케줄러 정상 실행됨:")
        print(xgboost_result.stdout)
        print(collaborative_result.stdout)
    except subprocess.CalledProcessError as e:
        print("스케줄러 오류 발생:")
        print("stdout:", e.stdout)
        print("stderr:", e.stderr)


scheduler = AsyncIOScheduler()
scheduler.add_job(scheduled_job, 'cron', hour=1, minute=0)  # runs daily at 01:00
scheduler.start()


@app.on_event("startup")
async def startup_event():
    # No-op: ensures the event loop is running before APScheduler's jobs fire
    print("서버 시작 - 스케줄러 작동 대기 중")
