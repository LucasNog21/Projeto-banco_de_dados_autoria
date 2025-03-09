async function getLen() {
    try {
        const response = await fetch("http://localhost:8000/get_len");
        const data = await response.json();
        return data.Tamanho; 
    } catch (error) {
        console.error(error)
    }
}

async function cadastrar_usuarios() {


    const nomeCompleto = document.querySelector("#get_nome_completo").value;
    const nomeArray = nomeCompleto.trim().split(" ");
    const nome = nomeArray[0];
    const sobrenome = nomeArray.slice(1).join(" ");

    try {

        let idUsuario = await getLen() + 1

        const response = await fetch("http://localhost:8000/cadastro", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                id: idUsuario || 98,
                usuario: document.querySelector("#get_usuario").value,
                senha: document.querySelector("#get_senha").value,
                nome: nome,
                sobrenome: sobrenome,
                cargo: "usuario",
                email: document.querySelector("#get_email").value,
            }),
        });

        const dados = await response.json()

        console.log(dados)
    } catch (error) {
        console.error("Erro na requisição: ", error)
    }
}