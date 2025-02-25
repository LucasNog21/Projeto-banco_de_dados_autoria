user = {
    "email": "email@email.com",
    "senha": "123",
}

user_length = len(user)
email = 'email@email.com'
senha = '123'

def teste(dic = user, email = email, senha = senha):
    for user_email in dic:
        if email == user_email  and  senha == dic[user_email]:
            return True
        else:
            print(user_email, dic[user_email])
            return False    
        

def teste2():
    for i in user:
        print(user[i])


print(teste(user, email, senha))
#teste2()