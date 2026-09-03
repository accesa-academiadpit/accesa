from fastapi import FastAPI
from routes.cart import router as cart_router
from routes.favorite import router as favorite_router


app = FastAPI()
app.include_router(cart_router)
app.include_router(favorite_router)

