USE SQLCC;

# 20.1.1
UPDATE customers
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

# 20.1.2
UPDATE customers
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

# 20.1.3
UPDATE customers
SET cust_email = NULL
WHERE cust_id = 10005;

# 20.2
DELETE FROM customers
WHERE cust_id = 10006;
