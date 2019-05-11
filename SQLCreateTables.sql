DROP TABLE IF EXISTS dept_empl;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS  Salaries;
DROP TABLE IF EXISTS  Managers;
DROP TABLE IF EXISTS  Employees;
DROP TABLE IF EXISTS Departments;




CREATE TABLE Departments (
	dept_id varchar PRIMARY KEY,
	dept_name varchar NOT NULL
);

CREATE TABLE Employees (
	employee_id int PRIMARY KEY,
	birth_date date,
    first_name varchar,
	last_name varchar,
	gender varchar(1),
    hire_date date    
);

CREATE TABLE Managers (
   	dept_id varchar NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES  Departments(dept_id),
	employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Salaries (
    employee_id INT   NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
	salary DEC,
    from_date date,    
    to_date date
);

CREATE TABLE title (
 employee_id INT NOT NULL,
 FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
 title  varchar,
 from_date date,
 to_date date
);

CREATE TABLE dept_empl (
employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
dept_id varchar NOT NULL,
FOREIGN KEY (dept_id) REFERENCES  Departments(dept_id),
from_date date,    
to_date date
);