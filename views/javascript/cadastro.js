const email = document.querySelector("get_email")
const senha = document.querySelector("get_senha")
const nome = document.querySelector("get_nome_completo")
const username = document.querySelector("get_")


async function GetLastId() {
    try {
        let response = await fetch("localhost:8000/get_len");
        let dados = await response.json();
        return dados.Tamanho
    } catch (erro) {
    console.error("Erro na requisição:", erro);
    }
    }

async function cadastrar_usuarios() {

    try {
        const response = await fetch("localhost:8000/cadastro", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            id_usuario: parseInt(GetLastId()),
            usuario: document.querySelector("#get_email").value,
            senha: document.querySelector("#get_senha").value,

            }),
        });
        const dados = await response.json();
        console.log(dados);
    } catch (erro) {
        console.error("Erro na requisição:", erro);
        }
}

criarPost();