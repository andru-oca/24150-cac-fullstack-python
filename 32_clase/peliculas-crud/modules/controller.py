from sqlalchemy import text

class Controller:
    
    def get_all_pelicula(self):
        query = f"SELECT * FROM {self.table} WHERE status=True"

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
                AND status=True
        """

        with self.engine.connect() as conn:
            result = conn.execute(text(query)).fetchone()

        return result

    def insert_one_pelicula(self, pelicula):
        query_insertar:str = pelicula.query_pelicula(self.table)
        self._query_runner(query_insertar)

    def update_in_database(self,nombre,modified_field, value_field) -> str:
        query:str = ""
        
        if modified_field == 'duracion':
            query = f"""
            UPDATE {self.table}
                SET {modified_field} = {value_field}
            WHERE 
                nombre = '{nombre}'
            """
        else:
            query = f"""
            UPDATE {self.table}
                SET {modified_field} = '{value_field}'
            WHERE 
                nombre = '{nombre}'
            """
        self._query_runner(query)

    def delete_row_in_db(self, nombre):
        query:str = f"""
        DELETE FROM {self.table}
        WHERE 
            id_pelicula = (
                            SELECT
                                id_pelicula
                            FROM  {self.table}
                            WHERE 
                                nombre = '{nombre}'
                            LIMIT 1
                            )
        """
        self._query_runner(query)
    