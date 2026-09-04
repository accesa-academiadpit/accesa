from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/locations",
    tags=["locations"],
)
@router.get("/")
async def get_locations():
    try:
        response = supabase.table("locations").select("*").execute()
        return {"locations": response.data}
    except Exception as e:
        return {"error": str(e)}