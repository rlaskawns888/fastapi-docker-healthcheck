from fastapi import FastAPI

from app.database import check_db_conn

app = FastAPI(
    title="docker sample project",
    description="docker sample project",
    version="1.0.0"
)

@app.get("/db-test")
def db_test():
    res = check_db_conn()
    return {
        "db": "connected",
        "res": res
    }

@app.get("/health")
def health_check():
    return {
        "status": "ok",
    }
