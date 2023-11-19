/* Create tables for employees */
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
----------------------------------------------------------

CREATE TABLE departments(
	dept_no char(4) PRIMARY KEY,
	dept_name varchar(30) NOT NULL
);

CREATE TABLE titles(
	title_id char(5) PRIMARY KEY,
	title varchar(30) NOT NULL
);

CREATE TABLE employees(
	emp_no integer PRIMARY KEY,
	emp_title char(5) NOT NULL,
	birthdate date NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	sex char(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	id serial,
	emp_no int,
	salary int,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	id serial,
	emp_no integer,
	dept_no char(4),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	id serial,
	dept_no char(4),
	emp_no integer,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

/* Import csv data */