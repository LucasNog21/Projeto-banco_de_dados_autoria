from fastapi import FastAPI
from fastapi.responses import HTMLResponse
#import asyncpg

app = FastAPI()
'''
async def get_db_connection():
    return await asyncpg.connect(
        user='postgres',
        password='',
        database='Projeto_pb_aw',
        host='localhost'
    )

@app.get('/test')
async def test_connection():
    conn = await get_db_connection()
    await conn.close()
    return {'message': 'conexão bem sucedida'}
'''


@app.get('/', response_class=HTMLResponse)
def home():
    with open('views/index.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)    