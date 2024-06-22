CREATE DATABASE LNCT;
USE LNCT;

CREATE TABLE batch(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO batch VALUES
(101, "Sakshm"),
(102, "Ankush"),
(103, "Saiyam");

CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course VALUES
(102, "English"),
(105, "Hindi"),
(103, "Science"),
(107, "Computer");

SELECT * FROM batch;
SELECT * FROM course;

SELECT * 
FROM batch AS a
INNER JOIN course AS b
ON a.id = b.id;

SELECT * 
FROM batch AS a
LEFT JOIN course AS b
ON a.id = b.id;

SELECT * 
FROM batch AS a
RIGHT JOIN course AS b
ON a.id = b.id; 

SELECT * FROM batch AS a
LEFT JOIN course AS b
ON a.id = b.id
UNION
SELECT * FROM batch AS a
RIGHT JOIN course AS b
ON a.id = b.id;

SELECT * FROM batch AS a
LEFT JOIN course AS b
ON a.id = b.id
WHERE b.id IS NULL;

SELECT * FROM batch AS a
RIGHT JOIN course AS b
ON a.id = b.id
WHERE a.id IS NULL;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT a.name as manager_name , b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;

SELECT name FROM employee
UNION ALL
SELECT name FROM employee;
