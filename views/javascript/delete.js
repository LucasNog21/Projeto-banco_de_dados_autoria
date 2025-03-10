async function deleteUser() {
    try{
        const response = await fetch(`http://localhost:8000/delete_usuarios/${id_usuario}`,{
            method:'DELETE',}
        );
        if (!response.ok) {
            throw new Error('Erro ao deletar')
        }
        alert('Deletado com sucesso')
    } catch(erro) {
        console.Error(erro)
    }
}
