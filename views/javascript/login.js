async function get_login() {

    const email = "email@email";
    const senha = "123";

    try {
        let response = await fetch("http://localhost:8000/login/${email}/${senha}");
        const data = await response.json();
        console.log(data);
        return data;
    } catch (error) {
        console.error(error)
    }

}

async function login() {

    let response = await get_login()

    if (response == 200){
        console.log("logado")
    } else {
        console.log("paia")
    }

}