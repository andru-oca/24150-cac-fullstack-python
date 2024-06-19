from modules.sqlite_db import SqliteDataBase

class ManagerSqlite(SqliteDataBase):
    def __init__(self, path_cnx: str):
        super().__init__(path_cnx)




