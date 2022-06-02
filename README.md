# Pewlett-Hackard-Analysis

## Purpose
This analysis was commissioned to analyze the overall age of the employees at Pewlett-Hackard, and address the possibility of a "Silver Tsunami" which would take experienced talent away from the company.

## Basic PH Statistics
- Total # of employees = 300,024
- Total # of departments = 9
- Total # of titles held by current employees = 443,308

## Tables Created

### Initial Tables
- Initial tables were created from .csv data provided
  - departments, [departments.csv](Data/departments.csv)
  - employees, [employees.csv](Data/employees.csv)
  - dept_emp, [dept_emp.csv](Data/dept_emp.csv)
  - dept_manager, [dept_manager.csv](Data/dept_manager.csv)
  - salaries, [salaries.csv](Data/salaries.csv)
  - titles, [titles.csv](Data/titles.csv)

### Derivative Tables (Results)
Derivative Tables were created from the respective queries in [Employee_Database_challenge.sql](Queries/Employee_Database_challenge.sql)

#### retirement_titles
- Table created of every employee-title combination where the employee was born between 1952 and 1955, and potentially at the cusp of retiring.
- Duplicate employee entries are expected for any employees who have held more than one title at their time at Pewlett-Hackard.
- **133,776 total titles held, at any time, by potentially retiring employees**

#### unique_titles
- Table created based on retirement_titles, using DISTINCT ON to isolate a single entry per employee and to_date = '9999-01-01' to include only titles currently being held.
- **72,458 current employees with potential retirements**
- 72,458 / 300,024 = **24.2% of workforce coming up for retirement**

#### retiring_titles
- Table created using GROUP BY to count the total number of retiring employees, grouped by title.
- **50,842: A large majority of the 72,000+ retiring titles are Senior positions (Senior Staff or Senior Engineer)**
![Screenshot of retiring_titles](Images/retiring_by_title.png)

#### mentorship_eligibility
- Table created of current employees who are eligibile to be mentors this year specifically - only those born in 1965.
- **1549 current employees born in 1965 who can mentor younger employees**

## Summary

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The total number of potentially retiring employees is **72,458*, which is just over **24%** of the workforce.  That represents a huge hiring crunch, upcoming.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Based on the mentorship data that we collected, I would be very concerned that we have enough employees to mentor the next generation.  That said, I'm not sure why people born in "1965" was

### Additional Queries or Tables
