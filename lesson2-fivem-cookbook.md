
# Best Practices

> TIP: Following this will make your learning process, as well as your development efficiency be more smooth, seamless and bug free!


### 1. Consistent Naming: Use descriptive, consistent names for functions, variables, and events (e.g. ns_factory:server:CreateWeapon).

### 2. Namespace Your Events: Prefix your events and commands to avoid conflicts with other resources (e.g. ns_factory:).

### 3. Separation of Concerns: Keep client-side, server-side, and shared logic in separate files or folders.

### 4. Error Handling: Include robust error handling and logging to diagnose issues quickly.

### 5. Optimize Waits: Use Citizen.Wait strategically in loops to prevent CPU hogging without affecting responsiveness.

### 6. Documentation & Comments: Write concise comments and documentation to explain complex logic for future maintainability.

### 7. Resource Cleanup: Ensure proper cleanup of resources (e.g. removing event listeners, timers) when a resource stops or a player disconnects.

### 8. Modular Code: Break your code into small, reusable modules or functions to simplify testing and maintenance.

### 9. Write the program mentally, before writing code 

### 10. USE VERSION CONTROL SOFTWARE


## Version Control


Version control is a system that tracks changes to your code over time. It allows you to:

- Record Changes: Every modification is saved, letting you review, compare, or revert to earlier versions.

- Collaborate: Multiple developers can work on the same project simultaneously without overwriting each other's changes.

- Branch and Merge: Work on features in isolation (branches) and then merge them into the main codebase when they're ready.

- Backup and Audit: The entire history of changes is stored, providing a backup and a detailed record of the project’s evolution.

- This is essential for teamwork, accountability, and maintaining a robust, error-free codebase.



> Commits are: Packaged code with the selected content and a message describing changes.

> Branches: Copies of the same code that can be modified independently

> Merges are: Putting together two versions of the same codebase

### Useful Commands:
`git init`
`git remote add origin <url of the repo>`
`git add .`
`git commit`
`git pull`

## Database

SQL (Structured Query Language) is a standardized language used to interact with relational databases. It allows you to create, query, update, and manage data. 

```sql
CREATE DATABASE databasename;
```

```sql
SELECT: Retrieves data from one or more tables.

SELECT * FROM employees;
```


```sql 
INSERT: Adds new rows of data to a table.

INSERT INTO employees (name, position) VALUES ('Alice', 'Developer');
```

```sql
UPDATE: Modifies existing data in a table.

UPDATE employees SET position = 'Senior Developer' WHERE name = 'Alice';
```

```sql
DELETE: Removes data from a table.

DELETE FROM employees WHERE name = 'Alice';
```
```sql
CREATE TABLE: Defines a new table and its columns.

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100)
);
```


```sql
ALTER TABLE: Modifies the structure of an existing table (e.g., adding or removing columns).

ALTER TABLE employees ADD COLUMN salary DECIMAL(10,2);
```

```sql
DROP TABLE: Deletes an entire table and its data.

DROP TABLE employees;
```

## Command Line Interface (CLI)

```bash
Move a folder to another directory

mv folder folder1
mv C:/Users/test/fivem D:/fivem
```

```bash
If hello2 does not exist, mv will rename the folder to the value

mv hello hello2
```

```bash
Navigates to specified directory

cd folder1/qb-core/resource
cd ..
```

```bash
Listing all the content in a folder

ls
```

```bash
Create a folder/directory

mkdir folder/folder1/test
```

```bash
Creates a file

touch test.lua
touch client/client.lua
```
