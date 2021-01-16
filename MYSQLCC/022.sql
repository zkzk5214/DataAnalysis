USE SQLCC;

# 22.2.1.1
CREATE VIEW productcustomers AS 
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
AND orderitems.order_num = orders.order_num;

# 22.2.1.2
SELECT cust_name, cust_contact
FROM productcustomers
WHERE prod_id = 'TNT2';

# 22.2.2.1
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
	AS vend_title
FROM vendors
ORDER BY vend_name;

# 22.2.2.2
CREATE VIEW vendorlocations AS 
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
	AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT *
FROM vendorlocations;

# 22.2.3
CREATE VIEW customeremaillist AS
SELECT cust_id, cust_name, cust_email
FROM customers
WHERE cust_email IS NOT NULL;

SELECT *
FROM customeremaillist;

# 22.2.4.1
SELECT prod_id,
		quantity,
        item_price,
        quantity*item_price AS expanded_price
FROM orderitems
WHERE order_num = 20005;

# 22.2.4.2
CREATE VIEW orderitemsexpanded AS 
SELECT order_num,
		prod_id,
        quantity,
        item_price,
        quantity*item_price AS expanded_price
FROM orderitems;

SELECT *
FROM orderitemsexpanded
WHERE order_num = 20005;