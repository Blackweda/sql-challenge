CREATE TABLE Department (
    dept_no varchar not null,
    dept_name varchar not null,
    PRIMARY KEY (dept_no)
);


CREATE TABLE Title (
    title_id varchar not null,
    title varchar not null,
    PRIMARY KEY (title_id)
);


CREATE TABLE Employee (
    emp_no int not null,
    emp_title_id varchar not null,
    birth_date date not null,
    first_name varchar not null,
    last_name varchar not null,
    sex varchar not null,
    hire_date date not null,
    FOREIGN KEY (emp_title_id) REFERENCES Title (title_id),
    PRIMARY KEY (emp_no)
);


CREATE TABLE Salary (
    emp_no int not null,
    salary int not null,
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no),
    PRIMARY KEY (emp_no)
);


CREATE TABLE Dep_Emp_Junction (
    emp_no int not null,
    dept_no varchar not null,
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE Dep_Manager_Junction (
    dept_no varchar not null,
    emp_no int not null,
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);
