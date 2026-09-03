from fastAPI.db.supabase_client import create_client

url = "https://ueurvamkhwkgoydplnfe.supabase.co"
key = "sb_publishable_zxLPNxtJC9FmhpAPS9shQg_XdU5uM8Z"

supabase = create_client(url, key)

print("BASE URL:", supabase.postgrest.base_url)

try:
    result = (
        supabase
        .schema("tebelenoi")
        .table("cart")
        .select("*")
        .execute()
    )

    print("RESULT:", result.data)

except Exception as e:
    print("ERROR:", repr(e))    