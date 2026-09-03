from fastapi import APIRouter
from db.supabase_client import supabase #aici importam supabase din db/supabase_client.py, care contine functia create_client si obiectul supabase



router = APIRouter(
    prefix="/api/favorite", #aici setam prefixul pentru toate rutele din acest router, astfel incat sa nu fie nevoie sa le scriem de fiecare data
    tags=["favorite"],
) #aici cream un router pentru favorite, care va avea prefixul /api/favorite si tag-ul favorite, astfel incat sa putem face request-uri la /api/favorite 
@router.get("/")
async def get_favorite():
    try:
        response = supabase.table("favorite").select("*").execute()
        return {"favorite": response.data} #aici returnam un dictionar cu cheia favorite si valoarea fiind datele returnate de supabase, astfel incat sa putem vedea ce favorite avem in baza de date
    except Exception as e:
        return {"error": str(e)} #aici returnam un dictionar cu cheia error si valoarea fiind string-ul erorii, astfel incat sa putem vedea ce eroare a aparut in cazul in care request-ul esueaza

    




