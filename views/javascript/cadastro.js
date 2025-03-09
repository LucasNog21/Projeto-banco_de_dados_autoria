const BASE_URL = "https://localhost:8000"
const resultado = document.querySelector("#resultado")

function checkValue(input) {
    if (input.value.trim() !== '') {
        input.classList.add('has-value');
    } else {
        input.classList.remove('has-value');
    }
}

async function verificarEmail(email) {
    try {
        const response = await axios.get(`${BASE_URL}/recuperar_email/${email}`);
        resultado.innerHTML = "<p> True </p>" 
        return response.data;
    } catch (error) {
        console.error("Erro ao verificar email:", error);
        resultado.innerHTML = "<p> false </p>" 
        return false;
    }
}

async function getLen() {
    fetch("http://localhost:8000/get_len")
    .then(response => response.json())
    .then(data => {
    console.log(data.Tamanho);
})
.catch(error => console.error("Erro ao buscar os dados:", error));
}

async function cadastrar_usuarios() {

    let email_existe = verificarEmail("email@email")

    if (email_existe == true) {
        try {
            const response = await fetch("http://localhost:8000/cadastro", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    id: 11,
                    usuario: "string",
                    senha: "string",
                    nome: "string",
                    sobrenome: "string",
                    cargo: "string",
                    email: "string",
                }),
            });
        
            const dados = await response.json()
        
            console.log(dados)
        } catch (error) {
            console.error("Erro na requisição: ", error)
        }
    } else {
        alert("Algo deu errado...")
    }

    
}