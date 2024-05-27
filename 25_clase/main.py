"""
n1:int =    int(input("Ingrese el primer valor:\n"))
n2:int =    int(input("Ingrese el segundo valor:\n"))

print(
    type(n1),
    type(n2)
)

# Esto es para hacer la suma
print("El valor de la suma es:\t",n1 + n2)

resta:int = n1 - n2
multiplicacion:int = n1 * n2

if n2 == 0:
    print("Zapallo, como vas a dividir por 0??")
else:
    division:float = n1 / n2
    print("La division es:\t", division)


print("La resta es:\t", resta)
print("La multiplicacion es:\t", multiplicacion)
"""


# Tengo una empresa con la cuenta: empresaCodoaCodo
# Necesito ue se registren 10 personas por dia, y esas personas,
# asignarles un email y que automaticamente al terminar el dia 
# me envie el email de invitacion, su password generica.


# ingrese_usuario 
nombre:str = input("ingrese su nombre:\t")
apellido:str= input("ingrese su apellido:\t")
print("usuario creado: " , nombre , apellido)

# asignar_mail
nombre_empresa:str = "empresaCodoaCodo"
email_generado:str = nombre+"@"+nombre_empresa+".com"
crear_clave:str = "Pass123!"

print("el usuario tiene asigando el siguiente email:")
print(email_generado)
print("*"*len(crear_clave))

# crear_mensaje_customizado
body:str = "<h1> Bienvenido, " + nombre + "</h1>"
print("mensaje a enviar")
print(body)
# enviar_mail
print("................ mensaje enviado a -->"+nombre+"!")






