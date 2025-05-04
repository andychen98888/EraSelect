/*E10查詢歷史訂單*/
SELECT id, customer_id, created_date, created_time, status, 
	shipping_fee, shipping_type, payment_type, payment_fee,
    order_id,
    SUM(price*quantity) AS total_amount
	FROM orders 
    INNER JOIN order_items ON orders.id = order_items.order_id
	WHERE customer_id="A123123123"
	AND created_date BETWEEN date_add(curdate(),INTERVAL -1 MONTH) AND curdate()
    GROUP BY orders.id
    ORDER BY created_date DESC, created_time DESC;
    /*DESC大到小排序 ASC預設排序小到大 兩個colums都要加排序條件*/ 
    
/*E11*/
SELECT orders.id, customer_id, created_date, created_time, status, 
	shipping_type, shipping_fee, shipping_note, payment_type, payment_fee, payment_note, 
    recipient_name, recipient_email, recipient_phone, shipping_address,
    order_id, order_items.product_id, order_items.color_name, spec_name, price, quantity,
    products.name,IFNULL(product_colors.photo_url,products.photo_url) AS photo_url
	FROM orders
	INNER JOIN order_items ON orders.id = order_items.order_id
    INNER JOIN products ON order_items.product_id = products.id
    LEFT JOIN product_colors ON order_items.product_id = product_colors.product_id
    AND order_items.color_name = product_colors.color_name
	WHERE customer_id ="A123123123" AND orders.id=3;
