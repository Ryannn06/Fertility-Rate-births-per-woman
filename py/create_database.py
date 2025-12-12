from sqlalchemy import create_engine, text


def create_database():
    try:
        username = 'postgres'
        password = 'gelo120601'
        db_name = 'fertility_rate_db'

        connection_string = f'postgresql://{username}:{password}@localhost/'
        db_engine = create_engine(connection_string)

        with db_engine.connect().execution_options(isolation_level="AUTOCOMMIT") as connection:
            connection.execute(text(f"CREATE DATABASE {db_name};"))

    except Exception as e:
        print(f"An error occurred: {e}")

create_database()

