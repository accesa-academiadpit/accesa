from fastapi import APIRouter
from db.supabase_client import supabase


router = APIRouter(
    prefix="/api/product",
    tags=["product"],
)
@router.get("/")
async def get_product():
    try:
        response = supabase.table("product").select("*").execute()
        return {"product": response.data}
    except Exception as e:
        return {"error": str(e)}
