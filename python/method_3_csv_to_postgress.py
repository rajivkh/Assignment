
## This scipt will copy csv data to postgress database 
## In this scipt, we will use pandas dataframe and chunksize to split the huge file



import csv
import json
import psycopg2
import pandas as pd

## Reading the credentials for Postgress Database from a different JSON File.

json_path = r'C:sample\database_env.json'
with open(json_path) as json_data:
    env_data = json.load(json_data)

## Hold the credentials in separate variables

v_host = env_data['host']
v_database = env_data['database']
v_port = env_data['port']
v_username = env_data['user']
v_password = env_data['password']


## Connecting to Postgress Database

try:
    print('Connecting to the database')
    conn = psycopg2.connect(dbname=v_database, host=v_host, port=v_port,\
    user=v_username, password=v_password)
    cur = conn.cursor()
    print("Connection successfully to Database")
except Exception as e:
        print("Error: {}".format(str(e)))
        sys.exit(1)


# Open csv file as stream and write to SQL, appending as you go:

for chunk in pd.read_csv('filename.csv', chunksize = 1000):
    chunk.to_sql(name = 'huge_table',
                 con = conn,
                 if_exists = 'append')

conn.close()                 