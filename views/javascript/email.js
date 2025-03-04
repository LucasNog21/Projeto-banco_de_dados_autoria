const nodemailer = require('nodemailer');

const transport = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
        user: 'projeto.thiago.bdaw@gmail.com',
        pass: 'bdawprojetothiago'
    }
});

transport.sendMail({
    from: 'Mensagem vinda de: <projeto.thiago.bdaw@gmail.com>',
    to: 'jose.sarmento@escolar.ifrn.edu.br',
    subject: 'Mensagem aleatorio',
    html: '<h1>CELOKO NUM COMPENSA</h1>',

})
.then(() => console.log('Email enviado com sucesso'))
.catch((err) => console.log('Erro em enviar o email.', err))

