## Following statements to be executed in Oracle 12c of above


##-- Create Table City 

create table city
(city_id integer,
city_name varchar2(255),
expense integer
);

-- Insert Data into City Table

insert into city values(2001,'Chicago',500);
insert into city values(2002,'New York',500);
insert into city values(2003,'SFO',500);
insert into city values(2004,'Florida',500);

commit;

select * from city;


##-- Create Table Customer

create table customer
(cust_id integer,
cust_name varchar2(255),
gender varchar2(1),
age integer
);

##-- Insert Data into Visit Customer

insert into customer values(1001,'John','M',25);
insert into customer values(1002,'Mark','M',40);
insert into customer values(1003,'Martha','F',55);
insert into customer values(1004,'Selena','F',34);

commit;

select * from customer;


##-- Create Table Visit

create table visit
(cust_id integer,
city_id integer,
date_visited date
);

##-- Insert Data into Visit Table

insert into visit values(1001,2003,'01-jan-2003');
insert into visit values(1001,2004,'01-Jan-2004');
insert into visit values(1002,2001,'01-Jan-2001');
insert into visit values(1004,2003,'01-Jan-2003');

commit;

select * from visit;





