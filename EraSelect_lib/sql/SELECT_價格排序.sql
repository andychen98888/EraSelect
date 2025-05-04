/*價格區間排序*/
SELECT * FROM es.products
WHERE unit_price between 5000 and 8000;
/*價格由小到大排序*/
SELECT id, name, unit_price, stock, photo_url, category, description, release_date, discount FROM products
ORDER BY unit_price ASC;
/*價格由大到小排序*/
SELECT id, name, unit_price, stock, photo_url, category, description, release_date, discount FROM products
ORDER BY unit_price DESC;