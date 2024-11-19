Here are five PostgreSQL table creation problems with foreign key relationships, progressively increasing in difficulty. The final questions involve indexing and views, as requested.

# 1. **Basic Table with Foreign Key**

- Create a `departments` table with fields for `department_id` (as the primary key) and `department_name`. Then create an `employees` table with fields for `employee_id` (as the primary key), `first_name`, and `last_name`. Ensure that the `employees` table has a foreign key `department_id` referencing the `departments` table.

## Solution

```sql
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

```

### 2. **Multiple Foreign Keys and Cascading Constraints**

- Extend the `employees` table to include an additional foreign key `manager_id` that references `employee_id` in the same `employees` table (i.e., a self-referential foreign key). Set this foreign key constraint to cascade updates and deletes so that if a manager’s `employee_id` is updated or deleted, all associated employees are updated or deleted accordingly.

```sql

ALTER TABLE employees
  ADD COLUMN manager_id INT,
  ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id)
  REFERENCES employees(employees_id)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

```

### 3. **Project Table with Composite Primary Key and Foreign Keys**

- Create a `projects` table to store information about employee projects. This table should include fields `project_id`, `project_name`, `department_id`, and `employee_id`, where:
  - `department_id` is a foreign key referencing the `departments` table.
  - `employee_id` is a foreign key referencing the `employees` table.
- Use a composite primary key on `project_id` and `department_id`.

### 4. **Indexing Foreign Keys for Performance Optimization**

- Create a `time_logs` table to track hours worked by each employee on each project. Include fields `log_id`, `employee_id`, `project_id`, `hours_worked`, and `log_date`.
  - Set foreign keys for `employee_id` referencing the `employees` table and `project_id` referencing the `projects` table.
  - Create an index to optimize queries on `employee_id` and `project_id` in the `time_logs` table to speed up retrieval of logs associated with each employee and project combination.

### 5. **Creating a Summary View with Aggregate Data**

- Based on the tables created, build a `department_summary` view to display the total hours worked by employees in each department on all projects. This view should:
  - Show each department’s total hours worked and average hours per project.
  - Use an indexed column in the view to optimize retrieval speed for departments with high total hours worked.
