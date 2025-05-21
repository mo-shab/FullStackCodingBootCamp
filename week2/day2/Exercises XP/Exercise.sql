-- Exercise 1: Items and customers

    --- Get all the items orderd by price (low to hight)
SELECT * FROM items ORDER BY item_price ASC;

    -- Get items with price abpve 80 (80 Included), order by price (low to high)
SELECT * FROM items WHERE item_price >= 80 ORDER BY item_price DESC;

    -- The first 3 customers in alphabetical order
SELECT customer_firstname, customer_lastname
	FROM customers ORDER BY customer_firstname ASC FETCH FIRST 3 ROWS ONLY ;

    -- All last names in reverse order

SELECT customer_lastname
	FROM customers ORDER BY customer_lastname DESC;

--------------------------------------------------------------------------------------
-- Exercise 2: dvdrental databse

    -- Select all the columns from customer table.
SELECT * FROM customer;

    -- query to display the names (first_name, last_name) using an alias named “full_name”.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customer;

    -- get all the dates that accounts were created. Write a query to select all the create_date from the “customer” table (there should be no duplicates).
SELECT DISTINCT create_date FROM customer;

    -- distinct actors depending on their number of oscars
SELECT DISTINCT actor_id, COUNT(oscars) FROM actor GROUP BY actor_id;

    -- suqry to get all the customer details from the customer table. ordre by descending order  by first name
SELECT * FROM customer ORDER BY first_name DESC;

    -- Query to get the Film ID, title, description, Year of release, and rental rate ascending order according to theire rental rate

SELECT film_id, title, description, release_year, rental_rate FROM film ORDER BY rental_rate ASC;

    -- query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.

SELECT CONCAT(address, ' ', address2, ' ', district, ' ', postal_code) AS address, phone FROM address WHERE district = 'Texas';

    -- query to retrieve all movie details where the movie id is either 15 or 150

SELECT * FROM film GROUP BY film_id HAVING film_id = 15 or film_id = 150;

    -- query which should check if your favorite movie exists in the database. Have your query get the film ID, title, description, length and the rental rate,
    -- these details can be found in the “film” table.
SELECT film_id, title, description, length, rental_rate FROM film WHERE title = 'star wars';

    -- No luck finding your movie? Maybe you made a mistake spelling the name. Write a query to get the film ID, title, description,
    -- length and the rental rate of all the movies starting with the two first letters of your favorite movie.
SELECT film_id, title, description, length, rental_rate FROM film WHERE title ILIKE 'St%';

    -- Write a query which will find the 10 cheapest movies.
SELECT * FROM film  ORDER BY rental_rate ASC LIMIT 10;

    -- write a query to get the next 10 movies after the 10 cheapest movies.
SELECT * FROM film  ORDER BY rental_rate ASC OFFSET 10 LIMIT 10;

    -- -- query which will join the data in the customer table and the payment table. You want to get the first name and last name from the curstomer table,
    -- as well as the amount and the date of every payment made by a customer, ordered by their id (from 1 to…).
SELECT * FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id ORDER BY customer.customer_id ASC;

    -- query to get all the movies which are not in inventory.
SELECT * FROM film WHERE film_id NOT IN (SELECT film_id FROM inventory);

    -- query to find which city is in which country.
SELECT city.city_id, city.city, country.country_id, country.country FROM city INNER JOIN country ON city.country_id = country.country_id;

    -- Bonus You want to be able to see how your sellers have been doing? Write a query to get the customer’s id, names
    -- (first and last), the amount and the date of payment ordered by the id of the staff member who sold them the dvd.
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount, payment.payment_date, staff.staff_id
    FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id
    INNER JOIN staff ON payment.staff_id = staff.staff_id ORDER BY staff.staff_id ASC;