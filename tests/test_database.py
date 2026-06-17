import os
import psycopg2

def test_database_connection():
    database_url = os.getenv("DATABASE_TEST_URL")

    assert database_url is not None

    conn = psycopg2.connect(database_url)
    cur = conn.cursor()

    cur.execute("SELECT 1")
    res = cur.fetchone()

    cur.close()
    conn.close()

    assert res[0] == 1