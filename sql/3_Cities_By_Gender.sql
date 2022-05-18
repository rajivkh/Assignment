
## Cities visited by gender

SELECT 
      c.city_name, 
      ct.gender 
FROM 
visit v
    JOIN customer ct ON v.cust_id = ct.cust_id
    JOIN city c ON v.city_id = c.city_id