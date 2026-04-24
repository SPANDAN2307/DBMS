CREATE DATABASE Practicals;
USE Practicals;
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);
CREATE TABLE Students (
    student_id INT PRIMARY KEY,          -- PRIMARY KEY
    name VARCHAR(50) NOT NULL,           -- NOT NULL
    email VARCHAR(100) UNIQUE,           -- UNIQUE
    age INT CHECK (age >= 18),           -- CHECK constraint
    course_id INT,                       -- Foreign key reference
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Courses (course_id, course_name, credits)
VALUES (101, 'Database Systems', 4),
       (102, 'Computer Architecture', 3);
INSERT INTO Students (student_id, name, email, age, course_id)
VALUES (1, 'Harshal', 'harshal@example.com', 20, 101),
       (2, 'Shubbu', 'shubbu@example.com', 22, 102);
SELECT * FROM Students;
SELECT * FROM Courses;
ALTER TABLE Students ADD phone VARCHAR(15);
ALTER TABLE Students MODIFY email VARCHAR(150);
SELECT * FROM Students;

ALTER TABLE Students DROP COLUMN phone;
SELECT * FROM Students;

RENAME TABLE Students TO Learners;
SELECT * FROM Learners;
TRUNCATE TABLE Learners;
SELECT * FROM Learners;
DROP TABLE Learners;
DROP TABLE Courses;
SHOW TABLES;