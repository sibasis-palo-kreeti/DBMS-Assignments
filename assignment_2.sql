-- Done in MySql

-- Q.1. Select all records in table “Employees” whose last name starts with ‘Sah’

SELECT * FROM employees WHERE last_name LIKE "Sah%";

-- Q.2. Select 10 employees who were hired between 1st June, 2021 to 15th February,2022. Start retrieving from the 4th record in the table

SELECT * FROM employees  
WHERE hire_date BETWEEN '2021-06-01' and '2022-02-15' 
limit 3,10 ;

-- Q.3. Find distinct top 5 salary values (only salary column), using alias for column as “Top 5 salaries”

SELECT salary as 'Top 5 salaries' FROM employees 
order by salary desc limit 5;

-- Q.4. Find first_name, last_name and email of employees from the employees table where salary lies between 25000 to 45000*/

SELECT  first_name , last_name ,email  FROM employees
WHERE salary BETWEEN 25000 and 45000;

-- Q.5. Write a query to find first_name, manager_id and salary where thedepartment_id is 101 and sort the result in ascending order of salary.

SELECT first_name ,manager_id ,salary  FROM  employees
where department_id =101 order by salary asc;  

-- Q.6. Find all the first_name that start with the letter “A”, and find all the last_name that have “TH” in the 2nd and 3rd positions.

SELECT first_name ,last_name from employees
WHERE first_name like 'A%' and SUBSTRING(last_name,2,2)='TH';  