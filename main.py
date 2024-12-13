from fastapi import FastAPI

from schemas import MessageBody

app = FastAPI(root_path="/api")


@app.get("/")
def home() -> dict[str, str]:
    return {"Hello": "World"}


garbage: dict[str, str] = {}


@app.get("/messages")
def messages() -> dict[str, str]:
    return garbage


@app.post("/messages")
def post_message(message: MessageBody) -> dict[str, str]:
    garbage[message.title] = message.text
    return garbage


@app.delete("/messages/{message_title}")
def delete_message(message_title: str) -> dict[str, str]:
    garbage.pop(message_title, None)
    return garbage
