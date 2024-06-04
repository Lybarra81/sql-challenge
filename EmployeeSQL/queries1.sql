-- List the employee number, last name, first name, sex, and salary of each employee

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees AS e
JOIN 
    salaries AS s 
ON 
    e.emp_no = s.emp_no
   ;
  
  -- List the first name, last name, and hire date for the employees who were hired in 1986
  
  SELECT 
    e.first_name,
    e.last_name,
    e.hire_date
FROM
    employees AS e
WHERE
    e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
   ;
  
  -- List the manager of each department along with their department number, department name, employee number, last name, and first name
 
  select 
  	dm.emp_no as manager_emp_no,
  	dm.dept_no,
  	d.dept_name,
  	e.emp_no,
  	e.last_name,
  	e,first_name
  from dept_manager as dm
  	inner join departments as d
  		on d.dept_no = dm.dept_no 
  	inner join employees as e 
  		on e.emp_no = dm.emp_no 
  ;
 
 -- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
 
 SELECT
    de.emp_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees AS e
    INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON d.dept_no = de.dept_no
ORDER BY
    e.emp_no
   ;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
  
  SELECT 
    e.first_name, 
    e.last_name,
    e.sex
FROM 
    employees AS e
WHERE 
    e.first_name = 'Hercules'
    AND e.last_name LIKE 'B%'
   ;
  
  -- List each employee in the Sales department, including their employee number, last name, and first name.
  
  select 
  	e.emp_no,
  	e.last_name,
  	e.first_name
  	
  from employees as e
  	inner join dept_emp as de
  		on e.emp_no = de.emp_no 
  	inner join departments as d
  		on d.dept_no = de.dept_no 
  		where lower(d.dept_name) = 'sales'
  	;
  
  --List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
  
  select 
  	e.emp_no,
  	e.last_name,
  	e.first_name,
  	d.dept_name
  	
  from employees as e
  	inner join dept_emp as de
  		on e.emp_no = de.emp_no 
  	inner join departments as d
  		on d.dept_no = de.dept_no 
  		where lower(d.dept_name) = 'sales'
  		or lower(d.dept_name) = 'development'
  	;
  
  

  --List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as "Frequency Count"
from employees 
group by last_name 
order by "Frequency Count" desc 
;
 