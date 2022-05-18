
## Cities Frequently Visited
## Using Windows Functions

## We join two tables City/Visit to get the city name
## We rank as to how many times the city has been visited
## Since we wanted the cities most visited, we take the max(rank value)


WITH main_q as 
(
SELECT 
       v.city_id,
	   c.city_name, 
	   DENSE_RANK() over(PARTITION BY v.city_id ORDER BY v.cust_id) rnk
FROM 
     visit v
JOIN city c ON v.city_id = c.city_id
)
SELECT * 
     FROM main_q 
     WHERE rnk = (SELECT MAX(rnk) FROM main_q)



