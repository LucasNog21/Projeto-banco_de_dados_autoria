const csvtojson = require('csvtojson');

csvtojson()
    .fromFile('Tecnoautoritarismo.csv')
    .then((jsonData) => {

        let sim = 0;
        let nao = 0;

        // Loop através das linhas
        jsonData.forEach(function(row) {
            const sabe_tecnoautoritarismo = 'sabe_o_que_e_tecnoautoritarismo'; // Nome correto da coluna

            // Verificando as respostas
            if (row[sabe_tecnoautoritarismo] === 'Não') {
                nao += 1;
            } else if (row[sabe_tecnoautoritarismo] === 'Sim') {
                sim += 1;
            }

        
        })
        return [sim,nao]
    })

console.log(csvtojson())