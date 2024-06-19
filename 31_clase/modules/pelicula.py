class Pelicula:
    def __init__(self,nombre,duracion,genero,release_date):
        self.nombre =   nombre 
        self.duracion = duracion 
        self.genero =   genero 
        self.release_date = release_date
    
    def query_pelicula(self, table:str) -> str:
        return f"""
            INSERT INTO {table} 
            (nombre, duracion, genero, release_date) 
            VALUES
            ('{self.nombre}',{self.duracion},'{self.genero}','{self.release_date}') ;"""

    def delete_query(self , table:str ) -> str:
        return f"""
        DELETE FROM {table}
        WHERE 
            nombre = '{self.nombre}'
        """

    def update_query(self,table, modified_field, value_field) -> str:
        if modified_field == 'duracion':
            return f"""
            UPDATE {table}
                SET {modified_field} = {value_field}
            WHERE 
                nombre = '{self.nombre}'
            """

        return f"""
        UPDATE {table}
            SET {modified_field} = '{value_field}'
        WHERE 
            nombre = '{self.nombre}'
        """