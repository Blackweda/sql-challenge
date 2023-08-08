-- Employees and Salaries
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM Employee as emp
    LEFT JOIN Salary as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM Employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Department Managers
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM Dep_Manager_Junction AS dmj
    INNER JOIN Department AS d
        ON (dmj.dept_no = d.dept_no)
    INNER JOIN Employee AS e
        ON (dmj.emp_no = e.emp_no);


-- Department Employees
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employee AS e
    INNER JOIN Dep_Emp_Junction AS dej
        ON (e.emp_no = dej.emp_no)
    INNER JOIN Department AS d
        ON (dej.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name, last_name, birth_date, sex
FROM Employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Sales Department Employees
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employee AS e
    INNER JOIN Dep_Emp_Junction AS dej
        ON (e.emp_no = dej.emp_no)
    INNER JOIN Department AS d
        ON (dej.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- Sales and Development Department Employees
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employee AS e
    INNER JOIN Dep_Emp_Junction AS dej
        ON (e.emp_no = dej.emp_no)
    INNER JOIN Department AS d
        ON (dej.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- The frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM Employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
