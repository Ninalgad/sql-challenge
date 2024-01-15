DROP TABLE IF EXISTS "DEPT_MANAGER";
DROP TABLE IF EXISTS "DEPT_EMP";
DROP TABLE IF EXISTS "SALARIES";
DROP TABLE IF EXISTS "DEPARTMENTS";
DROP TABLE IF EXISTS "EMPLOYEES";
DROP TABLE IF EXISTS "TITLES";


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/D8pBGV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "TITLES" (
    "title_id" VARCHAR(6)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "EMPLOYEES" (
    "emp_no" VARCHAR(6)   NOT NULL,
    "emp_title_id" VARCHAR(6)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" text   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "SALARIES" (
    "emp_no" VARCHAR(6)   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "DEPT_EMP" (
    "emp_no" VARCHAR(6)   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

CREATE TABLE "DEPT_MANAGER" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" VARCHAR(6)   NOT NULL
);


ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "TITLES" ("title_id");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

