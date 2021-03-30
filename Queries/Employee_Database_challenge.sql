-- Retiring employees with titles

SELECT distinct on(e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
inner join title as t
   on (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Titles of  retiring employees

SELECT Distinct on(emp_no) emp_no, first_name, last_name, title
into unique_titles
from retirement_titles
order by emp_no, to_date desc;

--Tiles of retiring employess table  

Select count(title), t.title 
into retiring_titles
from unique_titles  as t
group by title 
order by count(title) desc;



-- Data for Current Employees eligible for Mentorship program 

SELECT distinct on(e.emp_no)
e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,
t.title
into mentorship_eligibilty
from employees as e
inner join dept_employees as de
on (e.emp_no = de.emp_no)
inner join title as t
on (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and (de.to_date = '9999-01-01') 
order by e.emp_no, t.to_date desc;
