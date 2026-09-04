from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/loyalty_points",
    tags=["loyalty_points"],
)
@router.get("/")
async def get_loyalty_points():
    try:
        response = supabase.table("loyalty_points").select("*").execute()
        return {"loyalty_points": response.data}
    except Exception as e:
        return {"error": str(e)}