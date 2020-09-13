--drop tables if they exist already

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Import CSV Files Into Corresponding SQL Table

CREATE TABLE employees (
    emp_no INT NOT NULL,
	emp_title_id CHAR(10) NOT NULL,
    birth_date  DATE NOT NULL,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,    
    hire_date   DATE NOT NULL,
    PRIMARY KEY (emp_no)
);


CREATE TABLE departments (
    dept_no     CHAR(10) NOT NULL,
    dept_name   VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no)
);	


CREATE TABLE dept_manager (
   dept_no CHAR(10) NOT NULL,
   emp_no INT NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   PRIMARY KEY (emp_no,dept_no)
); 


CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(10) NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees (emp_no) ,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE titles (
    title_id      Char(10) NOT NULL,
    title       VARCHAR(50) NOT NULL,
    --FOREIGN KEY (emp_title_id) REFERENCES employees (emp_title_id),
    PRIMARY KEY (title_id, title)
); 

CREATE TABLE salaries (
    emp_no      INT  NOT NULL,
    salary      INT  NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
) ;

--Checking Tables
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select* from titles;