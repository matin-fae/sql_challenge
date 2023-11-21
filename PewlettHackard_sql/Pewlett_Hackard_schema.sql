--practice safe merging with "NOT NULL"
--likely no employee with a name of over 30 CHAR

--Drop table if exists
--DROP TABLE departments

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);
--test
--SELECT * FROM departments

--didn't need "titles" table for my queries
/*CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
    PRIMARY KEY (title_id)
)*/
--test
--SELECT * FROM titles

--Drop table if exists
--DROP TABLE employees

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name CHAR(30) NOT NULL,
	last_name CHAR(30) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);
--test
--SELECT * FROM employees

--Drop table if exists
--DROP TABLE dept_emp

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
--test
--SELECT * FROM dept_emp

--Drop table if exists
--DROP TABLE dept_manager

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY kEY (dept_no, emp_no)
);
--test
--SELECT * FROM dept_manager

--Drop table if exists
--DROP TABLE salaries

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
--test
--SELECT * FROM salaries