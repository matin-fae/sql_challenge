--employee overview
CREATE VIEW q1 AS(
	SELECT e.emp_no, e.last_name, 
	e.first_name, e.sex, s.salary
	FROM salaries s
		INNER JOIN employees e
			ON (e.emp_no = s.emp_no)
)
--test
--SELECT * FROM q1

--employees hired in 1986
CREATE VIEW q2 AS(
	SELECT first_name, last_name, hire_date
	FROM employees
		WHERE
			EXTRACT(YEAR FROM hire_date) = 1986
)
--test
--SELECT * FROM q2

--department manager overview
CREATE VIEW q3 AS
	SELECT dm.dept_no, d.dept_name, dm.emp_no,
	e.last_name, e.first_name
	FROM dept_manager dm
		INNER JOIN departments d
			ON 	(dm.dept_no = d.dept_no)
		INNER JOIN employees e
			ON (dm.emp_no = e.emp_no)
--test
--SELECT * FROM q3

--department employee overview
CREATE VIEW q4 AS
	SELECT de.dept_no, e.emp_no, 
	e.last_name, e.first_name, d.dept_name
	FROM dept_emp de
		INNER JOIN employees e
			ON (de.emp_no = e.emp_no)
		INNER JOIN departments d
			ON (de.dept_no = d.dept_no)
--test
--SELECT * FROM q4

--hunt Hercules here
CREATE VIEW q5 AS
	SELECT first_name, last_name, sex
	FROM employees
		WHERE first_name = 'Hercules'
		AND last_name LIKE 'B%'
--test
--SELECT * FROM q5

--sales department employees
CREATE VIEW q6 AS 
	SELECT e.emp_no, e.last_name, e.first_name
	FROM employees e
		INNER JOIN dept_emp de
			ON (e.emp_no = de.emp_no)
		INNER JOIN departments d
			ON (de.dept_no = d.dept_no)
		WHERE d.dept_name = 'Sales'
--test
--SELECT * FROM q6

--sales AND development department employees
CREATE VIEW q7 AS
	SELECT e.emp_no, e.last_name, 
	e.first_name, d.dept_name
	FROM employees e
		INNER JOIN dept_emp de
			ON (e.emp_no = de.emp_no)
		INNER JOIN departments d
			ON (de.dept_no = d.dept_no)
		WHERE d.dept_name = 'Sales'
		OR d.dept_name = 'Development'
--test
--SELECT * FROM q7

--count of shared last names organized in descending popularity (of name)
CREATE VIEW q8 AS 
	SELECT last_name, COUNT(last_name)
	FROM employees
		GROUP BY last_name
		ORDER BY COUNT(last_name)
			DESC
--test
--SELECT * FROM q8