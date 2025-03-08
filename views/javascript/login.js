async function login() {
    try {
        let email = document.getElementById('email').value;
        let password = document.getElementById('password').value;
        
        const response = await fetch("http://localhost:8000/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                email: email,
                password: password
            }),
        });
        const dados = await response.json();
        window.alert(dados)
    } catch (erro) {
        window.alert("deu errado")
    }
}

login()