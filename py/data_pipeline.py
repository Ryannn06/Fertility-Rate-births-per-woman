import pandas as pd
import os
from sqlalchemy import create_engine

def load_data(
        file_path='C:/Users/ryana/Documents/Github/Fertility-Rate-births-per-woman/dataset',
        file='children-born-per-woman.csv') -> pd.DataFrame:

    try:
        """Load data from a CSV file into a pandas DataFrame."""
        return pd.read_csv(os.path.join(file_path, file))
    
    except FileNotFoundError as e:
        print(f"File not found: {e}")
        return None


def clean_data(data: pd.DataFrame) -> pd.DataFrame:
    try:
        """Clean and preprocess the fertility rate data."""
        df = data.copy()

        """Standardize column names to lowercase and replace spaces with underscores."""
        df.columns = ['country', 'code', 'year', 'fertility_rate']

        """Format country names to title case and strip whitespace."""
        df['country'] = df['country'].str.title().str.strip()

        """Format country codes to uppercase and strip whitespace."""
        df['code'] = df['code'].str.upper().str.strip()

        """Convert year to integer type."""
        df['year'] = df['year'].astype(int)

        """Convert fertility_rate to float type."""
        df['fertility_rate'] = df['fertility_rate'].astype(float)
    
        """Handle duplicate entries."""
        df.drop_duplicates(subset=['country', 'year'], keep='last', inplace=True)
        
        return df

    except Exception as e:
        print(f"An error occurred during data cleaning: {e}")
    
def load_data_to_db(data: pd.DataFrame) -> None:
    username = 'postgres'
    password =  'gelo120601'
    db_name = 'fertility_rate_db'   

    connection_string = f'postgresql://{username}:{password}@localhost/{db_name}'
    db_engine = create_engine(connection_string)

    with db_engine.connect() as connection:
        data.to_sql('fertility_rate', con=connection, if_exists='replace', index=False)

        print("Data loaded into the database successfully.")
        

data_df = clean_data(load_data())

if data_df is not None:
    load_data_to_db(data_df)