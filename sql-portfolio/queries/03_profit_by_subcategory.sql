SELECT psc.subcategory_name,
       SUM(s.order_quantity * (p.product_price - p.product_cost)) AS profit
FROM sales2016 s
JOIN products p ON s.product_key = p.product_key
JOIN product_subcategories psc ON p.product_subcategory_key = psc.product_subcategory_key
GROUP BY psc.subcategory_name
ORDER BY profit DESC;