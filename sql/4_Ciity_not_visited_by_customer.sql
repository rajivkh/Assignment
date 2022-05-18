## List the city names that are not visited by every customer and order them by the expense budget in ascending order
## main_q - main_query list the cities visited by each customer
## subq_1 - subquery_1 list the cartesian production for each city/customer
## As a last step we do minus to list the remainining cities not visited by each customer

WITH main_q AS
(
SELECT ct.cust_name,
       c.city_name,
	   c.expense
FROM 
    visit v
 JOIN customer ct on v.cust_id = ct.cust_id
 JOIN city c      on v.city_id = c.city_id
ORDER BY c.expense
),
subq_1 as
(
SELECT b.cust_name,a.city_name,a.expense
FROM city a, customer b
order BY a.expense
)
SELECT * FROM subq_1
minus
SELECT * FROM main_q
