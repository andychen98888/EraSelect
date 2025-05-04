/*INNER JOIN*/
SELECT id, name, unit_price, products.stock,  products.photo_url, products.release_date, description, discount ,
	product_id, color_name, category,
    product_colors.release_date AS color_release_date,
    product_colors.photo_url AS color_photo, 
    product_colors.stock AS color_stock, 
    icon_url 
    FROM products 
	INNER JOIN product_colors ON products.id=product_colors.product_id
    WHERE id="3";
    
/*E05 LEFT (OUTER) JOIN 檢視產品明細 後面加上ordinal排序顏色*/  
SELECT id, name, unit_price, products.stock,  products.photo_url, products.release_date, description, discount ,
	product_id, color_name, category,
    IFNULL(product_colors.release_date,products.release_date) AS color_release_date,
    product_colors.photo_url AS color_url, 
    product_colors.stock AS color_stock, 
    icon_url 
    FROM products 
	LEFT JOIN product_colors ON products.id=product_colors.product_id
    WHERE id="3" ORDER BY product_colors.ordinal;

/*RIGHT (OUTER) JOIN*/ 
SELECT id, name, unit_price, products.stock,  products.photo_url, products.release_date, description, discount ,
	product_id, color_name, category,
    product_colors.release_date AS color_release_date,
    product_colors.photo_url AS color_url, 
    product_colors.stock AS color_stock, 
    icon_url 
    FROM  product_colors
	RIGHT JOIN products ON products.id=product_colors.product_id;

/* 庫存加總: 資料庫加總會變成一筆，會看不到明細資料 灰色:統計函式
IFNULL(是NULL使用第一個,不是NULL用第二個) GROUP_CONCAT(字串相加中間用逗號隔開)*/  
SELECT id, name,  IFNULL(SUM(product_colors.stock),products.stock) AS total_stock,
				  IFNULL(MAX(product_colors.release_date),products.release_date) AS release_date,
	product_id, GROUP_CONCAT(color_name), GROUP_CONCAT(product_colors.stock)
    FROM products 
    LEFT JOIN product_colors ON products.id=product_colors.product_id
    WHERE id=1
    GROUP BY id;
    
/*查詢全部庫存*/
SELECT SUM(IFNULL(product_colors.stock,products.stock)) AS total_stock
	FROM products 
    LEFT JOIN product_colors ON products.id=product_colors.product_id;

/*拿掉ONLYFULLGROUPBY一樣只會秀出一筆名細資料*/    
SELECT @@GLOBAL.sql_mode,@@SESSION.sql_mode;
SET SESSION sql_mode= "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";