from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/merchants",
    tags=["merchants"],
)
@router.get("/")
async def get_merchants():
    try:
        response = supabase.table("merchants").select("*").execute()
        return {"merchants": response.data}
    except Exception as e:
        return {"error": str(e)}
