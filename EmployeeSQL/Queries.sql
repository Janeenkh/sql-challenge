-- 1. List employee number, last name, first name
-- sex and salary of each employee

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON
e.emp_no=s.emp_no;

-- 2. list first name, last name, hire date for employees who were hired in 1986
SELECT e.last_name, e.first_name, e.hire_date 
FROM employees as e
WHERE hire_date LIKE '%1986';

--3. List manager of each dept along with their dept number, dept name
-- emp number, last name and first name

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees as e
INNER JOIN dept_manager as de
ON
e.emp_no=de.emp_no
INNER JOIN departments as d
ON
d.dept_no = de.dept_no;

--4. List dept number for each emp along with that emp emp number, 
-- last name, first name and dept name
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON
e.emp_no=de.emp_no
INNER JOIN departments as d
ON
d.dept_no = de.dept_no;
--5. list first name, last name, sex of each emp whose first name is Hercules
-- and whose last name begins with the letter B. 
SELECT e.first_name, e.last_name,  e.sex
FROM employees as e
WHERE first_name= 'Hercules'
AND last_name Like 'B%'


--6. List each emp in Sales dept, including their emp number, 
-- last name and first name. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON
e.emp_no=de.emp_no
INNER JOIN departments as d
ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';
--7. list each emp in Sales and Development dept, including their emp number,
-- last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON
e.emp_no=de.emp_no
INNER JOIN departments as d
ON
d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales', 'Development');
--8. list the frequency counts, in descending order of all the emp 
--last names (to show how many employees share each last name)
SELECT last_name, count(last_name) as count
FROM employees
GROUP BY last_name
ORDER BY count desc;