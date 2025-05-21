-- Exercise 2 – Happy Halloween
-- How many stores there are, and in which city and country they are located.
SELECT COUNT(*) AS store_count, c.city, co.country
    FROM store s
    JOIN address a ON s.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    JOIN country co ON c.country_id = co.country_id
    GROUP BY s.store_id, c.city, co.country;

-- How many hours of viewing time there are in total in each store – 
-- in other words, the sum of the length of every inventory item in each store.
SELECT s.store_id, SUM(f.length)/60 AS total_viewing_time
    FROM store s
    JOIN inventory i ON s.store_id = i.store_id
    JOIN film f ON i.film_id = f.film_id
    GROUP BY s.store_id;

-- Make sure to exclude any inventory items which are not yet returned. 
-- (Yes, even in the time of zombies there are people who do not return their DVDs)
SELECT s.store_id, SUM(f.length)/60 AS total_viewing_time
    FROM store s
    JOIN inventory i ON s.store_id = i.store_id
    JOIN film f ON i.film_id = f.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.return_date IS NOT NULL
    GROUP BY s.store_id;

-- A list of all customers in the cities where the stores are located.
SELECT DISTINCT c.first_name, c.last_name, ci.city
    FROM customer c
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN store s ON a.address_id = s.address_id;

-- A list of all customers in the countries where the stores are located.
SELECT DISTINCT c.first_name, c.last_name, co.country
FROM customer c
JOIN address ca ON c.address_id = ca.address_id
JOIN city cci ON ca.city_id = cci.city_id
JOIN country co ON cci.country_id = co.country_id
WHERE co.country_id IN (
    SELECT DISTINCT ci.country_id
    FROM store s
    JOIN address a ON s.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
);
-- Some people will be frightened by watching scary movies while zombies walk the streets. 
-- Create a ‘safe list’ of all movies which do not include the ‘Horror’ category, or contain the words 
-- ‘beast’, ‘monster’, ‘ghost’, ‘dead’, ‘zombie’, or ‘undead’ in their titles or descriptions… Get the sum of their viewing time (length).
SELECT SUM(f.length)/60 AS total_safe_viewing_time
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name != 'Horror'
        AND (f.title ILIKE '%beast%' OR f.title ILIKE '%monster%' OR f.title ILIKE '%ghost%' 
            OR f.title ILIKE '%dead%' OR f.title ILIKE '%zombie%' OR f.title ILIKE '%undead%'
            OR f.description ILIKE '%beast%' OR f.description ILIKE '%monster%' 
            OR f.description ILIKE '%ghost%' OR f.description ILIKE '%dead%' 
            OR f.description ILIKE '%zombie%' OR f.description ILIKE '%undead%');

-- For both the ‘general’ and the ‘safe’ lists above, also calculate the time in hours and days (not just minutes).
SELECT SUM(f.length)/60 AS total_viewing_time_hours,
       SUM(f.length)/(60*24) AS total_viewing_time_days