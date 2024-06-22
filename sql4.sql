CREATE DATABASE SIRT;
USE SIRT;

CREATE TABLE kk(
	rollno INT PRIMARY KEY,
    name VARCHAR(40),
    marks INT,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO kk(rollno, name, marks, grade, city) VALUES
(101, "Alok", 78, "C", "Pune"),
(102, "Sumit", 92, "B", "Bhopal"),
(103, "Alakh", 87, "A", "Singroli"),
(104, "Anurag", 89, "A", "Delhi"),
(105, "Arjun", 98, "A", "Bhopal");

SELECT * FROM kk;
SELECT DISTINCT city FROM kk;
SELECT name, marks FROM kk;
SELECT city FROM kk;

SELECT * FROM kk WHERE marks > 95 AND city = "Bhopal";
SELECT * FROM kk WHERE marks > 95 OR city = "Bhopal";

SELECT * FROM kk WHERE marks BETWEEN 80 AND 90;
SELECT * FROM kk WHERE city IN("Bhopal", "Delhi");
SELECT * FROM kk WHERE city NOT IN("Bhopal", "Delhi");

SELECT * FROM kk WHERE marks > 80
LIMIT 3;

SELECT * FROM kk ORDER BY marks DESC
LIMIT 3; 

SELECT count(rollno) FROM kk;

SELECT city FROM kk GROUP BY city;

SELECT city, avg(marks)
FROM kk
GROUP BY city
ORDER BY avg(marks) ASC;

SELECT grade, count(rollno)
FROM kk
GROUP BY grade
ORDER BY grade ASC; 

SELECT city, count(rollno)
FROM kk
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city
FROM kk
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 87
ORDER BY city ASC;

SET SQL_SAFE_UPDATES = 0;

UPDATE kk
SET grade = "O"
WHERE grade = "A";

SELECT * FROM kk;

UPDATE kk
SET grade = "P"
WHERE marks BETWEEN 80 AND 90;

UPDATE kk
SET marks = marks+1;

DELETE FROM kk
WHERE marks < 30;

SELECT * FROM kk;

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept VALUES(101, "ENGLISH");
INSERT INTO dept VALUES(103, "HINDI");

UPDATE dept
SET id = 102
WHERE id = 103;

SELECT * FROM dept;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

SELECT * FROM kk;

TRUNCATE TABLE kk;

ALTER TABLE STJ
RENAME kk;

ALTER TABLE kk
ADD COLUMN age INT;

ALTER TABLE kk
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE kk
CHANGE COLUMN age stu_age INT;

ALTER TABLE kk
DROP COLUMN age;

INSERT INTO kk VALUES(107, "Himanshu", 82, "A", "Bhopal", 189);

INSERT INTO teacher VALUES(108, "AJAY", 101);
INSERT INTO teacher VALUES(104, "SHYAM", 103);

SELECT * FROM teacher;

ALTER TABLE kk
CHANGE COLUMN name full_name VARCHAR(50);
DELETE FROM kk
WHERE marks < 80;
ALTER TABLE kk
DROP COLUMN grade;
ALTER TABLE kk
DROP COLUMN stu_age;

SELECT * FROM kk;

SELECT AVG(marks) FROM kk;
SELECT name, marks FROM kk
WHERE marks > (SELECT AVG(marks) FROM kk);

SELECT rollno FROM kk
WHERE rollno%2 = 0;

SELECT name, rollno FROM kk
WHERE rollno IN (102, 104);

SELECT name, rollno FROM kk
WHERE rollno IN (SELECT rollno FROM kk
WHERE rollno%2 = 0);

SELECT * FROM kk
WHERE city = "Bhopal";

SELECT MAX(marks) FROM (SELECT * FROM kk
WHERE city = "Bhopal"
) AS temp;

SELECT (SELECT MAX(marks) FROM kk), name FROM kk;

CREATE VIEW view1 AS SELECT rollno, name, marks FROM kk;

SELECT * FROM view1;

SELECT * FROM kk
WHERE marks > 85;

SELECT name, marks FROM kk
WHERE marks > 85;

DROP VIEW view1;

SELECT * FROM view1;
