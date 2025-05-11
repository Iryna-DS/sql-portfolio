SELECT DATE_TRUNC('month', s.order_date) AS month,
       SUM(s.order_quantity * p.product_price) AS revenue
FROM sales2016 s
JOIN products p ON s.product_key = p.product_key
GROUP BY month
ORDER BY month;
