-- Exercices 1: DVD Rental
    -- Get a list of all the languages
SELECT * FROM language;

-- Get a list of all films joined with teir language. WE need to select the details : film title, description, Language name
SELECT f.title, f.description, l.name language_name
    FROM film f
    JOIN language l 
    ON f.language_id = l.language_id;

-- Get all languages, even if there are no films in those languages – select the following details : film title, description, and language name.
SELECT f.title, f.description, l.name language_name 
    FROM language l 
    LEFT OUTER JOIN film f 
    ON f.language_id = l.language_id;

-- new table called new_film with the following columns : id, name. Add some new films to the table.

DROP TABLE IF EXISTS new_film;
CREATE TABLE IF NOT EXISTS new_film
(
    film_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Insert Some new films

INSERT INTO new_film (
    name
)
VALUES
    ('Fight Club'),
    ('Evangelion 1.0: You Are (Not) Alone'),
    ('Evangelion 2.0: You Can (Not) Advance'),
    ('Evangelion 3.0: You Can (Not) Redo');

-- Create new table called customer_review
DROP TABLE IF EXISTS customer_review;
CREATE TABLE IF NOT EXISTS customer_review
(
    review_id SERIAL PRIMARY KEY,
    film_id INTEGER NOT NULL,
    language_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    score INTEGER NOT NULL,
    review_text TEXT NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES new_film (film_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES language (language_id)
);

-- Let's add 2 movie reviews. Make sure you link them to valid objects in the other tables.
INSERT INTO customer_review (
    film_id,
    language_id,
    title,
    score,
    review_text
)
VALUES
    (1, 1, 'Great Movie', 5, 'I really enjoyed this movie.'),
    (2, 2, 'Not my cup of tea', 2, 'I did not like this movie at all.'),
    (3, 3, 'Average', 3, 'It was okay, nothing special.'),
    (4, 4, 'Masterpiece', 10, 'This is a must-watch for everyone.');

-- Let's delete a film that has a review from the new_film table, what happens to the customer_review table?
DELETE FROM new_film WHERE id = 1;
-- The review will be deleted as well because of the ON DELETE CASCADE constraint on the foreign key.