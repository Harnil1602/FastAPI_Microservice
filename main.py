from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

scores = [
    {"player": "Sachin Tendulkar", "score": 100},
    {"player": "Virat Kohli", "score": 85},
    {"player": "Rohit Sharma", "score": 76}
]


class Score(BaseModel):
    player: str
    score: int


@app.get("/")
def get_scores():
    return scores


@app.post("/")
def add_score(score: Score):
    new_score = score.dict()
    scores.append(new_score)
    return new_score


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
