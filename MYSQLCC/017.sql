USE SQLCC;

# 17.2.1.1
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5;

# 17.2.1.2
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002);

# 17.2.1.3
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002);

# 17.2.1.4
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5 
OR vend_id IN (1001,1002);

# 17.2.3
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION ALL
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002);

# 17.2.4
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002)
ORDER BY vend_id, prod_price;