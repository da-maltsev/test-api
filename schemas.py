from pydantic import BaseModel, Field


class MessageBody(BaseModel):
    title: str = Field(max_length=20)
    text: str = Field(max_length=200)
