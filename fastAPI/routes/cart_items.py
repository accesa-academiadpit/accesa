from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/cart_items",
    tags=["cart_items"],
)
@router.get("/")
async def get_cart_items():
    try:
        response = supabase.table("cart_items").select("*").execute()
        return {"cart_items": response.data}
    except Exception as e:
        return {"error": str(e)}


    
