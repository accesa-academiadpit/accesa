from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins (for development)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)




posts: list[dict] = [
    {
        "id": 1,
        "title": "First Post",
        "content": "This is the content of the first post",
        "date_posted": "2023-06-01"
    },
    {
        "id": 2,
        "title": "Second Post",
        "content": "This is the content of the second post",
        "date_posted": "2023-06-02"
    }
]

@app.get("/", response_class=HTMLResponse, include_in_schema=False)
@app.get("/posts", response_class=HTMLResponse, include_in_schema=False)

def home():
    return f"<h1>{posts[1]['title']}</h1>"

@app.get("/api/posts")
def get_posts():
    return posts

@app.get("/api")
def api_root():
    return {"message": "Adu's first API"}

@app.get("/apitestsupa")
def api_test_supabase():
    from fastAPI.db.supabase_client import create_client

    url = "https://ueurvamkhwkgoydplnfe.supabase.co"
    key = "sb_publishable_zxLPNxtJC9FmhpAPS9shQg_XdU5uM8Z"

    supabase = create_client(url, key)

    try:
        result = (
            supabase
            .schema("tebelenoi")
            .table("cart")
            .select("*")
            .execute()
        )

        return {"result": result.data}
    
    except Exception as e:
        return {"error": repr(e)}
