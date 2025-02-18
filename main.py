from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import asyncpg
from pydantic import BaseModel



class Usuario(BaseModel):
    id : int
    username : str
    senha : str
    nome : str
    sobrenome : str
    cargo : str
    email : str



app = FastAPI()

async def get_db_connection():
    return await asyncpg.connect(
        user='postgres',
        password='',
        database='projeto',
        host='localhost'
    )

@app.get('/test')
async def test_connection():
    conn = await get_db_connection()
    await conn.close()
    return {'message': 'conexão bem sucedida'}


@app.get('/', response_class=HTMLResponse)
def home():
    with open('views/html/login.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)   

#RECEBER ELOGIOS DE THIAGO

@app.get('/login')
async def get_login(email: str, senha: str):

    conn = await get_db_connection()
    row = await conn.fetch("SELECT email, senha FROM usuarios;")
    await conn.close()
    user = []
    for i in row:
        user.append(f"Email: {i['email']}, Password: {i['senha']}")

    for i in user:
        if email == f"{i['email']}" and  senha == f"{i['senha']}":
            return {'message': "Usuario encontrado"}
        else:
            return {'message': "Usuario não existe ou foi digitado errado k"}


#AQ ACABOU
@app.post('/cadastro')
async def cadastro_usuarios(usuario: Usuario):
    conn = await get_db_connection()
    await conn.execute(
        "INSERT INTO usuarios (id_usuario, username, senha, nome, sobrenome, cargo, email) VALUES ($1, $2, $3, $4, $5, $6, $7)",
        usuario.id, usuario.username, usuario.senha, usuario.nome, usuario.sobrenome, usuario.cargo, usuario.email
        )
    await conn.close()
    return {"message": "Criado pai."}


#AQ PENSAR MELHOR
@app.get('/recuperar_email')
async def get_login():
    conn = await get_db_connection()
    row = await conn.fetch("SELECT email FROM usuarios;")
    await conn.close()
    email = []
    for i in row:
        ##VERIFICA SE EXISTE.
        email.append(f"Email: {i['email']}")
        
    return {"Email: ": email}

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
    
