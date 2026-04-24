CREATE DATABASE IF NOT EXISTS Practicals;
USE Practicals;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Courses VALUES 
(101, 'Database Systems', 4),
(102, 'Computer Architecture', 3);

INSERT INTO Students VALUES 
(1, 'Harshal', 'harshal@example.com', 20, 101),
(2, 'Shubbu', 'shubbu@example.com', 22, 102);

SELECT * FROM Students;
SELECT * FROM Courses;

ALTER TABLE Students ADD phone VARCHAR(15);
ALTER TABLE Students MODIFY email VARCHAR(150);
ALTER TABLE Students DROP COLUMN phone;

RENAME TABLE Students TO Learners;

TRUNCATE TABLE Learners;
DROP TABLE Learners;
DROP TABLE Courses;