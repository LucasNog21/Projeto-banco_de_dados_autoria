async function updatePassword(){
    try{
        const response = await fetch(`http://localhost:8000/trocar_senha/${id_usuario}`,{
            method:'PUT',
            headers:{'Content-Type': 'application/json',},
            body: JSON.stringify({
                id: idUsuario,
                senha: document.querySelector("#newpassword").value,
            }),
        })

        if (!response.ok) {
            throw new Error('Erro ao deletar')
        }
    } catch(erro) {
        console.Error(erro)
    }
}