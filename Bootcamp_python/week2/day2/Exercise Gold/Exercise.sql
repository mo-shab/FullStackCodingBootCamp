-- Exercie 1 : DVD Rental
-- Find out how many films there are for each rating.
SELECT rating, COUNT(rating) AS number_of_films FROM film GROUP BY rating; 

-- Get a list of all the movies that have a rating of G or PG-13.
-- Filter this list further: look for only movies that are under 2 hours long, and whose rental price (rental_rate) is under 3.00.
-- Sort the list alphabetically.
SELECT title, rating, length, rental_rate 
    FROM film 
    WHERE (rating = 'G' OR rating = 'PG-13') 
        AND length <= 2 * 60 
        AND rental_rate < 3.00 
    ORDER BY title ASC;

-- Find a customer in the customer table, and change his/her details to your details, using SQL UPDATE.
UPDATE customer 
    SET first_name = 'Shab', last_name = 'Mohammed', email = 'mo.shab@outlook.fr' 
    WHERE first_name='Mary' AND last_name='Smith';

-- Find a customer in the customer table, and change his/her details to your details, using SQL UPDATE.
UPDATE address SET address = '2800 ZI Mohammedia' 
    FROM customer 
    WHERE customer.address_id = address.address_id AND customer.first_name = 'Shab';

-- Exercise 2 : students table

    -- UPDATE

-- ‘Lea Benichou’ and ‘Marc Benichou’ are twins, they should have the same birth_dates.
-- Update both their birth_dates to 02/11/1998.
UPDATE students	SET birth_date='02/11/1998'	
    WHERE (first_name = 'Marc' AND last_name ='Benichou') 
        OR (first_name = 'Lea' AND last_name = 'Benichou');

-- Change the last_name of David from ‘Grez’ to ‘Guez’.
UPDATE students SET last_name = 'Guez' 
    WHERE first_name = 'David' AND last_name = 'Grez';

    -- DELETE

-- Delete the student named ‘Lea Benichou’ from the table.
DELETE FROM students WHERE first_name = 'Lea' AND last_name = 'Benichou';

    -- Count

-- Count how many students are in the table.
SELECT COUNT(*) FROM students;

-- Count how many students were born after 1/01/2000.
SELECT COUNT(*) FROM students WHERE birth_date > '2000-01-01';

-- Exercise 3 : Items and customers

--- Create Table purchases

DROP TABLE IF EXISTS purchases;

CREATE TABLE IF NOT EXISTS purchases
(
    purchase_id SERIAL PRIMARY KEY,
	customer_id integer NOT NULL,
	item_id integer NOT NULL,
	quantity_purchased integer NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (item_id) REFERENCES items (item_id)
)

-- Insert purchases for the customers, use subqueries:
    -- Scott Scott bought one fan
    -- Melanie Johnson bought ten large desks
    -- Greg Jones bougth two small desks

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
	SELECT
		c.customer_id,
		i.item_id,
		1
	FROM
		customers c, items i
	WHERE
		c.customer_firstname = 'Scott' 
		AND c.customer_lastname = 'Scott'
		And i.item_name = 'Fan';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
	SELECT 
    	c.customer_id, 
		i.item_id, 
    	10
	FROM 
   		customers c, items i
	WHERE 
    	c.customer_firstname = 'Melanie' 
		AND c.customer_lastname = 'Johnson'
    	AND i.item_name = 'Large desk';

-- Greg Jones bought two small desks
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
	SELECT 
    	c.customer_id, 
    	i.item_id, 
    	2
	FROM 
    	customers c, items i
	WHERE 
    	c.customer_firstname = 'Greg' 
		AND c.customer_lastname = 'Jones'
    	AND i.item_name = 'Small Desk';

-- Part 2.
-- SQL to get the following from the database:
SELECT * FROM purchases;
-- This information is not useful, we need to know the customer who made the purchase.

-- Get All the purchases with the customer name
SELECT p.purchase_id, c.customer_firstname, c.customer_lastname, i.item_name, p.quantity_purchased
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id
    JOIN items i ON p.item_id = i.item_id;

-- Get the customer with id = 5
SELECT c.customer_firstname, c.customer_lastname, i.item_name, p.quantity_purchased
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id
    JOIN items i ON p.item_id = i.item_id
    WHERE c.customer_id = 5;

-- Purchases for a large desk AND a small desk
SELECT c.customer_firstname, c.customer_lastname, i.item_name, p.quantity_purchased
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id
    JOIN items i ON p.item_id = i.item_id
    WHERE i.item_name = 'Large desk' OR i.item_name = 'Small Desk';

-- SQL to show all the customers who have made a purchase. Show the following fields/columns:
-- customser first name
SELECT DISTINCT c.customer_firstname, c.customer_lastname
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id;
-- Show the customer last name
SELECT DISTINCT c.customer_lastname
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id;
-- Showthe customer id
SELECT DISTINCT c.customer_id
    FROM purchases p
    JOIN customers c ON p.customer_id = c.customer_id;
-- Add a row which references a customer by ID, but does not reference an item by ID (leave it blank). Does this work? Why/why not?
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
    VALUES (1, NULL, 1);
-- This does not work because the item_id is a foreign key that references the items table, and it cannot be NULL.