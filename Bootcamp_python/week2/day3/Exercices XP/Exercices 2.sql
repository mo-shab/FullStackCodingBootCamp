-- Exercise 2 : DVD Rental
-- UPDATE Language of some films
UPDATE film SET language_id = 3
    WHERE title IN ('Airport Pollock', 'Academy Dinosaur', 'Affair Prejudice');

-- Which foreign keys (references) are defined for the customer table? 
-- How does this affect the way in which we INSERT into the customer table?
-- The customer table has foreign keys referencing the address and store tables.

-- Drop the customer_review table, Is this an easy step, or does it need extra checking?
DROP TABLE IF EXISTS customer_review;
-- It is an easy step because the foreign key constraints are set to ON DELETE CASCADE,

-- Find out how many rentals are still outstanding (ie. have not been returned to the store yet).
SELECT COUNT(*) FROM rental WHERE return_date IS NULL;

-- Find the 30 most expensive movies which are outstanding (ie. have not been returned to the store yet)
SELECT f.title, f.rental_rate
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.return_date IS NULL
    ORDER BY f.rental_rate DESC
    LIMIT 30;

-- My friend is at the store, and decides to rent a movie. He knows he wants to see 4 movies, 
-- but he can’t remember their names. i can help him find which movies he wants to rent?
    -- The 1st film : The film is about a sumo wrestler, and one of the actors is Penelope Monroe.
SELECT f.title, f.description
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE f.description ILIKE '%sumo wrestler%'
        AND a.first_name = 'Penelope'
        AND a.last_name = 'Monroe';

    -- The 2nd film : A short documentary (less than 1 hour long), rated “R”.
SELECT f.title, f.description
    FROM film f
    WHERE f.length < 60
        AND f.rating = 'R';
    -- The 3rd film : A film that his friend Matthew Mahan rented. 
    -- He paid over $4.00 for the rental, and he returned it between the 28th of July and the 1st of August, 2005.
SELECT f.title, f.description
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    WHERE c.first_name = 'Matthew'
        AND c.last_name = 'Mahan'
        AND r.rental_date BETWEEN '2005-07-28' AND '2005-08-01'
        AND r.return_date IS NOT NULL
        AND f.rental_rate > 4.00;
    -- The 4th film : His friend Matthew Mahan watched this film, as well. 
    -- It had the word “boat” in the title or description, and it looked like it was a very expensive DVD to replace.
SELECT f.title, f.description
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    WHERE c.first_name = 'Matthew'
        AND c.last_name = 'Mahan'
        AND (f.title ILIKE '%boat%' OR f.description ILIKE '%boat%')
        AND f.replacement_cost > 20.00;