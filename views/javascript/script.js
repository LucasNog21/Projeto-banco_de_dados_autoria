async function login(){
    try{    
        let response = await fetch('https://localhost:8000/login')
        let dados = await response.json()
        console.log(dados)
        //let email = document.getElementById('email')
        //let password = document.getElementById('password')    
    } catch (erro) { 
        console.error('erro na requisição', erro)
    }
    
}

