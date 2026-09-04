from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/order_type",
    tags=["order_type"],
)
@router.get("/")
async def get_order_type():
    try:
        response = supabase.table("order_type").select("*").execute()
        return {"order_type": response.data}
    except Exception as e:
        return {"error": str(e)}