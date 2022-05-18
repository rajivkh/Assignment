## Total expense incurred by customers on their visits

SELECT ct.cust_name, 
       SUM(c.expense) as expenses
FROM 
visit v
JOIN customer ct ON v.cust_id = ct.cust_id
JOIN city c      ON v.city_id = c.city_id
GROUP BY ct.cust_name