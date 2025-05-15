                                -- PART I --

-- 1 - Create 2 Tables, Custmer and customer profile.
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
)

CREATE TABLE customer_profile (
    profile_id SERIAL PRIMARY KEY,
    isLoggedIn BOOLEAN DEFAULT FALSE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
)

-- 2 - Insert Some Records
INSERT INTO customer (first_name, last_name) VALUES
('John', 'Doe'),
('Jerome', 'Lalu'),
('Lea', 'Rive');

-- 3 - Insert customer profile
INSERT INTO customer_profile (isLoggedIn, customer_id) VALUES 
(true, SELECT customer_id FROM customer WHERE first_name = 'John'),
(false, SELECT customer_id FROM customer WHERE first_name = 'Jerome');

-- 4 - I - Display the loggedIn customers
SELECT c.first_name FROM customer c JOIN customer_profile cp ON c.customer_id = cp.customer_id WHERE cp.isLoggedIn = true;
-- 4 - II - All the customer first and is LoggedIn columns, even customer without profile
SELECT c.first_name, cp.isLoggedIn FROM customer c LEFT JOIN customer_profile cp ON c.customer_id = cp.customer_id;
-- 4 - III Number of customers that are not logged in
SELECT COUNT(*) FROM customer c LEFT JOIN customer_profile cp ON c.customer_id = cp.customer_id WHERE cp.isLoggedIn IS NULL;

                                -- PART II --

-- 1 -- Create Table Named Book
CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
);

-- 2 -- INsert Some books
INSERT INTO book (title, author) VALUES
('Alice In Wonderland', 'Lewis Carroll'),
('Harry Potter', 'J.K. Rowling');

-- 3 -- Create table name student -- Name must be not unique
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age <= 15) 
)

-- 4 -- Insert some students
INSERT INTO student (name, age) VALUES
('John', 12),
('Lera', 15);
('Patrick', 10),
('Bob', 14);

-- 5 -- Create table name library
-- book_fk_id ON DELETE CASCADE ON UPDATE CASCADE
CREATE TABLE library (
    book_fk_id INT,
    student_id INT,
    borrowed_date DATE,
    FOREIGN KEY (book_fk_id) REFERENCES book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6 -- Insert some records
INSERT INTO library (book_fk_id, student_id, borrowed_date) VALUES
(SELECT book_id FROM book WHERE title = 'Alice In Wonderland', SELECT student_id FROM student WHERE name = 'John', '15/02/2022'),
(SELECT book_id FROM book WHERE title = 'To kill a Mockingbird', SELECT student_id FROM student WHERE name = 'Bob', '03/03/2021'),
(SELECT book_id FROM book WHERE title = 'Alice In Wonderland', SELECT student_id FROM student WHERE name = 'Lera', '23/05/2021'),
(SELECT book_id FROM book WHERE title = 'Harry Potter', SELECT student_id FROM student WHERE name = 'Bob', '12/08/2021');

-- 7 -- Display the data
-- All the columns in the joinction table
SELECT b.title, s.name, l.borrowed_date FROM library l
JOIN book b ON l.book_fk_id = b.book_id
JOIN student s ON l.student_id = s.student_id;
-- name of the student and the title of the book they borrowed
SELECT s.name, b.title FROM library l
JOIN book b ON l.book_fk_id = b.book_id
JOIN student s ON l.student_id = s.student_id;
-- select the average of the children, that borrowed alice in the wonderland
SELECT AVG(s.age) AS average_age
FROM library l
JOIN book b ON l.book_fk_id = b.book_id
JOIN student s ON l.student_id = s.student_id
WHERE b.title = 'Alice In Wonderland';
-- Delte a student from the student table
DELETE FROM student WHERE name = 'Bob';
-- When the student Bob is deleted, all the junction tables will be deleted as well