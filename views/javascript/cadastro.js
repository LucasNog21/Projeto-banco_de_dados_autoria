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
    try {
        let idUsuario = await GetLastId(); // Agora espera a resposta corretamente

        let nomeCompleto = document.querySelector("#get_nome_completo").value.trim();
        let [nome, ...sobrenomeArray] = nomeCompleto.split(" ");
        let sobrenome = sobrenomeArray.join(" "); // Junta os sobrenomes caso existam

        const response = await fetch("http://localhost:8000/cadastro", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                id_usuario:  parseIsnt(idUsuario),
                usuario: String(document.querySelector("#get_username").value.trim()),
                senha: String(document.querySelector("#get_senha").value.trim()),
                nome: nome || "", // Garante que não seja `undefined`
                sobrenome:"rafael", //sobrenome || "",
                cargo: "usuario",
                email: String(document.querySelector("#get_email").value.trim()) // Corrigido `.value`
            }),
        });

        const dados = await response.json();
        console.log("Cadastro realizado com sucesso:", dados);
    } catch (erro) {
        console.error("Erro na requisição:", erro);
    }
}

// Chamada da função (não existia antes)
cadastrar_usuarios();
