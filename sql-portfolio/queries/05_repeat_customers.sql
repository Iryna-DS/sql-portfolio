SELECT COUNT(*) AS repeat_customers
FROM (
  SELECT customer_key
  FROM sales2016
  GROUP BY customer_key
  HAVING COUNT(*) > 1
) AS sub;