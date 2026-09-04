from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/location_type",
    tags=["location_type"],
)
@router.get("/")
async def get_location_type():
    try:
        response = supabase.table("location_type").select("*").execute()
        return {"location_type": response.data}
    except Exception as e:
        return {"error": str(e)}