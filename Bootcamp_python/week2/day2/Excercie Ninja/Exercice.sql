-- Exercise 1 : Bonus Public Database (Continuation of XP)

-- Fetch the last 2 customers in alphabetical order (A-Z) – exclude ‘id’ from the results.
SELECT customer_firstname, customer_lastname
    FROM customers
    ORDER BY customer_firstname ASC, customer_lastname ASC
    LIMIT 2 OFFSET (
        SELECT COUNT(*) - 2 FROM customers
    );
-- Use SQL to delete all purchases made by Scott.
DELETE FROM purchases WHERE customer_id = ( SELECT customer_id FROM customers WHERE customer_firstname = 'Scott');

-- Does Scott still exist in the customers table, even though he has been deleted? Try and find him.
-- Yes, Scott still exists in the customers table.
SELECT * FROM customers WHERE customer_firstname = 'Scott';

-- Use SQL to find all purchases. Join purchases with the customers table, so that Scott’s order will appear,
-- although instead of the customer’s first and last name, you should only see empty/blank. (Which kind of join should you use?).
SELECT 
    p.purchase_id,
    COALESCE(c.customer_firstname, '') AS customer_firstname,
    COALESCE(c.customer_lastname, '') AS customer_lastname,
    p.item_id,
    p.quantity_purchased
FROM 
    purchases p
LEFT JOIN 
    customers c ON p.customer_id = c.customer_id;
-- Use SQL to find all purchases. Join purchases with the customers table, so that Scott’s order will NOT appear. (Which kind of join should you use?)
SELECT 
    p.purchase_id,
    c.customer_firstname,
    c.customer_lastname,
    p.item_id,
    p.quantity_purchased
FROM 
    purchases p
INNER JOIN 
    customers c ON p.customer_id = c.customer_id;