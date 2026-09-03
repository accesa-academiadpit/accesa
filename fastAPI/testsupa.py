import os
from fastAPI.db.supabase_client import create_client, Client, ClientOptions
from dotenv import load_dotenv
# Source - https://stackoverflow.com/a/61029741
# Posted by ParisNakitaKejser, modified by community. See post 'Timeline' for change history
# Retrieved 2026-09-01, License - CC BY-SA 4.0



load_dotenv()

MY_ENV_VAR = os.getenv('MY_ENV_VAR')

print(MY_ENV_VAR)


# Best practice: store these in environment variables
url: str = "https://ueurvamkhwkgoydplnfe.supabase.co"
key: str = "sb_publishable_zxLPNxtJC9FmhpAPS9shQg_XdU5uM8Z"

# Initialize the Supabase client

supabase: Client = create_client(url, key)


options = ClientOptions(schema="tebelenoi")
supabase: Client = create_client(url, key, options=options,)

# Query directly without calling .schema()
response = supabase.table("cart").select("*").execute()
print(response.data)




# from supabase import create_client

# url = "https://ueurvamkhwkgoydplnfe.supabase.co"
# key = "CHEIA_TA"

# supabase = create_client(url, key)

# print("BASE URL:", supabase.postgrest.base_url)

# response = supabase.table("cart").select("*").execute()

# print("DATA:", response.data)