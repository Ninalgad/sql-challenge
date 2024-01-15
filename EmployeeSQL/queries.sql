-- List the employee number, last name, first name, sex, and salary of each employee
SELECT "EMPLOYEES".emp_no
	,"EMPLOYEES".last_name
	,"EMPLOYEES".first_name
	,"EMPLOYEES".sex
	,"SALARIES".salary
FROM "EMPLOYEES"
INNER JOIN "SALARIES" ON "EMPLOYEES".emp_no = "SALARIES".emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name
	,last_name
	,hire_date
FROM "EMPLOYEES"
WHERE EXTRACT('year' FROM hire_date) = 1986;-- https://www.commandprompt.com/education/how-to-extract-year-from-date-in-postgresql/

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept.dept_no
	,dept.dept_name
	,emp_info.emp_no
	,emp_info.last_name
	,emp_info.first_name
FROM "EMPLOYEES" AS emp_info
INNER JOIN "DEPT_MANAGER" AS dept_man ON emp_info.emp_no = dept_man.emp_no
INNER JOIN "DEPARTMENTS" AS dept ON dept_man.dept_no = dept.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept.dept_no
	,emp_info.emp_no
	,emp_info.last_name
	,emp_info.first_name
	,dept.dept_name
FROM "EMPLOYEES" AS emp_info
INNER JOIN "DEPT_EMP" AS dept_emp ON emp_info.emp_no = dept_emp.emp_no
INNER JOIN "DEPARTMENTS" AS dept ON dept_emp.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name
	,last_name
	,sex
FROM "EMPLOYEES"
WHERE first_name = 'Hercules'
	AND SUBSTRING(last_name, 0, 2) = 'B';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no
	,first_name
	,last_name
	,sex
FROM "EMPLOYEES"
WHERE emp_no IN (
		SELECT emp_no
		FROM "DEPT_EMP"
		WHERE dept_no IN (
				SELECT dept_no
				FROM "DEPARTMENTS"
				WHERE dept_name = 'Sales'
				)
		);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp_info.emp_no
	,emp_info.first_name
	,emp_info.last_name
	,dept.dept_name
FROM "EMPLOYEES" AS emp_info
INNER JOIN "DEPT_EMP" AS dept_emp ON emp_info.emp_no = dept_emp.emp_no
INNER JOIN "DEPARTMENTS" AS dept ON dept_emp.dept_no = dept.dept_no
WHERE emp_info.emp_no IN (
		SELECT emp_no
		FROM "DEPT_EMP"
		WHERE dept_no IN (
				SELECT dept_no
				FROM "DEPARTMENTS"
				WHERE dept_name = 'Sales'
					OR dept_name = 'Development'
				)
		);

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name
	,count(DISTINCT last_name) AS "Number of Unique Last Names"
FROM "EMPLOYEES"
GROUP BY last_name
ORDER BY "Number of Unique Last Names" DESC;
