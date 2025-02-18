user = {
    "email": "email@email.com",
    "senha": "123",
}

user_length = len(user)
email = 'email@email.com'
senha = '123'

def teste(dic = user, email = email, senha = senha):
    for user_email in dic:
        if email == dic[user_email]  and  senha == dic[user_email]:
            return {'message': "Usuario encontrado"}
        else:
            print(user_email, dic[user_email])
            return {'message': "Usuario não existe ou foi digitado errado k"}
        

def teste2():
    for i in user:
        print(user[i])


print(teste(user, email, senha))
#teste2()