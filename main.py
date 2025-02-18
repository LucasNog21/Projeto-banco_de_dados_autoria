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

class Noticia(BaseModel):
    id_noticia: int
    id_autor: str
    conteudo_noticia : str
    data_publicacao: str


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

#RECEBER ELOGIOS DE THIAGO, COMPARACAO NAO ESTÁ FUNCIONANDO

@app.get('/login')
async def get_login(email: str, senha: str):

    conn = await get_db_connection()
    row = await conn.fetch("SELECT email, senha FROM usuarios;")
    await conn.close()
    user = {}
    user_length = len(user)
    for i in row:
        user[user_length+1] = ({i['email']} , {i['senha']})

    for user_email in user:
        if email == user_email and  senha == user[user_email]:
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
    

@app.get('/noticias')
async def get_news():
    conn = await get_db_connection()
    row = await conn.fetch('SELECT * FROM noticias')
    await conn.close()
    news = []
    for i in row:
        news.append(f"id_noticia: {i['id_noticia']}, id_autor: {i['id_autor']}, conteudo_noticia: {i['conteudo_noticia']}, data_publicacao: {i['data_publicacao']}")

    return {'News: ':news}

#provavelmente dando erro devido ao tipo date do $4
@app.post('/criar_noticias')
async def post_news(new : Noticia):
    conn = await get_db_connection()
    await conn.execute(
        'INSERT INTO noticias(id_noticia,id_autor,conteudo_noticia, data_publicacao) VALUES($1, $2, $3, $4)',
        new.id_noticia, new.id_autor, new.conteudo_noticia, new.data_publicacao
    )
    await conn.close()
    return {'message': 'show the balls'}