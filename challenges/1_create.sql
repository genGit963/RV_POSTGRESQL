-- 1. challenge
CREATE TABLE departments (
    dprt_id SERIAL PRIMARY KEY,
    dprt_name VARCHAR(40) NOT NULL,
    dprt_code VARCHAR(50)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL, 
    last_name VARCHAR(100) NOT NULL,
    "position" VARCHAR(40) NOT NULL,
    salary DECIMAL(10, 2),
    hire_date DATE DEFAULT CURRENT_DATE,
    department_id INT,
    -- reference to department
    CONSTRAINT fk_department FOREIGN KEY (department_id)
    REFERENCES departments(dprt_id) ON DELETE CASCADE
);

INSERT INTO departments (dprt_name, dprt_code)
VALUES
    ('Human Resources', 'HR001'),
    ('Finance', 'FN002'),
    ('Engineering', 'EN003'),
    ('Marketing', 'MK004'),
    ('Sales', 'SL005');

SELECT * FROM departments;

-- employees 
INSERT INTO employees (first_name, last_name, "position", salary, department_id)
VALUES
    ('John', 'Doe', 'HR Manager', 60000, 1),
    ('Jane', 'Smith', 'Recruiter', 45000, 1),
    ('Mark', 'Johnson', 'Senior Accountant', 70000, 2),
    ('Emily', 'Davis', 'Junior Accountant', 50000, 2),
    ('Michael', 'Miller', 'Software Engineer', 95000, 3),
    ('Sarah', 'Wilson', 'Junior Developer', 55000, 3),
    ('David', 'Moore', 'Senior Developer', 110000, 3),
    ('Linda', 'Taylor', 'Marketing Specialist', 65000, 4),
    ('James', 'Anderson', 'Marketing Manager', 80000, 4),
    ('Paul', 'Thomas', 'Sales Manager', 85000, 5),
    ('Alice', 'Jackson', 'Sales Executive', 45000, 5),
    ('John', 'Martinez', 'Sales Executive', 47000, 5),
    ('Anna', 'Garcia', 'Software Engineer', 95000, 3),
    ('Robert', 'Hernandez', 'Product Manager', 105000, 3),
    ('Laura', 'Lewis', 'UX Designer', 75000, 3),
    ('Jack', 'Young', 'Finance Analyst', 60000, 2),
    ('Olivia', 'White', 'Marketing Coordinator', 54000, 4),
    ('Sophia', 'King', 'HR Assistant', 40000, 1),
    ('Mason', 'Scott', 'Data Scientist', 110000, 3);

INSERT INTO employees (first_name, last_name, "position", salary, department_id)
VALUES
    ('William', 'Walker', 'HR Assistant', 42000, 1),
    ('Ella', 'Roberts', 'HR Generalist', 48000, 1),
    ('Isabella', 'Parker', 'Senior Accountant', 75000, 2),
    ('Liam', 'Evans', 'Junior Accountant', 53000, 2),
    ('Ethan', 'Collins', 'Senior Software Engineer', 120000, 3),
    ('Ava', 'Morris', 'Junior Developer', 56000, 3),
    ('Daniel', 'Lee', 'Backend Developer', 92000, 3),
    ('Sophia', 'Martinez', 'Graphic Designer', 68000, 4),
    ('Henry', 'Clark', 'Social Media Manager', 59000, 4),
    ('Ella', 'King', 'Regional Sales Manager', 98000, 5),
    ('Lucas', 'Wright', 'Sales Executive', 47000, 5),
    ('Chloe', 'Adams', 'Sales Executive', 46000, 5),
    ('Grace', 'Baker', 'Lead Developer', 115000, 3),
    ('Oliver', 'Gonzalez', 'Software Engineer', 100000, 3),
    ('Mia', 'Nelson', 'Marketing Analyst', 72000, 4),
    ('Jack', 'Carter', 'Finance Director', 130000, 2),
    ('Samuel', 'Mitchell', 'Full Stack Developer', 105000, 3),
    ('Zoe', 'Perez', 'Project Manager', 85000, 3),
    ('Benjamin', 'Roberts', 'Sales Representative', 48000, 5);

SELECT * FROM employees;

-- 2. challange
ALTER TABLE employees 
	ADD COLUMN manager_id INT,
	ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id)
	REFERENCES employees(employee_id) 
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- Insert 10 employees with manager references
INSERT INTO employees (first_name, last_name, "position", salary, department_id, manager_id)
VALUES
    ('Tom', 'Baker', 'HR Coordinator', 45000, 1, 1),          -- Reports to employee_id 1
    ('Linda', 'Reed', 'HR Specialist', 47000, 1, 1),          -- Reports to employee_id 1
    ('Samantha', 'Cook', 'Finance Analyst', 52000, 2, 3),     -- Reports to employee_id 3
    ('Gary', 'Johnson', 'Finance Associate', 54000, 2, 3),    -- Reports to employee_id 3
    ('Nancy', 'Drew', 'Software Engineer', 95000, 3, 5),      -- Reports to employee_id 5
    ('Jason', 'Gray', 'Backend Developer', 90000, 3, 5),      -- Reports to employee_id 5
    ('Kim', 'Nguyen', 'Frontend Developer', 88000, 3, 6),     -- Reports to employee_id 6
    ('Victor', 'Li', 'UX Designer', 78000, 3, 6),             -- Reports to employee_id 6
    ('Rachel', 'Adams', 'Marketing Coordinator', 60000, 4, 8),-- Reports to employee_id 8
    ('Kevin', 'Young', 'Sales Executive', 50000, 5, 10);      -- Reports to employee_id 10


-- 3. challange
CREATE TABLE projects (
  project_id INT,
  project_name VARCHAR(120) NOT NULL,
  department_id INT,
  employee_id INT,
  PRIMARY KEY (project_id, department_id),
  CONSTRAINT fk_employee FOREIGN KEY (employee_id)
  REFERENCES employees(employee_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id)
  REFERENCES departments(dprt_id) ON UPDATE CASCADE);

INSERT INTO projects (project_id, project_name, department_id, employee_id) VALUES
  (1, 'Project Alpha', 1, 12),
  (2, 'Project Beta', 2, 25),
  (3, 'Project Gamma', 3, 30),
  (4, 'Project Delta', 4, 15),
  (5, 'Project Epsilon', 5, 67),
  (6, 'Project Zeta', 1, 45),
  (7, 'Project Eta', 2, 52),
  (8, 'Project Theta', 3, 9),
  (9, 'Project Iota', 4, 34),
  (10, 'Project Kappa', 5, 27),
  (11, 'Project Lambda', 1, 18),
  (12, 'Project Mu', 2, 33),
  (13, 'Project Nu', 3, 7),
  (14, 'Project Xi', 4, 48),
  (15, 'Project Omicron', 5, 21),
  (16, 'Project Pi', 1, 39),
  (17, 'Project Rho', 2, 60),
  (18, 'Project Sigma', 3, 55),
  (19, 'Project Tau', 4, 11),
  (20, 'Project Upsilon', 5, 5);

  INSERT INTO projects (project_id, project_name, department_id, employee_id) VALUES
  (21, 'Project Omega', 1, 8),
  (22, 'Project Phi', 2, 19),
  (23, 'Project Chi', 3, 13),
  (24, 'Project Psi', 4, 37),
  (25, 'Project Alpha II', 5, 2),
  (26, 'Project Beta II', 1, 24),
  (27, 'Project Gamma II', 2, 41),
  (28, 'Project Delta II', 3, 29),
  (29, 'Project Epsilon II', 4, 43),
  (30, 'Project Zeta II', 5, 16),
  (31, 'Project Eta II', 1, 4),
  (32, 'Project Theta II', 2, 56),
  (33, 'Project Iota II', 3, 61),
  (34, 'Project Kappa II', 4, 23),
  (35, 'Project Lambda II', 5, 6),
  (36, 'Project Mu II', 1, 49);

 select * from projects;


 --4. challenge
CREATE TABLE time_logs (
  log_id SERIAL PRIMARY KEY,
  employee_id INT NOT NULL,
  project_id INT NOT NULL,
  department_id INT NOT NULL,
  hours_worked DECIMAL(5,2) NOT NULL,
  log_date DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_employee FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id),
  CONSTRAINT fk_project_department FOREIGN KEY (project_id,department_id) 
  	REFERENCES projects(project_id, department_id)
);

-- Create an index on employee_id and project_id for optimized querying
CREATE INDEX idx_employee_project ON time_logs (employee_id, project_id);


INSERT INTO time_logs (project_id, department_id, employee_id, hours_worked, log_date) VALUES
  (1, 1, 12, 5.50, '2024-11-01'),
  (2, 2, 25, 7.25, '2024-11-02'),
  (3, 3, 30, 4.75, '2024-11-03'),
  (4, 4, 15, 6.00, '2024-11-04'),
  (5, 5, 67, 3.25, '2024-11-05'),
  (6, 1, 45, 8.00, '2024-11-06'),
  (7, 2, 52, 2.50, '2024-11-07'),
  (8, 3, 9, 7.00, '2024-11-08'),
  (9, 4, 34, 5.75, '2024-11-09'),
  (10, 5, 27, 6.50, '2024-11-10'),
  (11, 1, 18, 4.00, '2024-11-11'),
  (12, 2, 33, 5.25, '2024-11-12'),
  (13, 3, 7, 3.00, '2024-11-13'),
  (14, 4, 48, 6.75, '2024-11-14'),
  (15, 5, 21, 2.50, '2024-11-15'),
  (16, 1, 39, 7.50, '2024-11-16'),
  (17, 2, 60, 3.75, '2024-11-17'),
  (18, 3, 55, 8.00, '2024-11-18'),
  (19, 4, 11, 4.25, '2024-11-19'),
  (20, 5, 5, 5.00, '2024-11-20'),
  (21, 1, 8, 6.50, '2024-11-21'),
  (22, 2, 19, 3.25, '2024-11-22'),
  (23, 3, 13, 7.25, '2024-11-23'),
  (24, 4, 37, 6.00, '2024-11-24'),
  (25, 5, 2, 2.75, '2024-11-25');

INSERT INTO time_logs (project_id, department_id, employee_id, hours_worked, log_date) VALUES
  (26, 1, 41, 6.25, '2024-11-26'),
  (27, 2, 32, 5.50, '2024-11-27'),
  (28, 3, 22, 7.75, '2024-11-28'),
  (29, 4, 14, 4.50, '2024-11-29'),
  (30, 5, 3, 6.00, '2024-11-30'),
  (31, 1, 53, 3.75, '2024-12-01'),
  (32, 2, 62, 8.00, '2024-12-02'),
  (33, 3, 47, 2.25, '2024-12-03'),
  (34, 4, 50, 7.00, '2024-12-04'),
  (35, 5, 29, 5.00, '2024-12-05');


SELECT * FROM time_logs;
select * from employees;
select * from departments;
select * from projects;

-- 5. challenge
CREATE MATERIALIZED VIEW department_summary AS
SELECT 
  d.dprt_name AS department_name,
  SUM(t.hours_worked) AS total_hours_worked,
  AVG(t.hours_worked) AS average_hours_per_project
FROM 
  departments d
JOIN 
  projects p ON d.dprt_id = p.department_id
JOIN 
  time_logs t ON p.project_id = t.project_id AND p.department_id = t.department_id
GROUP BY 
  d.dprt_name
ORDER BY 
  total_hours_worked DESC;

-- Create an index on the total_hours_worked column to optimize retrieval by departments with high total hours
CREATE INDEX idx_total_hours_worked ON department_summary (total_hours_worked);



