Here’s a detailed PostgreSQL cheat sheet with the essential commands for database management, table manipulation, querying, and more.

---

### **1. Basic Commands**

- **Connect to PostgreSQL**:
  ```bash
  psql -U username -d database_name
  ```
- **List all databases**:
  ```sql
  \l
  ```
- **Connect to a database**:
  ```sql
  \c database_name
  ```
- **List tables in a database**:
  ```sql
  \dt
  ```
- **Describe a table** (table schema):
  ```sql
  \d table_name
  ```
- **Exit `psql`**:
  ```sql
  \q
  ```

---

### **2. Database Management**

- **Create a database**:
  ```sql
  CREATE DATABASE database_name;
  ```
- **Delete a database**:
  ```sql
  DROP DATABASE database_name;
  ```
- **Rename a database**:
  ```sql
  ALTER DATABASE old_database_name RENAME TO new_database_name;
  ```
- **Create a user**:
  ```sql
  CREATE USER username WITH PASSWORD 'password';
  ```
- **Grant privileges**:
  ```sql
  GRANT ALL PRIVILEGES ON DATABASE database_name TO username;
  ```

---

### **3. Table Management**

- **Create a table**:

  ```sql
  CREATE TABLE table_name (
      column1_name data_type constraints,
      column2_name data_type constraints,
      ...
  );
  ```

  Example:

  ```sql
  CREATE TABLE employees (
      id SERIAL PRIMARY KEY,
      name VARCHAR(100),
      position VARCHAR(50),
      salary NUMERIC(15, 2),
      join_date DATE
  );
  ```

- **Drop a table**:
  ```sql
  DROP TABLE table_name;
  ```
- **Rename a table**:
  ```sql
  ALTER TABLE old_table_name RENAME TO new_table_name;
  ```
- **Add a column**:
  ```sql
  ALTER TABLE table_name ADD COLUMN column_name data_type;
  ```
- **Drop a column**:
  ```sql
  ALTER TABLE table_name DROP COLUMN column_name;
  ```
- **Modify a column**:
  ```sql
  ALTER TABLE table_name ALTER COLUMN column_name TYPE new_data_type;
  ```

---

### **4. Constraints**

- **Primary Key**:
  ```sql
  column_name SERIAL PRIMARY KEY
  ```
- **Unique**:
  ```sql
  column_name data_type UNIQUE
  ```
- **Not Null**:
  ```sql
  column_name data_type NOT NULL
  ```
- **Foreign Key**:
  ```sql
  column_name data_type REFERENCES other_table (column_name)
  ```
- **Check**:
  ```sql
  column_name data_type CHECK (condition)
  ```

---

### **5. Insert, Update, Delete Data**

- **Insert data**:
  ```sql
  INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
  ```
- **Insert multiple rows**:
  ```sql
  INSERT INTO table_name (column1, column2) VALUES (value1a, value2a), (value1b, value2b);
  ```
- **Update data**:
  ```sql
  UPDATE table_name SET column_name = new_value WHERE condition;
  ```
- **Delete data**:
  ```sql
  DELETE FROM table_name WHERE condition;
  ```

---

### **6. Querying Data**

- **Select all columns**:
  ```sql
  SELECT * FROM table_name;
  ```
- **Select specific columns**:
  ```sql
  SELECT column1, column2 FROM table_name;
  ```
- **Where clause**:
  ```sql
  SELECT * FROM table_name WHERE condition;
  ```
- **Order by**:
  ```sql
  SELECT * FROM table_name ORDER BY column_name ASC|DESC;
  ```
- **Limit rows**:
  ```sql
  SELECT * FROM table_name LIMIT number_of_rows;
  ```
- **Distinct values**:
  ```sql
  SELECT DISTINCT column_name FROM table_name;
  ```
- **Group by**:
  ```sql
  SELECT column, COUNT(*) FROM table_name GROUP BY column;
  ```
- **Having clause** (filter after grouping):
  ```sql
  SELECT column, COUNT(*) FROM table_name GROUP BY column HAVING COUNT(*) > value;
  ```

---

### **7. Joins**

- **Inner Join**:
  ```sql
  SELECT table1.column, table2.column
  FROM table1
  INNER JOIN table2 ON table1.common_column = table2.common_column;
  ```
- **Left Join**:
  ```sql
  SELECT table1.column, table2.column
  FROM table1
  LEFT JOIN table2 ON table1.common_column = table2.common_column;
  ```
- **Right Join**:
  ```sql
  SELECT table1.column, table2.column
  FROM table1
  RIGHT JOIN table2 ON table1.common_column = table2.common_column;
  ```
- **Full Outer Join**:
  ```sql
  SELECT table1.column, table2.column
  FROM table1
  FULL OUTER JOIN table2 ON table1.common_column = table2.common_column;
  ```

---

### **8. Functions and Aggregates**

- **Count**:
  ```sql
  SELECT COUNT(*) FROM table_name;
  ```
- **Sum**:
  ```sql
  SELECT SUM(column_name) FROM table_name;
  ```
- **Average**:
  ```sql
  SELECT AVG(column_name) FROM table_name;
  ```
- **Maximum**:
  ```sql
  SELECT MAX(column_name) FROM table_name;
  ```
- **Minimum**:
  ```sql
  SELECT MIN(column_name) FROM table_name;
  ```

---

### **9. Transactions**

- **Begin transaction**:
  ```sql
  BEGIN;
  ```
- **Commit transaction**:
  ```sql
  COMMIT;
  ```
- **Rollback transaction**:
  ```sql
  ROLLBACK;
  ```

---

### **10. Indexes**

- **Create an index**:
  ```sql
  CREATE INDEX index_name ON table_name (column_name);
  ```
- **Drop an index**:
  ```sql
  DROP INDEX index_name;
  ```

---

### **11. Views**

- **Create a view**:
  ```sql
  CREATE VIEW view_name AS
  SELECT columns FROM table_name WHERE condition;
  ```
- **Drop a view**:
  ```sql
  DROP VIEW view_name;
  ```

---

### **12. JSON and Array Functions**

- **Select JSON object**:
  ```sql
  SELECT column->'key' FROM table_name;
  ```
- **Select array element**:
  ```sql
  SELECT column[1] FROM table_name;
  ```

---

### **13. Miscellaneous Commands**

- **Show current database**:
  ```sql
  SELECT current_database();
  ```
- **Show current user**:
  ```sql
  SELECT current_user;
  ```
- **Show current date and time**:
  ```sql
  SELECT now();
  ```

This should give you a robust starting point for working with PostgreSQL! Let me know if you’d like details on any specific area.
