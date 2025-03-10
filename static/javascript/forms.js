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
        });
        const ctx = document.getElementById('grafico1');

new Chart(ctx, {
    type: 'pie',
    data: {
    labels: ['Sim', 'Não'],
    datasets: [{
        label: 'Sabe o que é tecnoautoritarismo',
        data: [sim, nao],
        borderWidth: 1
    }]
    },
    options: {
    scales: {
        y: {
        beginAtZero: true
        }
    }
    }
});
    })
    .catch((err) => {
        console.error('Erro ao converter CSV:', err);
    });

