USE SQLCC;

# 19.2.1
INSERT INTO Customers
VALUES(NULL,
	'Pep E. LaPew',
    '100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA',
    NULL,
    NULL);
    
# 19.2.2
INSERT INTO customers(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
VALUES('Pep E. LaPew',
    '100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA',
    NULL,
    NULL);
    
# 19.2.3
INSERT INTO customers(cust_name,
	cust_contact,
	cust_email,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
VALUES('Pep E. LaPew',
		NULL,
		NULL,
		'100 Main Street',
		'Los Angeles',
		'CA',
		'90046',
		'USA');
        
# 19.3.1
INSERT INTO customers(cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country,
		cust_contact,
		cust_email)
VALUES('Pep E. LaPew',
    '100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA',
    NULL,
    NULL);
INSERT INTO customers(cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country)
VALUES(
	'M. Martian',
    '42 Galaxy Way',
    'New York',
    'NY',
    '11213',
    'USA');

# 19.3.2
INSERT INTO customers(cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country)
VALUES('Pep E. LaPew',
    '100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA'
    ),
(
	'M. Martian',
    '42 Galaxy Way',
    'New York',
    'NY',
    '11213',
    'USA'
    );
    
# 19.4
INSERT INTO customers(cust_id,
		cust_contact,
		cust_email,
		cust_name,
        cust_address,
        cust_city,
        cust_state,
		cust_zip,
		cust_country)
SELECT cust_id,
		cust_contact,
		cust_email,
		cust_name,
        cust_address,
        cust_city,
        cust_state,
		cust_zip,
		cust_country
FROM custnew;
