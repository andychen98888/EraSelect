/*E05: 用ajax 查詢指定productId, colorName對應的spec(s)*/
SELECT product_id, color_name, spec_name, 
	product_color_specs.stock, 
    product_color_specs.unit_price,  /*定價*/ 
	product_color_specs.unit_price * (100-products.discount) /100 AS price, /*售價*/ 
    ordinal 
	FROM product_color_specs 
    JOIN products ON product_color_specs.product_id = products.id 
    WHERE product_id="1" AND color_name = "Rinsed Indigo"
	ORDER BY ordinal; /* product_id , color_name,*/
    

 /*E05 LEFT (OUTER) JOIN 檢視產品明細;解決full outer join 有規個無顏色*/     
SELECT id, name, products.unit_price, products.stock,  products.photo_url, products.release_date, description, discount ,category,

	product_colors.product_id, product_colors.color_name, IFNULL(SUM(product_color_specs.stock),product_colors.stock),
    IFNULL(product_colors.release_date,products.release_date) AS color_release_date, /**/
    product_colors.photo_url AS color_url, 
    product_colors.stock AS color_stock, 
    icon_url,
    COUNT(spec_name) AS spec_count
    FROM products 
		LEFT JOIN product_colors ON products.id=product_colors.product_id
		LEFT JOIN product_color_specs ON products.id = product_color_specs.product_id
									  AND (product_colors.color_name = product_color_specs.color_name
										OR product_colors.color_name IS NULL)
    WHERE id="1" 
    GROUP BY id, product_colors.color_name
    ORDER BY product_colors.ordinal;
    
	/*E05 3tables JOIN*/
SELECT id, name, products.unit_price, IFNULL(SUM(product_color_specs.stock),products.stock) AS stock,
			products.photo_url, category, description, products.release_date, discount,
	   product_colors.product_id, product_colors.color_name, 
            product_colors.release_date AS color_release_date, 
            product_colors.photo_url AS color_photo, icon_url, 
            IFNULL(SUM(product_color_specs.stock),product_colors.stock) AS color_stock, 
            product_colors.ordinal,
       COUNT(spec_name) AS spec_count 
            ,GROUP_CONCAT(spec_name ORDER BY product_color_specs.ordinal)
		FROM products
			LEFT JOIN product_colors 
				ON products.id=product_colors.product_id
			LEFT JOIN product_color_specs
				ON products.id = product_color_specs.product_id
					AND (product_colors.color_name=product_color_specs.color_name
						OR product_colors.color_name IS NULL)
		WHERE products.id=1
        GROUP BY products.id,product_colors.color_name;