from modules.sqlite_db import SqliteDataBase
from modules.controller import Controller

class ManagerSqlite(SqliteDataBase,Controller):
    def __init__(self, path_cnx: str):
        super().__init__(path_cnx)
