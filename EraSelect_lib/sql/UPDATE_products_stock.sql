/*E09修改product_color_specs庫存*/
/*
	UPDATE products SET stock= stock-? WHERE stock>=? AND id=? ;
    UPDATE product_colors SET stock=stock-? WHERE stock>=? AND product_id =? AND color_name=?;
    UPDATE product_color_specs SET stock=stock-? WHERE stock>=? AND product_id =? AND color_name=? AND spec_name=?;
*/
/* pid:1, color: Black , spec:36 , stock:9 , qty=3*/
/*
UPDATE product_color_specs SET stock=stock-? WHERE stock>=? AND product_id =? AND color_name=? AND spec_name=?;
*/
UPDATE product_color_specs SET stock=stock-3 WHERE product_id = 1 AND color_name="Black" AND spec_name="36" AND stock>=3;

/*E09修改product_colors庫存*/
/* pid:3, color: Gradient Orange/Dark Peach , spec:null , stock:14 , qty=3*/
/*
UPDATE product_colors SET stock=stock-? WHERE stock>=? AND product_id =? AND color_name=?;
*/
UPDATE product_colors SET stock= stock-3 WHERE product_id = 3 AND color_name="Gradient Orange/Dark Peach" AND stock>=3;

/*E09修改product_color_specs庫存*/
/* pid:4, color: "" , spec:L , stock:4 , qty=3*/
/*
UPDATE product_color_specs SET stock=stock-? WHERE stock>=? AND product_id =? AND color_name=? AND spec_name=?;
*/
UPDATE product_color_specs SET stock= stock-3 WHERE product_id = 4 AND color_name="" AND spec_name="L" AND stock>=3;

/*E09修改products庫存*/
/* pid:2, color: "" , spec:null , stock:11 , qty=3*/
/*
UPDATE products SET stock= stock-? WHERE stock>=? AND id=? ;
*/
UPDATE products SET stock= stock-3 WHERE id=2 AND stock>=3;