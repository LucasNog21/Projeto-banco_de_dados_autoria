from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
import asyncpg
from pydantic import BaseModel
from datetime import datetime
from fastapi import HTTPException

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

app.mount("/static", StaticFiles(directory="views/static"), name="static")

async def get_db_connection():
    return await asyncpg.connect(
        user='postgres',
        password='SQL',
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
    with open('views/html/index.html', 'r', encoding='utf-8') as file:
        html_content = file.read()

    return HTMLResponse(content=html_content)


#RECEBER ELOGIOS DE THIAGO, COMPARACAO NAO ESTÁ FUNCIONANDO

@app.post('/login')
async def login_user(request: LoginRequest):
    if request.email == "email@email.com" and request.senha == "123":
        return {"status": 200, "message": "Login bem-sucedido"}
    else:
        raise HTTPException(status_code=401, detail="Email ou senha incorretos")

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


@app.get('/recuperar_email/{email}')
async def get_login(email: str):
    conn = await get_db_connection()
    row = await conn.fetch("SELECT email FROM usuarios WHERE email = $1;", email)
    await conn.close()

    if len(row) == 0:
        return False #Não existe esse email
    else:
        return True #Existe esse email

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

@app.get('/noticias')
async def get_noticias():
    conn = await get_db_connection()
    row = await conn.fetch('SELECT * FROM noticias ORDER BY id_noticia')
    await conn.close()
    noticias = []
    for i in row:
        noticias.append(f"id_noticia: {i['id_noticia']}, id_autor: {i['id_autor']}, conteudo_noticia: {i['conteudo_noticia']}, data_publicacao: {i['data_publicacao']}")

    return {'Noticias: ':noticias}

#provavelmente dando erro devido ao tipo date do $4
@app.post('/criar_noticias')
async def post_noticias(new : Noticia):
    data_formatada = datetime.strptime(new.data_publicacao,'%Y-%m-%d')

    conn = await get_db_connection()
    await conn.execute(
        "INSERT INTO noticias (id_noticia, id_autor, conteudo_noticia, data_publicacao) VALUES($1, $2, $3, $4)",
        new.id_noticia, new.id_autor, new.conteudo_noticia, data_formatada
    )
    await conn.close()
    return {'message': 'show the balls'}

@app.delete('/delete_noticias')
async def delete_noticias(id_noticia : int):
    conn = await get_db_connection()
    await conn.execute(
        'DELETE FROM noticias WHERE id_noticia = $1', id_noticia)
    
    await conn.close()
    return {'message' : 'noticia deletada'}

@app.get('/get_respostas')
async def get_respostas():
    conn = await get_db_connection()
    row = await conn.fetch('SELECT * FROM pesquisa_tecnoautoritarismo')
    await conn.close()
    respostas = []
    for i in row:
        respostas.append(f"carimbo: {i['carimbo']}, conhece_tecnoautoritarismo: {i['conhece_tecnoautoritarismo']}, conceito_tecnoautoritarismo: {i['conceito_tecnoautoritarismo']}, conhece_lgpd_marco_civil: {i['conhece_lgpd_marco_civil']}, conceito_lgpd: {i['conceito_lgpd']},presenciou_tecnoautoritarismo: {i['presenciou_tecnoautoritarismo']},caso_observado: {i['caso_observado']},considera_autoritarismo_digital_violento: {i['considera_autoritarismo_digital_violento']}, impacto_tecnoautoritarismo: {i['impacto_tecnoautoritarismo']},leis_eficazes: {i['leis_eficazes']}, leis_efetivamente_aplicadas: {i['leis_efetivamente_aplicadas']},")
    return {'Respostas: ': respostas}