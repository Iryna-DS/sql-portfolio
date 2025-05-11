WITH product_sales AS (
  SELECT 
    pc.category_name,
    p.product_name,
    SUM(s.order_quantity) AS total_sold,
    RANK() OVER (PARTITION BY pc.category_name ORDER BY SUM(s.order_quantity) DESC) AS sales_rank
  FROM sales2016 s
  JOIN products p ON s.product_key = p.product_key
  JOIN product_subcategories psc ON p.product_subcategory_key = psc.product_subcategory_key
  JOIN product_categories pc ON psc.product_category_key = pc.product_category_key
  GROUP BY pc.category_name, p.product_name
)
SELECT *
FROM product_sales
WHERE sales_rank IN (1, 2, 3)
ORDER BY category_name;