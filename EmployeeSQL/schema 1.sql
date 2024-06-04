
create table departments (
dept_no varchar (50) PRIMARY KEY,
dept_name varchar (50) not null unique
);

drop table departments;

create table titles ( 
title_id varchar(50) PRIMARY KEY,
title varchar(50) not null unique
);

create table employees (
emp_no int PRIMARY KEY,	
emp_title_id varchar (50),	
birth_date varchar (50) ,	
first_name varchar (50),	
last_name varchar (50),	
sex	varchar (50),
hire_date varchar (50),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

drop table employees;

create table salaries (
emp_no int PRIMARY KEY,
salary int,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

drop table salaries;


CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(50),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

drop table dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary 
from
	employees 
join
	salaries on employees.emp_no = salaries.emp_no;



