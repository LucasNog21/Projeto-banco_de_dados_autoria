document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("login-form");
    if (!form) {
        console.error("Erro: O elemento #login-form não foi encontrado.");
        return;
    }

    form.addEventListener("submit", async function (event) {
        event.preventDefault(); // Evita o recarregamento da página

        console.log("Formulário enviado!");

        const get_email = document.getElementById("email").value;
        const get_senha = document.getElementById("password").value;
        const message = document.getElementById("message");

        if (!email || !password) {
            message.textContent = "Preencha todos os campos.";
            message.style.color = "red";
            return;
        }

        console.log("Iniciando fetch...");

        try {
            const response = await fetch("http://localhost:8000/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ 
                    email: get_email, 
                    senha: get_senha })
            });

            console.log("Fetch concluído, processando resposta...");

            const data = await response.json();
            console.log("Resposta da API:", data);

            if (data.status === 200) {
                console.log("Login bem-sucedido!");
                // Redirecionamento, se necessário:
                // window.location.href = "/dashboard";
                try{
                    const response = await fetch(data.url, {
                        method:"GET",
                        headers: {
                            "Accept": "text/html"  // Especificando que esperamos uma resposta em HTML
                        }
                    });
            
                    if (!response.ok) {
                        throw new Error("Erro ao obter o conteúdo da página");
                    }
            
                    // Obtendo o conteúdo HTML da resposta
                    const html = await response.text();
            
                    // Exibindo o conteúdo no console ou fazendo algo com ele
                    console.log(data.url);
                    setTimeout(function() {
                        window.location.href = `${data.url}`;
                      }, 2000);
                } catch(erro) {
                    console.error(erro)
                }
            } else {
                message.textContent = data.message;
                message.style.color = "red";
            }
        } catch (error) {
            console.error("Erro na requisição:", error);
            message.textContent = "Erro ao tentar logar.";
            message.style.color = "red";
        }
    });
});

async function displayHtml(url) {
    try {
        const dir = await fetch(`${url}`)
        const data = await dir.json()
        return data
    } catch (error) {
        console.log("Erro no dir")
    }
}