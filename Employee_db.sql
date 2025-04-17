ALTER USER dev_user QUOTA UNLIMITED ON USERS;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);


INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (1, 'Alice', 'HR', 60000, TO_DATE('2020-01-15', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (2, 'Bob', 'HR', 55000, TO_DATE('2020-03-10', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (3, 'Charlie', 'HR', 60000, TO_DATE('2021-06-01', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (4, 'David', 'IT', 80000, TO_DATE('2019-07-20', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (5, 'Eve', 'IT', 75000, TO_DATE('2020-10-25', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (6, 'Frank', 'IT', 80000, TO_DATE('2021-03-14', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (7, 'Grace', 'Sales', 50000, TO_DATE('2022-01-10', 'YYYY-MM-DD'));

INSERT INTO employees (emp_id, emp_name, department, salary, join_date)
VALUES (8, 'Heidi', 'Sales', 52000, TO_DATE('2022-03-05', 'YYYY-MM-DD'));

COMMIT;

SELECT * FROM employees;


SELECT
  emp_id,
  emp_name,
  department,
  salary,
  LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS prev_salary,
  LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary,
  CASE
    WHEN salary > LAG(salary) OVER (PARTITION BY department ORDER BY salary) THEN 'HIGHER'
    WHEN salary < LAG(salary) OVER (PARTITION BY department ORDER BY salary) THEN 'LOWER'
    WHEN salary = LAG(salary) OVER (PARTITION BY department ORDER BY salary) THEN 'EQUAL'
    ELSE 'N/A'
  END AS compare_with_prev
FROM employees;


SELECT
  emp_id,
  emp_name,
  department,
  salary,
  RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
  DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;


SELECT emp_id, emp_name, department, salary, join_date, salary_rank
FROM (
  SELECT emp_id, emp_name, department, salary, join_date,
         DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
  FROM employees
)
WHERE salary_rank <= 3;


SELECT emp_id, emp_name, department, salary, join_date, join_order
FROM (
  SELECT emp_id, emp_name, department, salary, join_date,
         ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date) AS join_order
  FROM employees
)
WHERE join_order <= 2;


SELECT
  emp_id,
  emp_name,
  department,
  salary,
  MAX(salary) OVER (PARTITION BY department) AS max_salary_in_dept,
  MAX(salary) OVER () AS overall_max_salary
FROM employees;





