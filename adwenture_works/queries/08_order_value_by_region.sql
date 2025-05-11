SELECT t.region AS territory,
  	   ROUND(AVG(s.order_quantity * p.product_price::numeric), 2) AS avg_order_value
FROM sales2016 AS s
JOIN products AS p ON s.product_key = p.product_key
JOIN territories AS t ON s.territory_key = t.sales_territory_key
GROUP BY t.region
ORDER BY avg_order_value DESC;