SELECT 
id, name, products.unit_price, IFNULL(SUM(product_color_specs.stock),products.stock) AS stock
, products.photo_url, category, description, products.release_date, discount,

product_colors.product_id, 
product_colors.color_name, icon_url,
IFNULL(product_colors.release_date,products.release_date) AS color_release_date, 
product_colors.photo_url AS color_url, 
IFNULL(SUM(product_color_specs.stock),product_colors.stock) AS color_stock, /*用規格的庫存加總使其正確*/
product_colors.ordinal,
COUNT(spec_name) AS spec_count
,group_concat(spec_name ORDER BY product_color_specs.ordinal)

/*product_color_specs.product_id, 
product_color_specs.color_name, spec_name, 
product_color_specs.stock, 
product_color_specs.unit_price, 
product_color_specs.ordinal*/
FROM products
LEFT JOIN product_colors ON products.id =product_colors.product_id
LEFT JOIN product_color_specs ON products.id =product_color_specs.product_id
							AND (product_colors.color_name=product_color_specs.color_name
							OR	 product_colors.color_name IS NULL)
WHERE products.id = 4
GROUP BY products.id, product_colors.color_name
/* WHERE id IN (1,3,4) HAVING spec_count>0; WHERE條件只能放TABLE名稱的條件 HAVING放AS_NAME 篩選過的條件*/
