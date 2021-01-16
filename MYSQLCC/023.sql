USE SQLCC;

# 23.3.1
CALL productpricing(@pricelow,
					@pricehigh,
					@priceaverage);
                    
# 23.3.2
DELIMITER //
CREATE PROCEDURE productpricing()
BEGIN
	SELECT Avg(prod_price) AS priceaverage
    FROM products;
END//
DELIMITER ;

CALL productpricing();

# 23.3.3
DROP PROCEDURE productpricing;

# 23.3.4.1
DELIMITER //
CREATE PROCEDURE 	productpricing(
	out pl DECIMAL(8, 2),
	out ph DECIMAL(8, 2),
	out pa DECIMAL(8, 2)
)
BEGIN
	SELECT Min(prod_price) INTO pl FROM products;
	SELECT Max(prod_price) INTO ph FROM products;
	SELECT Avg(prod_price) INTO pa FROM products;
END//

DELIMITER ;

CALL productpricing(@pricelow,
					@pricehigh,
                    @priceaverage);
                    
SELECT @pricehigh, @pricelow, @priceaverage;

# 23.3.4.2
DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price*quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
END //
DELIMITER ;

CALL ordertotal(20005,@total); 

SELECT @total;

CALL ordertotal(20009,@total);

SELECT @ total;

DROP PROCEDURE ordertotal;

# 23.3.5
-- Name: ordertotal
-- Parameters: onumber = order number
-- 			   taxable = 0 if not taxable, 1 if taxable
--             otatl   = order total variable
DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    IN taxable BOOLEAN,
    OUT ototal DECIMAL(8,2)
)   COMMENT 'Obtain order total, optionally adding tax'
BEGIN
	
    -- Declare variable for total
    DECLARE total DECIMAL(8,2);
    -- Declare tax percentage
    DECLARE taxrate INT DEFAULT 6;
    
    -- Get the order total
    SELECT Sum(item_price*quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO total;
    
    -- Is this taxable?
    IF taxable THEN
		-- Yes, so add taxrate to the total
        SELECT total+(total/100*taxrate) INTO total;
	END IF;
    
    -- And finally, save to out variable
    SELECT total INTO ototal;
    
END//
DELIMITER ;

CALL ordertotal(20005, True, @total);
SELECT @total;

CALL ordertotal(20005, 0, @total);
SELECT @total;

# 23.3.6.1
SHOW CREATE PROCEDURE ordertotal;

# 23.3.6.2
SHOW PROCEDURE STATUS LIKE 'ordertotal';