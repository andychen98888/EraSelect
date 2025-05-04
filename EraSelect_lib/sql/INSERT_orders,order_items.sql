/*E09結帳功能*/
INSERT INTO orders
	(id, customer_id, created_date, created_time,
	shipping_type, shipping_fee, payment_type, payment_fee, 
	recipient_name, recipient_email, recipient_phone, shipping_address)
	VALUES (?,?,?,?,?,?,?,?,?,?,?,?);
    
INSERT INTO order_items
	(order_id, product_id, color_name, spec_name, price, quantity)
	VALUES(?,?,?,?,?,?);