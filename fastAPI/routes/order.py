from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/order",
    tags=["order"],
)
@router.get("/")
async def get_order():
    try:
        response = supabase.table("order").select("*").execute()
        return {"order": response.data}
    except Exception as e:
        return {"error": str(e)}

    
