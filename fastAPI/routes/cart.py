from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/cart",
    tags=["cart"],
)

@router.get("/")
async def get_cart():
    try:
        response = supabase.table("cart").select("*").execute()
        return {"cart": response.data}
    except Exception as e:
        return {"error": str(e)}
    