from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm, OAuth2PasswordBearer
# from .params import TradParams
# from .response import TradResponse, HelloResponse
# from .database import SessionLocal

app = FastApi()

@app.get("/test/")
async def test():
    return {"hello": "wolrd"}
