from fastapi import FastAPI

app = FastAPI(root_path="/api")


@app.get("/")
def home() -> dict[str, str]:
    return {"Hello": "World"}
