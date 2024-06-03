def save_user_db(**kwargs) -> None:
    """
    Saves a user dictionary to a database list.

    Parameters:
    - **kwargs (dict): Arbitrary keyword arguments.
        - user (dict): A dictionary containing user information to be saved.
        - database (list): A list representing the database where the user information will be stored.
        - option (str, optional): A flag indicating whether to save the user to the database. Default is 'y'.

    Returns:
    - None

    The function appends the user dictionary to the provided database list if the option is set to 'y'.
    If the option is different from 'y', the function does nothing.
    """
    user: dict = kwargs["user"]
    database: list = kwargs["database"]
    option: str = kwargs.get("option","y")

    option: str = None if option == '' else option

    if option != 'y':
        return

    database.append(user)

