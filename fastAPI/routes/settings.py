from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/settings", 
    tags=["settings"],
)
@router.get("/")
async def get_settings():
    try:
        response = supabase.table("settings").select("*").execute()
        return {"settings": response.data} 
    except Exception as e:
        return {"error": str(e)}
    
