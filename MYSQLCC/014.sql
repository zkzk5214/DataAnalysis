USE SQLCC;

# 14.2.1
SELECT order_num
FROM orderitems
WHERE prod_id = 'TNT2';

# 14.2.2
SELECT cust_id
FROM orders
WHERE order_num IN (20005,20007);

# 14.2.3
SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
					FROM orderitems
                    WHERE prod_id = 'TNT2');
                    
# 14.2.4
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (10001,10004);

# 14.2.5
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id in (SELECT cust_id
				FROM orders
                WHERE order_num IN ( SELECT order_num
									FROM orderitems
                                    WHERE prod_id = 'TNT2'));
                                    
# 14.3.1
SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = 10001;

SELECT cust_name,
	cust_state,
    (SELECT COUNT(*)
    FROM orders
    WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;

# 14.3.2
SELECT cust_name,
		cust_state,
		(SELECT COUNT(*)
        FROM orders
        WHERE cust_id = cust_id) AS orders
FROM customers
ORDER BY cust_name;