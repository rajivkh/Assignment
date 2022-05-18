
## Title

Assignment for Python and SQL



## Environment 

Environment 
Oracle 12g or above

Python 3.5 or above



## Documentation

## Python Task 1:
Considered following assumption and provided the solution accordingly

## Assumption: 
1.	Database is on Cloud environment e.g Relational Database Service (Postgress) . As the database is on cloud, we can take advantage of horizontal and vertical scaling very quickly as compared to on-premise infrastructure.
Horizontal Scaling is normally used for read heavy operations. Vertical Scaling can be used to process higher loads.  In this way we can keep the existing pool of computing resource online while adding more to what we already have.
2.	Database is already setup with proper credentials and access.
3.	Tables structures are already created in database.
4.	File is in correct format and there is no need for any cleanup activities and there no duplicates and no filtering are required All records are valid ones. 
5.	File is in uncompressed format. 

Scenario 1: Frequency:  One time data load for huge file or either once a week. 
Assuming this is a one-time data load for huge file, we can take advantage of vertical scaling. In this way it can optimized for equal number of read and writes throughput. 
AWS provided option for automatic scaling and we can setup setting that if the CPU > 80%, scale up the server.  Advantage is it does not need any downtime.

Scenario 2: Frequency:  Daily load for huge file
This process will work for scenario 1 too but we do not want to over engineer it if the options are available.  Alternatively we can follow the below process too:-
1.	We can also load using python by splitting it into multiple files.
2.	Postgress provides an option to use the “COPY” command which seems to be more efficient way to load the data. Alternatively, we can also loop each record and load the same
3.	We can split this huge file and then load it parallel by taking advantage of PySpark architecture of driver and executors. We can convert to parquet and then use python pandas as this is more efficient with parquet format.







## Python Task 2 
We had a similar situation where we had to compare internal and external data for given customer and merge some of the columns.
The first step is to ensure that the Account Name is matching. In order to ensure it is matching there were couple of additional columns used for Country / State / City / Postal Code / Latitude / Longitude

Steps: 
1.	We loaded the data in Oracle database in two separate tables.
2.	We used the JARO_WINKLER Function provided in Oracle.
3.	We evaluated the distance/value for each column separately and then took the sum of the values. 
4.	If the sum of the values > 95% then it would be a close match.

From the SQL automation perspective, we were able to match on 83% of records. The same exercise was also done by Machine Learning and they were able to match up to 86%.


## SQL Task 
All SQL Task are executed with Oracle as database








## Python Assignment


For Python Assignment 1, three different approaches were implemented.

Also as a best practice the credentials should be stored in a different file. Hence I have used json to store the credentials for Postgress database.

1. Using the COPY command as recommended in postgress documentation
2. Using "cur.execute"
3. Using Python "Pandas Dataframe" and "chunksize" to split the huge file.

For Python Assigment 2, execute 

pip install fuzzywuzzy



## SQL Assignment

Although we can use subqueries, I have used the "WITH CTE" clause as this is more readable.
