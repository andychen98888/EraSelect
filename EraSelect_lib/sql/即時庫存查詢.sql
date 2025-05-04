
/*沒顏色沒規格*/
SELECT id,stock FROM products WHERE id = 2;

SELECT product_id,color_name,stock FROM product_colors WHERE product_id = 3 AND color_name="Gradient Orange/Dark Peach";

SELECT product_id,color_name,spec_name,stock FROM product_color_specs WHERE product_id = 1 AND color_name="Black" AND spec_name="36" ;


SELECT id,
	IFNULL(product_colors.color_name,"") AS color_name,
	IFNULL(spec_name,"") AS spec_name,
	IFNULL(IFNULL(product_color_specs.stock,product_colors.stock), products.stock) AS stock 
	FROM products 
		LEFT JOIN product_colors
			ON products.id = product_colors.product_id
		LEFT JOIN product_color_specs
			ON products.id = product_color_specs.product_id
				AND (product_colors.color_name = product_color_specs.color_name
					OR product_colors.color_name IS NULL)
	WHERE id = 2 AND product_colors.color_name IS NULL
    HAVING color_name=""
		AND spec_name="";