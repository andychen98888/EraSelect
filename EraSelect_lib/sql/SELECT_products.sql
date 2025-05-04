/*E04-a 查詢全部產品*/
SELECT id, name, unit_price, stock, photo_url, category, description, release_date, discount 
FROM es.products;

/* 用DISTINICT(消除重複資料)查詢產品分類*/
SELECT DISTINCT category FROM es.products;

/*E04-b 用關鍵字查詢產品*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE name LIKE "%Tee%";
        
/*E04-c 用分類查詢產品*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE category="上衣";
        
        
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE category="褲裝";
        
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE category="配件";
        
/*用discount查詢產品*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE discount > 0;
        
/*E04-d 最近上架*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        ORDER BY release_date DESC /*DESC由大到小*/
        LIMIT 5;
        
/*最近一周上架*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE release_date BETWEEN date_add(curdate(),INTERVAL -7 DAY) AND curdate();
        
/*推薦商品 亂數挑選*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        ORDER BY rand() limit 5;
     
/*E05:用PKey :id查詢對應的產品*/
SELECT id, name, unit_price, stock, photo_url, 
		category, description, release_date, discount FROM products
        WHERE id = 1;