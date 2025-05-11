SELECT p.product_name, psc.subcategory_name,
       SUM(s.order_quantity * p.product_price) AS revenue
FROM sales2016 AS s
JOIN products AS p ON s.product_key = p.product_key
JOIN product_subcategories AS psc ON p.product_subcategory_key = psc.product_subcategory_key
GROUP BY p.product_name, psc.subcategory_name
ORDER BY revenue DESC
LIMIT 10;