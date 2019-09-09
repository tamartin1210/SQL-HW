select * from department;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;
--2. List employees who were hired in 1986.
select * from employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31';
--3.List the manager of each department with the following information: department number, department name
--the manager's employee number, last name, first name, and start and end employment dates.
select department.dept_no, department.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name,
dept_manager.from_date, dept_manager.to_date
from department
INNER JOIN dept_manager on department.dept_no = dept_manager.dept_no
INNER JOIN employees
on dept_manager.emp_no = employees.emp_no;
--4.List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
INNER JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
INNER JOIN department
on dept_emp.dept_no = department.dept_no;
--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name , employees.last_name
from employees
where first_name = 'Hercules'
and last_name LIKE 'B%';
--6.List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
INNER JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
INNER JOIN department
on dept_emp.dept_no = department.dept_no
where dept_name = 'Sales';
--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
INNER JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
INNER JOIN department
on dept_emp.dept_no = department.dept_no
where dept_name = 'Sales' or dept_name = 'Development';
--8.In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name, count(last_name) as "last_name_count"
from employees
group by last_name
order by "last_name_count" desc;
--epilogue
select employees.first_name, employees.last_name, employees.emp_no, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no
where employees.emp_no = 499942;