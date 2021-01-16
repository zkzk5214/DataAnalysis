USE SQLCC;

# 24.2.1
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
END //
DELIMITER ;

OPEN ordernumbers;
CLOSE ordernumbers;

DROP PROCEDURE processorders;

# 24.2.2
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare the cursor 
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Close the cursor
    CLOSE ordernumbers;
    
END//
DELIMITER ;

DROP PROCEDURE processorders;

# 24.2.3.1
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Get order number
    FETCH ordernumbers INTO o;
    
    -- Close the cursor
    CLOSE ordernumbers;
    
END//
DELIMITER ; 

# 24.2.3.2
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    
    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Loop through all rows
    REPEAT
    
		-- Get order number
		FETCH ordernumbers INTO o;
        
	-- End of loop
    UNTIL done END REPEAT;
    
    -- Close the cursor
    CLOSE ordernumbers;
    
END//
DELIMITER ; 

# 24.2.3.2
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    DECLARE t DECIMAL(8,2);
    -- Declare the cursor
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
    -- Create a table to store the results
    CREATE TABLE IF NOT EXISTS ordertotals
		(order_num INT, total DECIMAL(8,2));
    -- Open the cursor
    OPEN ordernumbers;
    -- Loop through all rows
    REPEAT
		-- Get order number
		FETCH ordernumbers INTO o;
        -- Get the total for this order
        CALL ordertotal(o, 1, t);
        -- Insert otder and total into odertotals
        INSERT INTO ordertotals(order_num, total)
        VALUES(o,t);
	-- End of loop
    UNTIL done END REPEAT;
    -- Close the cursor
    CLOSE ordernumbers;
END//
DELIMITER ; 
DROP PROCEDURE processorders;

SELECT *
FROM ordertotals;