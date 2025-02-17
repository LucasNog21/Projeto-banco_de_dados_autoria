from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import asyncpg
from pydantic import BaseModel



class Usuario(BaseModel):
    id : int
    username : str
    password : str
    first_name : str
    last_name : str
    role : str
    email : str



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


@app.get('/', response_class=HTMLResponse)
def home():
    with open('views/index.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)   

#Login

@app.get('/login')
async def get_login():
    conn = await get_db_connection()
    row = await conn.fetchrow("SELECT usarname, senha FROM usuario;")
    await conn.cloes()
    user = []
    for i in row:
        user.append(f"Username: {i['usarname']}, Password {i['senha']}")
        
    return {"Users: ": user}

## ERROR 500 INTERNAL SERVER!
@app.post('/Cadastro')
async def cadastro_usuarios(usuario: Usuario):
    conn = await get_db_connection()
    await conn.execute(
        "INSERT INTO usuario (id_usuario, usarname, senha, nome, sobrenome, cargo, email) VALUES ($1, $2, $3, $4, $5, $6, $7)",
        Usuario.id, Usuario.username, Usuario.password, Usuario.first_name, Usuario.last_name, Usuario.role, Usuario.email
        )
    await conn.close()
    return {"message": "Craido pai."}
