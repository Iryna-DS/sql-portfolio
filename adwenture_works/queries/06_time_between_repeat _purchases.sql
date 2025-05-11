WITH customer_orders AS (
  SELECT customer_key, order_date,
         LEAD(order_date) OVER (PARTITION BY customer_key ORDER BY order_date) AS next_order
  FROM sales2016
),
diffs AS (
  SELECT customer_key,
         EXTRACT(DAY FROM next_order - order_date) AS days_between
  FROM customer_orders
  WHERE next_order IS NOT NULL
)
SELECT customer_key, ROUND(AVG(days_between), 2) AS avg_days_between_orders
FROM diffs
GROUP BY customer_key
ORDER BY avg_days_between_orders DESC;