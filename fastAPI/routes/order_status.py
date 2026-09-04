from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/order_status",
    tags=["order_status"],
)
@router.get("/")
async def get_order_status():
    try:
        response = supabase.table("order_status").select("*").execute()
        return {"order_status": response.data}
    except Exception as e:
        return {"error": str(e)}