def get_user() -> dict:
    usuario:dict = {}
    usuario["nombre"] = input("Ingrese su nombre:\n")
    usuario["apellido"] = input("Ingrese su apellido:\n")
    return usuario