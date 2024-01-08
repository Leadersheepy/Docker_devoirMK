import os

from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from sqlalchemy import create_engine, Table, MetaData

TABLE_NAME = 'mytable'

# Establish a connection to the database
# Get PostgreSQL connection parameters from environment variables
postgres_host = os.environ.get('POSTGRES_HOST', 'localhost')
postgres_port = os.environ.get('POSTGRES_PORT', '5432')
postgres_db = os.environ.get('POSTGRES_DB', 'postgres')
postgres_user = os.environ.get('POSTGRES_USER', 'myuser')
postgres_password = os.environ.get('POSTGRES_PASSWORD', 'mypassword')

# Create a SQLAlchemy engine to connect to PostgreSQL
engine = create_engine(
    f'postgresql://{postgres_user}:{postgres_password}@{postgres_host}:{postgres_port}/{postgres_db}')

metadata = MetaData()
table = Table(TABLE_NAME, metadata, autoload_with=engine)

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")

templates = Jinja2Templates(directory="static/templates")


@app.get("/", response_class=HTMLResponse)
def read_root(request: Request):
    users = []
    with engine.connect() as conn:
        # Execute a SELECT statement
        stmt = table.select()

        # Fetch all rows and print them
        users = conn.execute(stmt).fetchall()

    return templates.TemplateResponse("index.html", {"request": request, "users": users})
