import os

import pymysql
from dotenv import load_dotenv

load_dotenv()


def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD"),
        db=os.getenv("DB_NAME", "culture_db"),
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor,
    )
