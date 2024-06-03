# from modules import get_user
# from modules import add_email_pwd
# from modules import save_user_db
# from modules import add_custom_msg
# from modules import send_email

from modules import get_user \
                    ,   add_email_pwd \
                    ,   save_user_db \
                    ,   add_custom_msg \
                    ,   send_email

def main():

    database:list = []

    user = get_user()

    user = add_email_pwd(user)

    option:str = input("Desea guardar al usuario:\n>> 'y' default\n")

    save_user_db(user=user, option=option, database=database)

    custom_msg:str = input("Agrege el mensaje para el nuevo usuario")

    user = add_custom_msg(user, custom_msg)
    
    send_email(user)

    print(database)

if __name__ == "__main__":
    main()

