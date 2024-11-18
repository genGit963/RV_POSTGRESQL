In PostgreSQL, a foreign key (FK) is used to establish a relationship between two tables, ensuring that the value in the foreign key column of a child table corresponds to a valid value in the primary key column of the referenced (parent) table. This helps maintain referential integrity between related data.

Here's how to create a foreign key reference in PostgreSQL:

### Basic Syntax

```sql
CREATE TABLE parent_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE child_table (
    id SERIAL PRIMARY KEY,
    parent_id INT,
    description TEXT,
    CONSTRAINT fk_parent FOREIGN KEY (parent_id)
    REFERENCES parent_table (id)
    ON DELETE CASCADE
);
```

### Explanation:

1. **parent_table**: This is the parent table that contains the primary key (`id`).
2. **child_table**: This table contains a foreign key column (`parent_id`) that references the `id` column of the `parent_table`.
3. **FOREIGN KEY (parent_id)**: This defines the foreign key constraint on the `parent_id` column.
4. **REFERENCES parent_table (id)**: This specifies the table (`parent_table`) and the column (`id`) being referenced.
5. **ON DELETE CASCADE**: This optional clause specifies that if a row in the `parent_table` is deleted, any related rows in the `child_table` should be automatically deleted as well.

### Foreign Key Constraints Options:

- **ON DELETE CASCADE**: Automatically deletes rows in the child table when the corresponding row in the parent table is deleted.
- **ON DELETE SET NULL**: Sets the foreign key column to `NULL` when the referenced row in the parent table is deleted.
- **ON DELETE RESTRICT**: Prevents deletion of the row in the parent table if any related rows exist in the child table.
- **ON DELETE NO ACTION**: Similar to `RESTRICT`, but defers the constraint check until the end of the transaction.

### Example of Data Insertion:

```sql
-- Inserting into the parent table
INSERT INTO parent_table (name) VALUES ('Parent 1');
-- Inserting into the child table
INSERT INTO child_table (parent_id, description) VALUES (1, 'Child of Parent 1');
```

This establishes a relationship where the `child_table`'s `parent_id` column points to a row in the `parent_table`.

Let me know if you'd like more details on any part of this process!