-- Fetch the first students, by order alphabetical of their last_name.

SELECT first_name, last_name, birth_date FROM students ORDER BY last_name ASC LIMIT 1;

-- Fetch the détails of the youngest student.

SELECT * FROM students ORDER BY birth_date DESC LIMIT 1;

-- Fetch three students skipping the first two students.

SELECT * FROM students LIMIT 3 OFFSET 2;