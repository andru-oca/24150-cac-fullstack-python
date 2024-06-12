import sqlite3
from sqlalchemy import create_engine
from sqlalchemy.sql import text


def insert_data_into_table(
    query:str
):
    engine = create_engine("sqlite:////workspaces/24150-cac-fullstack-python/30_clase/users.db")

    with engine.connect() as conn:
        result = conn.execute( text(query))
        conn.commit()
    print("sucess! inserted!")



def create_database_sqlite(name:str):

    conn = sqlite3.connect(name)
    cursor = conn.cursor()

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS products
        (
        dni INTEGER PRIMARY KEY,
        nombre VARCHAR(100),
        apellido VARCHAR(100),
        email VARCHAR(100),
        password VARCHAR(100)
        );
        """
    )

    conn.commit()


def main():
    # create_database_sqlite("users.db")
    query:str = f"""
    INSERT INTO products 
    (
        dni
    ,   nombre
    ,   apellido
    ,   email
    ,   password)
    VALUES
    (9999, 'miguel','rasputin','rasputin@cac_company.edu.ar', '123')

    """
    insert_data_into_table(query)


if __name__ == "__main__":
    main()
