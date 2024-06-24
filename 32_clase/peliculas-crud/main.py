from modules.manager import ManagerSqlite
from modules.pelicula import Pelicula


def main():
    manager = ManagerSqlite("pelis.db")

    texto:str = f"""
        Bienvenidos a rompe cabezas company
        Elija una opcion:
            - 1: Insertar Pelicula
            - 2: Borrar Pelicula
            - 3: Modificar Pelicula
            - 4: Mostrar Peliculas
            - 5: Salir
    """
    flag:bool = True

    while flag:
        option:str = input(texto)

        if option == '1':
            nombre = input("ingrese nombre de pelicula:\n")
            duracion = int(input("ingrese la duracion:\n")) 
            genero = input("ingrese genero de la pelicula:\n")
            date_release =  input("ingrese fecha de la pelicula:\nformat: yyyy-mm-dd\n")
            pelicula = Pelicula(nombre,duracion,genero,date_release)
            manager.insert_one_pelicula(pelicula)
            

        elif option == '4':
            for pelicula in manager.get_all_pelicula():
                print(pelicula)            
        else:
            print("Usted ha decido salir")
            flag = False


if __name__ == "__main__":
    main()