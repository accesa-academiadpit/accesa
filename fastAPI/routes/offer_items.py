from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/offer_items",
    tags=["offer_items"],
)
@router.get("/")
async def get_offer_items():
    try:
        response = supabase.table("offer_items").select("*").execute()
        return {"offer_items": response.data}
    except Exception as e:
        return {"error": str(e)}