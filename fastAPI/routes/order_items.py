from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/order_items",
    tags=["order_items"],
)
@router.get("/")
async def get_order_items():
    try:
        response = supabase.table("order_items").select("*").execute()
        return {"order_items": response.data}
    except Exception as e:
        return {"error": str(e)}