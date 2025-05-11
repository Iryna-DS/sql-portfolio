SELECT c.first_name || ' ' || c.last_name AS full_name,
       SUM(s.order_quantity * (p.product_price - p.product_cost)) AS profit
FROM sales2016 AS s
JOIN customers AS c ON s.customer_key = c.customer_key
JOIN products AS p ON s.product_key = p.product_key
GROUP BY full_name
ORDER BY profit DESC
LIMIT 10;