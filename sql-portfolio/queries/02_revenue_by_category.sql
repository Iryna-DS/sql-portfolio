SELECT pc.category_name, 
       SUM(s.order_quantity * p.product_price) AS revenue
FROM sales2016 AS s
JOIN products AS p ON s.product_key = p.product_key
JOIN product_subcategories AS psc ON p.product_subcategory_key = psc.product_subcategory_key
JOIN product_categories AS pc ON psc.product_category_key = pc.product_category_key
GROUP BY pc.category_name
ORDER BY revenue DESC;