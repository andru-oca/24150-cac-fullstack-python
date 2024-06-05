class Usuario:
    email:str
    pwd:str = "Pass123!"

    def __init__(self, nombre, apellido) -> None:
        self.nombre = nombre
        self.apellido = apellido
        self.email:str = None

    def set_email(self, nombre_empresa:str) -> None:
        self.email = f"{self.nombre}@{nombre_empresa}.edu.bue.ar"
        print("Se agregado el email de la empresa")

    def display_name(self):
        return self.nombre
    
    def update_nombre(self, new_nombre:str) -> None:
        self.nombre = new_nombre
        print("eh! me actualizaste!")

    def send_email(self) -> None:
        texto:str = f"""
        Este va a ser un email
        que solo lo puede recibir:
        >> {self.apellido}
        >> email: {self.email}
        >> password:{'*'*len(self.pwd)}
        """
        print(texto)
