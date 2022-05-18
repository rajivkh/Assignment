## Visit/travel Percentage for every customer

WITH main_q AS
(
SELECT ct.cust_name,
       ct.cust_id as cust_id,
	   v.cust_id as v_cust_id,
       RATIO_TO_REPORT(v.cust_id) over() as ratio_to_report
FROM 
    customer ct
LEFT JOIN visit v on ct.cust_id = v.cust_id
)
SELECT cust_name, 
       ROUND(SUM(ratio_to_report)*100,2) as percent 
 FROM main_q
  GROUP BY cust_name
  ORDER BY 2 DESC nulls LAST

