async function redirection(url) {
    const id = await getCurrentURL(); // Aguarda o retorno da função assíncrona

    setTimeout(function() {
        window.location.href = `${url}/${id}`;
    }, 1000);
}

async function getCurrentURL() {
    let url = window.location.href;
    const segments = url.split('/'); // Divide a URL em partes usando "/"
    return segments.pop(); // Retorna apenas o ID
}