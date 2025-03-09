async function login() {
        document.getElementById("login-form").addEventListener("submit", async function(event) {
        event.preventDefault();  // Evita recarregar a página

        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        const message = document.getElementById("message");

        const response = await fetch("http://127.0.0.1:8000/", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();

        if (data.success) {
            // Agora fazemos um segundo fetch para carregar a home
            window.location.href = data.redirect_url;
        } else {
            message.textContent = data.message;  // Exibe erro se for inválido
            message.style.color = "red";
        }
    })
}