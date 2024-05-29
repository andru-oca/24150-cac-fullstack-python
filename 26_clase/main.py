# -- CREACION DE USUARIOS TENIENDO EN CUENTA LAS ITERACIONES:


# # ingrese_usuario 
# nombre:str = input("ingrese su nombre:\t")
# apellido:str= input("ingrese su apellido:\t")
# print("usuario creado: " , nombre , apellido)

# # asignar_mail
# nombre_empresa:str = "empresaCodoaCodo"
# email_generado:str = nombre+"@"+nombre_empresa+".com"
# crear_clave:str = "Pass123!"

# print("el usuario tiene asigando el siguiente email:")
# print(email_generado)
# print("*"*len(crear_clave))

# # crear_mensaje_customizado
# body:str = "<h1> Bienvenido, " + nombre + "</h1>"
# print("mensaje a enviar")
# print(body)
# # enviar_mail
# print("................ mensaje enviado a -->"+nombre+"!")



# FUNCTIONS

def asignar_mail(nombre:str ) -> dict:
    empresa:str = "cac_company"

    return {
        "empresa": empresa,
        "email_empresa": f"{nombre}@{empresa}.edu.bue.ar",
        "pass": "Pass123!"
    }

OPCIONES_YES = ['si','s','yes','y']
base_datos:list = []
flag:bool = True

while flag:
    usuario:dict = {}
    usuario["nombre"] = input("Ingrese su nombre:\n")
    usuario["apellido"] = input("Ingrese su apellido:\n")
    data_retorno = asignar_mail(usuario["nombre"])
    usuario = {**usuario,**data_retorno}

    opcion:str = input("Desea agregar otro usuario?:\n>>> ") 
    if opcion.lower() not  in OPCIONES_YES:
        print("No va a seguir ingresando otro usuario")
        flag = False
    
    desea_guardar = input("desea guardar este ultimo usuario?\n>>> ")
    if desea_guardar.lower() in OPCIONES_YES:
        base_datos.append(usuario)
        print("Usuario guardado exitosamente")

else: 
    for usuario in base_datos:
        for key,valor in usuario.items():
            print(f"{key}: {valor}")



import csv

keys = base_datos[0].keys()

with open('usuarios_del_sistema.csv', 'w', newline='') as output_file:
    dict_writer = csv.DictWriter(output_file, keys)
    dict_writer.writeheader()
    dict_writer.writerows(base_datos)























