-- DELIVERABLE #1
-- Creating retirement_titles table
DROP TABLE IF EXISTS retirement_titles;
SELECT emp.emp_no, emp.first_name, emp.last_name,
		tit.title, tit.from_date, tit.to_date
	INTO retirement_titles
	FROM employees as emp
	JOIN titles as tit
	ON emp.emp_no = tit.emp_no
	WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
	ORDER BY emp.emp_no;
	
-- Use DISTINCT with ORDER BY to remove duplicate rows
DROP TABLE IF EXISTS unique_titles;
SELECT DISTINCT ON (ret.emp_no) ret.emp_no,
	ret.first_name,
	ret.last_name,
	ret.title
	INTO unique_titles
	FROM retirement_titles as ret
	WHERE ret.to_date = ('9999-01-01')
	ORDER BY ret.emp_no, ret.to_date DESC;

-- Use GROUP BY to create a table of the number of retirees per title.
DROP TABLE IF EXISTS retiring_titles;
SELECT COUNT(uni_tit.emp_no) as Number_of_Retirees, uni_tit.title as Title
	INTO retiring_titles
	FROM unique_titles as uni_tit
	GROUP BY uni_tit.title
	ORDER BY Number_of_Retirees DESC;

-- DELIVERABLE #2
-- Create membership_eligibility table by joining three tables with DISTINCT ON
DROP TABLE IF EXISTS mentorship_eligibility;
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
		d_emp.from_date, d_emp.to_date, tit.title
	INTO mentorship_eligibility
	FROM employees as emp
	JOIN dept_emp as d_emp
	ON emp.emp_no = d_emp.emp_no
	JOIN titles as tit
	ON emp.emp_no = tit.emp_no
	WHERE emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
		AND d_emp.to_date = '9999-01-01'
	ORDER BY emp.emp_no;