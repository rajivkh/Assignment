
## This scipt will copy csv data to postgress database 


import csv
import json
import psycopg2

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

## Reading the csv file and loading the data into database

with open('user_accounts.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader) # Skip the header row.
    for row in reader:
        cur.execute(
        "INSERT INTO users VALUES (%s, %s, %s, %s)",
        row
    )
conn.commit()
conn.close()
