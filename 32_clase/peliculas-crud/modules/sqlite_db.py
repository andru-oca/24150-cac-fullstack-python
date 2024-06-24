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
            release_date DATE , 
            status BOOLEAN DEFAULT True
        )
        """
        self._query_runner(query)

    def _query_runner(self, query) -> None:
        with self.engine.connect() as conn:
            result = conn.execute( text(query))
            conn.commit()
        print("sucess! the database is created")



