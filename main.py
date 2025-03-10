from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
import asyncpg
from pydantic import BaseModel
from datetime import datetime
from fastapi import HTTPException
import os

class Usuario(BaseModel):
    id : int
    usuario : str
    senha : str
    nome : str
    sobrenome : str
    cargo : str
    email : str

class LoginRequest(BaseModel):
    email : str
    senha : str

class Noticia(BaseModel):
    id_noticia: int
    id_autor: int
    conteudo_noticia : str
    data_publicacao: str


app = FastAPI()

dirname = os.path.dirname(__file__)

app.mount("/static", StaticFiles(directory=os.path.join(dirname, 'static')), name="static")

origins = [
    "http://localhost",
    "http://localhost:8000",
    "https://localhost:8000/cadastro"
    "https://localhost:8000/verificar_email/"
    "https://localhost:8000/get_len"

]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

async def get_db_connection():
    return await asyncpg.connect(
        user='postgres',
        password='sql',
        database='projeto',
        host='localhost'
    )

@app.get('/test')
async def test_connection():
    conn = await get_db_connection()
    await conn.close()
    return {'message': 'conexão bem sucedida'}

@app.get('/')
def home():
    with open('views/html/login.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)

@app.post('/login')
async def login_user(request: LoginRequest):
    conn = await get_db_connection()
    row = await conn.fetch("SELECT id_usuario, email, senha FROM usuarios;")
    await conn.close()

    for i in row:
        if request.email == str(i["email"]) and request.senha == str(i["senha"]):
            id_usuario = str(i['id_usuario'])
            return {"status": 200, 'id' : str(i['id_usuario']), "url" : f"http://localhost:8000/index/{id_usuario}"}
    else:
        raise HTTPException(status_code=401, detail="Email ou senha incorretos")

#RECEBER ELOGIOS DE THIAGO, COMPARACAO NAO ESTÁ FUNCIONANDO

@app.get('/index/{id}')
def home():
    with open('views/html/index.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)
@app.get('/profile/{id}')
def home():
    with open('views/html/profile.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)
@app.get('/editprofile/{id}')
def home():
    with open('views/html/editprofile.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)
@app.get('/data/{id}')
def home():
    with open('views/html/data.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)

@app.get("/get_len")
async def get_len_user():
    conn = await get_db_connection()
    row = await conn.fetch("SELECT * FROM usuarios;")
    await conn.close()
    return {"Tamanho": len(row)}
    

#AQ ACABOU
@app.post('/cadastro')
async def cadastro_usuarios(usuario: Usuario):
    conn = await get_db_connection()
    await conn.execute(
        "INSERT INTO usuarios (id_usuario, usuario, senha, nome, sobrenome, cargo, email) VALUES ($1, $2, $3, $4, $5, $6, $7)",
        usuario.id, usuario.usuario, usuario.senha, usuario.nome, usuario.sobrenome, usuario.cargo, usuario.email
        )
    await conn.close()
    return {"message": "Criado pai."}

# FUNCIONA UMA BELEZA
@app.put('/trocar_senha/{id_usuario}')
async def set_password(id_usuario: int, senha: str):
    conn = await get_db_connection()
    result = await conn.execute(
        "UPDATE usuarios SET senha = $2 WHERE id_usuario = $1"
            , id_usuario, senha)
    await conn.close()

    if result == "UPDATE 1":
        return {'message': f"Senha do usuario {id_usuario} foi atualizado"}
    else: 
        return {'message': f"Usuario não foi atualizado"}
    
@app.delete('/delete_usuarios/{id_usuario}')
async def delete_usuario(id_usuario: int):
    conn = await get_db_connection()
    result = await conn.execute(
        'DELETE FROM usuarios WHERE id_usuario = $1', id_usuario
    )
    await conn.close()

    return {'message' : 'Usuario deletado'}


@app.get('/get_respostas')
async def get_respostas():
    conn = await get_db_connection()
    row = await conn.fetch('SELECT * FROM pesquisa_tecnoautoritarismo')
    await conn.close()
    respostas = []
    for i in row:
        respostas.append(f"carimbo: {i['carimbo']}, conhece_tecnoautoritarismo: {i['conhece_tecnoautoritarismo']}, conceito_tecnoautoritarismo: {i['conceito_tecnoautoritarismo']}, conhece_lgpd_marco_civil: {i['conhece_lgpd_marco_civil']}, conceito_lgpd: {i['conceito_lgpd']},presenciou_tecnoautoritarismo: {i['presenciou_tecnoautoritarismo']},caso_observado: {i['caso_observado']},considera_autoritarismo_digital_violento: {i['considera_autoritarismo_digital_violento']}, impacto_tecnoautoritarismo: {i['impacto_tecnoautoritarismo']},leis_eficazes: {i['leis_eficazes']}, leis_efetivamente_aplicadas: {i['leis_efetivamente_aplicadas']},")
    return {'Respostas: ': respostas}