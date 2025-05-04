SELECT id, email, phone, password, name, birthday, gender, /*必要欄位*/
	   address, subscribed FROM customers; /*非必要欄位*/
      
INSERT INTO customers
(id, email, password, phone, name, birthday, gender, address, subscribed)
VALUES('A223456718','test789@gmail.com','1234;Lkj','0987092789','林零七','1987-05-06','O','新北市',FALSE);

/* E01:會員登入*/
SELECT id, email, phone, password, name, birthday, gender, 
	   address, subscribed FROM customers
       WHERE id = 'A123456789' AND password = '1234;Lkj'
       /*email = "test123@gmail.com"*/
       ;
       
/* E02:會員註冊*/
INSERT INTO customers
(id, email, password, phone, name, birthday, gender, address, subscribed)
VALUES(?,?,?,?,?,?,?  ,?,?);