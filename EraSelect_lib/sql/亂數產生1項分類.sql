/*隨機上衣*/
SELECT id, name, unit_price, stock, photo_url, 
		category , description, release_date, discount FROM products
        WHERE category = "上衣"
        ORDER BY rand() limit 1;
/*隨機褲裝*/
SELECT id, name, unit_price, stock, photo_url, 
		category , description, release_date, discount FROM products
        WHERE category = "褲裝"
        ORDER BY rand() limit 1;
/*隨機鞋子*/
SELECT id, name, unit_price, stock, photo_url, 
		category , description, release_date, discount FROM products
        WHERE category = "鞋子"
        ORDER BY rand() limit 1;
/*隨機配件*/
SELECT id, name, unit_price, stock, photo_url, 
		category , description, release_date, discount FROM products
        WHERE category = "配件"
        ORDER BY rand() limit 1;
        
SELECT id, name, unit_price, stock, photo_url, 
		category , description, release_date, discount 
        FROM products
        WHERE category 
        ORDER BY rand() limit 1;