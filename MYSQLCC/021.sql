USE SQLCC;

# 21.1.1
CREATE TABLE customers
(
	cust_id			int			NOT NULL AUTO_INCREMENT,
    cust_name		char(50) 	NOT NULL,
    cust_address 	char(50)	NULL,
    cust_city		char(50)	NULL,
    cust_state		char(5)		NULL,
    cust_zip		char(10) 	NULL,
    cust_country	char(50)	NULL,
    cust_contact 	char(50)	NULL,
    cust_email		char(255) 	NULL,
    PRIMARY KEY (cust_id)	# primary key
) 	ENGINE=InnoDB;

# 21.1.2.1
CREATE TABLE orders
(
	order_num 	int		NOT NULL AUTO_INCREMENT,
    order_date datetime	NOT NULL,
    cust_id		int 	NOT NULL,
    PRIMARY KEY(order_num)
)	ENGINE=InnoDB;

# 21.1.2.2
CREATE TABLE vendors
(
	vend_id			int			NOT NULL AUTO_INCREMENT,
    vend_name		char(50)	NOT NULL,
    vend_address	char(50)	NULL,
    vend_city		char(50)	NULL,
    vend_state  	char(5)		NULL,
    vend_zip		char(10)	NULL,
    vend_country	char(50) 	NULL,
    PRIMARY KEY(vend_id)
)	ENGINE=InnoDB;

# 21.1.5
CREATE TABLE orderitems
(
	order_num 	int				NOT NULL,
    order_item 	int 			NOT NULL,
    prod_id 	char(10) 		NOT NULL,
    quantity 	int 			NOT NULL DEFAULT 1,
    item_price 	decimal(8,2) 	NOT NULL,
    PRIMARY KEY(order_num, order_item)
) ENGINE=InnoDB;

# 21.2.1
ALTER TABLE vendors
ADD vend_phone CHAR(20);

# 21.2.2
ALTER TABLE vendors
DROP COLUMN vend_phone;

# 21.3
DROP TABLE customers2;

# 21.4.1
RENAME TABLE customers2 TO customers;

# 21.4.2
RENAME TABLE backup_customers TO customers,
			backup_vendors TO vendors,
            backup_products TO products;