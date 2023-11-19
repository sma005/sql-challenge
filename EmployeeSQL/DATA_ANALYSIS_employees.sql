/* Notes -- I have over 15 years of SQL experience, so any odd code is just what I know */

--ALL | employee number, last name, first name, sex, salary
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees e
Join salaries s
	On s.emp_no = e.emp_no
Order By last_name, first_name; 

--ALL | employee number, first name, last name, hire date=1986
Select first_name, last_name, hire_date
From employees
Where hire_date Between '1-1-1986' And '12-31-1986'
Order By last_name, first_name; 

--MANAGERS OF EACH DEPT | department number, department name, employee number, last name, first name
Select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
From dept_manager m
Join employees e
	On e.emp_no = m.emp_no
Join departments d
	On d.dept_no = m.dept_no
Order By d.dept_no, e.last_name, e.first_name;

--ALL | dept number, employee number, last name, first name, department name
Select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
From employees e
Join dept_emp de
	On e.emp_no = de.emp_no
Join departments d
	On de.dept_no = d.dept_no
Order By e.last_name, e.first_name;

--ALL (first name = 'Hercules', last name LIKE 'B%') | first name, last name, sex
Select e.first_name, e.last_name, e.sex
From employees e
Where e.first_name = 'Hercules'
	And e.last_name LIKE 'B%'
Order By e.first_name;

--ALL (employees from sales) | employee number, last name, first name
Select e.emp_no, e.last_name, e.first_name
From employees e
Join dept_emp de
	On e.emp_no = de.emp_no
Join departments d
	On de.dept_no = d.dept_no
	And d.dept_name = 'Sales'
Order By e.last_name, e.first_name;

--ALL (employees from sales and development) | employee number, last name, first name, department name
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees e
Join dept_emp de
	On e.emp_no = de.emp_no
Join departments d
	On de.dept_no = d.dept_no
	And d.dept_name IN ('Sales','Development')
Order By e.last_name, e.first_name;

--ALL (Descending order:Frequency count - employees that share last names) | last name, Frequency
Select last_name, COUNT(last_name) as count
From employees
Group By last_name
Order by count desc;
