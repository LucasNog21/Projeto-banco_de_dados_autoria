user = {
    "email": "email@email.com",
    "senha": "123",
}

user_length = len(user)
email = 'email@email.com'
senha = '123'

def teste(dic = user, email = email, senha = senha):
    if email == dic['email'] and senha == dic['senha']:
        return True
    else: 
        print(email,)
        return False  
        

def teste2():
    for i in user:
        print(user[i])
    
print(user['email'])
print(teste(user, email, senha))
#teste2()