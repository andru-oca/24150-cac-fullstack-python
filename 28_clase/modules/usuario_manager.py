from .usuario import Usuario

class UsuarioManager:
    def __init__(self, db = []):
        self.db = db

    def controller_save_user(self, usuario: Usuario):
        if isinstance(self.db,list):
            self.db.append(usuario)
            print(f"se ha agregado el siguiente usuario: {usuario.display_name()}")
            return 
        
        print("No se puede guardar, por ahora con un append")
        return 
    
    def controller_read_user(self, apellido:str) -> Usuario:
        if isinstance(self.db,list):
            for usuario in self.db:
                if usuario.apellido == apellido:
                    print("se ha encontrado el usuario")
                    return usuario
            
            print({"error": "usuario no encontrado","status":400})
            return

        print("No se puede iterar esta db por que no es una lista")
        return

    def controller_update_user(self, apellido: str , new_nombre:str):
        user:Usuario = self.controller_read_user(apellido)

        if user:
            user.update_nombre(new_nombre)
            return
        print("No se pudo actualizar nada")
        return 

    def controller_delete_user(self, apellido: str) -> None:
        user:Usuario = self.controller_read_user(apellido)
        user_index:int = None

        if user:
            for index,usuario in enumerate(self.db):
                if usuario.apellido == apellido:
                    user_index = index
                    break

            self.db.pop(user_index)
            print("Se ha eliminado con exito")
            return
        
        print("No se pudo borrar nada")
        return 

            