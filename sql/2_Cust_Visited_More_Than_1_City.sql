
## Customer who vistied more than one city
## Output display which customer visited which cities

WITH main_q
as
(SELECT 
       v.cust_id,
	   ct.cust_name,
	   c.city_name, 
	   DENSE_RANK() over(PARTITION BY v.cust_id ORDER BY v.city_id) rnk
FROM 
    visit v
 JOIN customer ct ON v.cust_id = ct.cust_id
 JOIN city c ON v.city_id = c.city_id
) 
SELECT * 
     FROM main_q 
     WHERE rnk > 1
