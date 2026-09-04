from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/offers",
    tags=["offers"],
)
@router.get("/")
async def get_offers():
    try:
        response = supabase.table("offers").select("*").execute()
        return {"offers": response.data}
    except Exception as e:
        return {"error": str(e)}
