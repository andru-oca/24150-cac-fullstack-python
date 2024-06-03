# def send_email(user) -> None:
#     print(f"................ mensaje enviado a -->{user['email']} !")


def send_email(user):
    texto:str = f"""
    Este va a ser un email
    que solo lo puede recibir:
    >> {user['apellido']}
    >> email: {user['email']}
    >> password:{'*'*len(user['pwd'])}
    """
    print(texto)