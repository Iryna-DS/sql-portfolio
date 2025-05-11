WITH total_sales AS (
  SELECT product_key, SUM(order_quantity) AS total_sold
  FROM sales2016
  GROUP BY product_key
),
total_returns AS (
  SELECT product_key, SUM(return_quantity) AS total_returned
  FROM returns
  GROUP BY product_key
)
SELECT 
  p.product_name,
  COALESCE(s.total_sold, 0) AS sold,
  COALESCE(r.total_returned, 0) AS returned,
  ROUND(COALESCE(r.total_returned::decimal, 0) / NULLIF(s.total_sold, 0), 4) AS return_rate
FROM products p
LEFT JOIN total_sales AS s ON p.product_key = s.product_key
LEFT JOIN total_returns AS r ON p.product_key = r.product_key
ORDER BY return_rate DESC NULLS LAST;