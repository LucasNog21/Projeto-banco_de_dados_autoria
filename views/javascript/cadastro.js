async function GetLastId() {
    try {
        let response = await fetch("http://localhost:8000/get_len"); // Corrigido HTTP
        let dados = await response.json();
        return dados.Tamanho;
    } catch (erro) {
        console.error("Erro na requisição:", erro);
        return 0; // Retorna um valor padrão em caso de erro
    }
}

async function cadastrar_usuarios() {
    
    console.log("awdadawdaws")
    let idUsuario = await GetLastId(); // Agora espera a resposta corretamente

    //let nomeCompleto = document.querySelector("#get_nome_completo").value;
    //let [nome, ...sobrenomeArray] = nomeCompleto.split(" ");
    //let sobrenome = sobrenomeArray.join(" "); // Junta os sobrenomes caso existam
    
    try {
        const response = await fetch("https://localhost:8000/cadastro", {
            method: "POST",
            headers: {
            "Content-Type": "application/json",
            },
            body: JSON.stringify({
                id_usuario: 10,
                username: "string",
                senha: "string",
                nome: "string",
                sobrenome: "string",
                cargo: "string",
                email: "string"
            }),
        });

        const dados = await response.json();
        console.log(dados)
        console.log("Cadastro realizado com sucesso:", dados);
    } catch (erro) {
        console.error("Erro na requisição:", erro);
    }
}

cadastrar_usuarios()