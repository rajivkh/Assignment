
## This scipt will copy csv data to postgress database 
## we are using "COPY" command as recommended.


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


## In this step, we will connect to Postgress and then we we use the "COPY" Command to exeucte the same

def load_big_table(v_file_name,v_table_name)
    try:
        print('Connecting to the database')
        conn = psycopg2.connect(dbname=v_database, host=v_host, port=v_port,\
        user = v_username, password=v_password)
        cur = conn.cursor()
        print("Connection successfully to Database")
        f = open(v_file_path, "r")
        cur.copy_expert("copy {} from CSV HEADER QUOTE '\"'".format(v_table_name), f)
        cur.execute("commit;")
        print("Loaded data into {}".format(v_table_name))
        conn.close()
        print("Database connection closed.")
    except Exception as e:
        print("Error: {}".format(str(e)))
        sys.exit(1)

## execute the functions with 2 input parameters 
## first parameter is for the environment file 
## second parameter is the table name


load_big_table(v_file_name,v_table_name)
