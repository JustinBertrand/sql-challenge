/* *** DATA MODELING *** / *** DATA ENGINEERING ***
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(8),
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER,
	from_date DATE,
	to_date DATE
);

CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_emp (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date DATE,
	to_date DATE
);
*/

/* *** DATA ANALYSIS #1 ***
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;
*/

/* *** DATA ANALYSIS #2 ***
SELECT * FROM employees WHERE (EXTRACT (YEAR FROM employees.hire_date) = '1986');
*/

/* *** DATA ANALYSIS #3 ***
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.first_name,
	employees.last_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
LEFT JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
*/

/* *** DATA ANALYSIS #4 ***
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
*/

/* *** DATA ANALYSIS #5 ***
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
*/

/* *** DATA ANALYSIS #6 ***
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
*/

/* *** DATA ANALYSIS #7 ***
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE (departments.dept_name = 'Sales' OR departments.dept_name = 'Development');
*/

/* *** DATA ANALYSIS #8 ***
SELECT last_name,
COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;
 */

/* *** EPILOGUE ***
SELECT * FROM employees
WHERE emp_no = 499942;
*/