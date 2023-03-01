-- Drop the table ------------------------------
drop table if exists departments CASCADE;
drop table if exists dept_emp CASCADE;
drop table if exists dept_manager CASCADE;
drop table if exists employees CASCADE;
drop table if exists salaries CASCADE;
drop table if exists titles CASCADE;

-- Create tables ------------------------------

CREATE TABLE titles (
	title_id VARCHAR(50) NOT NULL,
	title VARCHAR(50) NOT NULL,
	PRIMARY KEY (title_id)
	);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50)   NOT NULL,
	last_name VARCHAR(50)   NOT NULL,
	sex VARCHAR(50) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
	);

CREATE TABLE departments (
	dept_no VARCHAR(50) NOT NULL,
	dept_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (dept_no)
	);

CREATE TABLE dept_manager (
	dept_no VARCHAR(50) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
	);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

-- Table viewers ------------------------------
SELECT *
FROM departments;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;

