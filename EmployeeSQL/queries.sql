
--List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no as EmployeeNumber, last_name as LastName, first_name as FirstName, sex as Sex, salary
from employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no
order by last_name, first_name;

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name as FirstName, last_name as LastName,  hire_date as HireDate
from employees
where hire_date > '1985-12-31' and hire_date < '1987-01-01';


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no as DepartmentNumber, dept_name, dept_manager.emp_no as MgrEmpNumber, last_name, first_name
from dept_manager
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
inner join employees on dept_manager.emp_no=employees.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp
inner join employees on dept_emp.emp_no=employees.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name='Hercules' and last_name like 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp
inner join employees on dept_emp.emp_no=employees.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where dept_name='Sales'
;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp
inner join employees on dept_emp.emp_no=employees.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where dept_name='Sales' or dept_name='Development'
;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) 
FROM employees
group by last_name
order by count desc;