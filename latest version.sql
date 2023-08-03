CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" CHARACTER VARYING   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NULL,
    "last_name" VARCHAR   NULL,
    "sex" VARCHAR,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no" )
);

CREATE TABLE "department" (
    "dept_no" int   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);
DROP TABLE dept_manager
CREATE TABLE "dept_manager" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no"
     )
);
DROP TABLE dept_emp
CREATE TABLE "dept_emp" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no")
);
DROP TABLE salaries
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
DROP TABLE titles
CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "title" VARCHAR  NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--(1) List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries ON 
employees.emp_no=salaries.emp_no;

--(2) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.last_name, employees.first_name,
FROM employees 
INNER JOIN salaries ON 
employees.emp_no=salaries.emp_no;





ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "department" ADD CONSTRAINT "fk_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

CREATE INDEX "idx_employee_emp_title_id"
ON "employee" ("emp_title_id");