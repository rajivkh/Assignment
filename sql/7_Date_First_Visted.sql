WITH main_q AS
(
SELECT v.cust_id,
       ct.cust_name,
       c.city_name, 
	   v.date_visited,
       DENSE_RANK() over(PARTITION BY v.cust_id ORDER BY v.city_id) rnk
FROM 
    visit v
 JOIN customer ct on v.cust_id = ct.cust_id
 JOIN city c on v.city_id = c.city_id
)
SELECT cust_id,
       cust_name,
	   date_visited 
FROM main_q
    WHERE rnk = 1