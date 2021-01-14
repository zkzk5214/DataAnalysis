USE SQLCC;

# 12.1.1.1
SELECT AVG(prod_price) AS avg_price
FROM products;

# 12.1.1.2
SELECT AVG(prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

# 12.1.2.1
SELECT COUNT(*) AS num_cust
FROM customers;

# 12.1.2.2
SELECT COUNT(cust_email) AS num_cust
FROM customers;

# 12.1.3
SELECT MAX(prod_price) AS max_price
FROM products;

# 12.1.4
SELECT MIN(prod_price) AS min_price
FROM products;

# 12.1.5.1
SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE order_num = 20005;

# 12.1.5.2
SELECT SUM(item_price*quantity) AS total_price
FROM orderitems
WHERE order_num = 20005;

# 12.2
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

# 12.3
SELECT COUNT(*) AS num_items,
	MIN(prod_price) AS price_min,
    MAX(prod_price) AS price_max,
    AVG(prod_price) AS price_AVG
FROM products;    