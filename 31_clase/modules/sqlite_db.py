from sqlalchemy import create_engine , text

class SqliteDataBase:
    def __init__(self, path_cnx: str, table:str = 'pelicula'):

        path_cnx = f'sqlite:///{path_cnx}'

        self.engine = create_engine(path_cnx)
        self.table = table
        query  = f"""
        CREATE TABLE IF NOT EXISTS {self.table} (
            id_pelicula INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre VARCHAR(254),
            duracion INT,
            genero VARCHAR(100),
            release_date DATE
        )
        """
        self._query_runner(query)

    def _query_runner(self, query) -> None:
        with self.engine.connect() as conn:
            result = conn.execute( text(query))
            conn.commit()
        print("sucess! the database is created")

    

    def get_all_pelicula(self):
        query = f"SELECT * FROM {self.table}"

        with self.engine.connect() as conn:
            result = conn.execute(text(query)).fetchall()

        return result

    def get_one_pelicula(self, nombre_peli):
        query = f"""
        SELECT
            *
        FROM {self.table}
        WHERE 
            nombre LIKE '%{nombre_peli}%'
        """

        with self.engine.connect() as conn:
            result = conn.execute(text(query)).fetchone()

        return result


    def insert_one_pelicula(self, pelicula):
        query_insertar:str = pelicula.query_pelicula(self.table)
        self._query_runner(query_insertar)
    