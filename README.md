# SQL Developer Queries - Explanation

This README documents the SQL queries and datasets created as part of the **PLSQL-assignment/Stargit** repository. Below are detailed explanations of each query used in Oracle SQL Developer, including table creation, data insertion, and analytical queries using window functions.

---

## 1. Table Creation

```sql
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER,
    join_date DATE
);
```

**Explanation:**
This query creates a table named `employees` with the following columns:
- `emp_id`: A unique number that serves as the primary key.
- `emp_name`: Name of the employee (up to 50 characters).
- `department`: Department where the employee works.
- `salary`: Salary of the employee.
- `join_date`: The date the employee joined the organization.

---

## 2. Data Insertion

```sql
INSERT INTO employees (emp_id, emp_name, department, salary, join_date) VALUES
(1, 'Alice', 'HR', 60000, TO_DATE('2020-01-15', 'YYYY-MM-DD')),
(2, 'Bob', 'HR', 55000, TO_DATE('2020-03-10', 'YYYY-MM-DD')),
(3, 'Charlie', 'HR', 60000, TO_DATE('2021-06-01', 'YYYY-MM-DD')),
(4, 'David', 'IT', 80000, TO_DATE('2019-07-20', 'YYYY-MM-DD')),
(5, 'Eve', 'IT', 75000, TO_DATE('2020-10-25', 'YYYY-MM-DD')),
(6, 'Frank', 'IT', 80000, TO_DATE('2021-03-14', 'YYYY-MM-DD')),
(7, 'Grace', 'Sales', 50000, TO_DATE('2022-01-10', 'YYYY-MM-DD')),
(8, 'Heidi', 'Sales', 52000, TO_DATE('2022-03-05', 'YYYY-MM-DD'));
```

**Explanation:**
Inserts sample employee data into the `employees` table. Each entry includes the employee ID, name, department, salary, and joining date.

---

## 3. DENSE_RANK Query

```sql
SELECT *
FROM (
  SELECT *,
         DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
  FROM employees
) ranked
WHERE salary_rank <= 3;
```

**Explanation:**
- Uses the `DENSE_RANK()` window function to rank employees by salary within each department.
- The outer query filters to include only the top 3 earners in each department.

---

## 4. ROW_NUMBER Query

```sql
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date) AS join_order
  FROM employees
) ordered
WHERE join_order <= 2;
```

**Explanation:**
- Assigns a sequential number (`ROW_NUMBER`) to employees in each department ordered by their join date.
- Retrieves the first 2 employees (earliest joiners) in each department.

---

## 5. View Inserted Data

```sql
SELECT * FROM employees;
```

**Explanation:**
Simple query to display all records in the `employees` table.

---




