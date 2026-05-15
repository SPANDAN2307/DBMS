DROP TABLE IF EXISTS Tasks;
DROP TABLE IF EXISTS Projects;

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    task_desc VARCHAR(50),
    project_id INT,
    estimated_hours INT,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Projects VALUES (1, 'Website Redesign'), (2, 'Mobile App Launch');

INSERT INTO Tasks VALUES 
(101, 'Design UI', 1, 40), 
(102, 'Develop Backend', 2, 80), 
(103, 'Write Content', 1, 30);

SELECT task_id, task_desc, estimated_hours FROM Tasks 
WHERE estimated_hours > (SELECT AVG(estimated_hours) FROM Tasks);

SELECT project_name FROM Projects 
WHERE project_id IN (SELECT project_id FROM Tasks WHERE estimated_hours > 35);

SELECT task_id, task_desc, project_id FROM Tasks 
WHERE project_id IN (SELECT project_id FROM Tasks GROUP BY project_id HAVING COUNT(*) > 1);

SELECT task_id, task_desc, project_id, estimated_hours FROM Tasks t 
WHERE estimated_hours = (SELECT MAX(estimated_hours) FROM Tasks WHERE project_id = t.project_id);
