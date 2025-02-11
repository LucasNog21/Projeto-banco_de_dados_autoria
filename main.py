from fastapi import FastAPI
import asyncpg

app = FastAPI()

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



@app.get('/')
def read_root():
    return {'message': 'Olá, mundo'}    