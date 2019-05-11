--1) List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW employee_salaries_list2 AS
SELECT e.employee_id, last_name, first_name, gender, salary 
FROM employees e
JOIN salaries s
ON (e.employee_id = s.employee_id);

--2) List employees who were hired in 1986.
SELECT * FROM employees
WHERE  hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3) List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT m.dept_id, d.dept_name, m.employee_id, e.last_name, e.first_name, m.from_date, m.to_date
FROM managers m
JOIN departments d
ON (m.dept_id = d.dept_id)
JOIN employees e
ON (m.employee_id = e.employee_id);


--4) List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules'
AND   last_name LIKE 'B%';

--5) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.employee_id, e.last_name, e.first_name, d.dept_name
FROM dept_empl de
JOIN employees e
ON (de.employee_id = e.employee_id)
JOIN departments d
ON (de.dept_id = d.dept_id)
WHERE de.dept_id  = 'd007';

--7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.employee_id, e.last_name, e.first_name, d.dept_name
FROM dept_empl de
JOIN employees e
ON (de.employee_id = e.employee_id)
JOIN departments d
ON (de.dept_id = d.dept_id)
WHERE de.dept_id  = 'd007'
OR de.dept_id = 'd005';


--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency Last Names" 
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

