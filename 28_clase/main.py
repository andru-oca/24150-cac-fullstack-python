from modules import Usuario
from modules import UsuarioManager as Manager

def main():
    marcos: Usuario = Usuario("Marco Aurelio" , "Romulo")
    mariela: Usuario = Usuario("Marielena Fussenecco", "Pirula")

    marcos.set_email("cac_company")
    mariela.set_email("trumpeter_vinos")


    crud = Manager()

    crud.controller_save_user(marcos)
    crud.controller_save_user(mariela)
    print(crud.db)

    crud.controller_delete_user("Romulo")
    print(crud.db)


if __name__ == "__main__":
    main()