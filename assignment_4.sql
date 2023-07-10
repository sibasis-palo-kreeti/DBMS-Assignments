-- Done in MySql

-- Q.1. From the following tables write a SQL query to find the details of an employee. Return full name, email, salary, Department Name, postal_code, and City.

SELECT CONCAT( e.first_name ,' ', e.last_name) as full_name ,e.email,e.salary,d.department_name ,l.pincode ,l.city 
FROM employees e left join departments d 
on e.department_id = d.department_id  
left join locations l 
on d.location_id =l.location_id ;

-- Q.2. From the following tables write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province, street_address. 

SELECT d.department_name, l.state_province, l.street_address from departments d left join locations l on d.location_id =l.location_id 
WHERE l.state_province = "Jammu Kashmir" or l.state_province="Jharkhand" ;

-- Q.3. From the following tables write a SQL query to find the count of employees present in different jobs whose average salary is greater than 10,000. Return all the jobs with employee count, Job Name, and average salary.

SELECT count(*) as emp_count, job_title, avg(salary) as avg_sal FROM jobs j join employees e on j.job_id =e.job_id 
GROUP by j.job_id ,job_title HAVING avg_sal>10000 ;

/* Q.4. From the following table write a SQL query to find all the first_names and last_names in both dependents and employees tables. Return the duplicate records as
well and order the records in descending order of the last_name column. */

SELECT d.first_name, d.last_name, e.first_name, e.last_name from 
dependents d join employees e on d.employee_id =e.employee_id 
ORDER by d.last_name desc;

-- Q.5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.

SELECT CONCAT(e1.first_name, ' ', e1.last_name) as employee_name,
concat(e2.first_name, ' ', e2.last_name) as manager_name 
FROM employees e1 join employees e2 on e1.manager_id  = e2.employee_id  ;

-- Q.6. Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either New York or California. Include the department name, location, and the number of employees meeting the criteria.

SELECT d.department_name, COUNT(*) as emp_count, e.salary as salary, l.city as location from departments d join employees e on d.department_id = e.employee_id
left join locations l on d.location_id =l.location_id
GROUP BY  d.department_id  having emp_count>5 and salary>50000 and location = 'California' or location='New York';


-- Q.7. List any employees who have dependents and have a job title that includes the word 'manager', and sort the results by department name in ascending order.

SELECT concat(e.first_name ,' ',e.last_name) as full_name
from departments d join employees e on d.department_id = e.department_id 
join jobs j on j.job_id = e.job_id 
join dep dep on e.employee_id =dep.employee_id
where dep.dependent_id is not null and j.job_title ='manager'
ORDER by d.department_name asc;

-- 8. Add a column in the dependent table called “city” depicting their current location of
-- stay. Find all employees who have been hired in the past 3 years and have dependents
-- living in a city that is different from the city they work in (if I work in Kolkata, then my
-- dependent should not be in Kolkata).
-- Additionally, only include employees whose salary is greater than the average salary of
-- their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average
-- salary under the same job_title “developer” is 70k), and whose manager's job title
-- includes the word 'director'. Finally, include the department name and location of each
-- employee, and sort the results by department name in ascending order

ALTER TABLE dependents
ADD COLUMN city VARCHAR(255);

SELECT   e.employee_id, e.first_name, e.last_name, d.department_name, l.city, e.salary,j.job_title
FROM employees e
   JOIN departments d ON e.department_id = d.department_id
   JOIN locations l ON d.location_id = l.location_id
   JOIN dependents de ON e.employee_id = de.employee_id
   JOIN jobs j ON e.job_id = j.job_id
WHERE
e.hire_date > CURRENT_DATE - INTERVAL 3 YEAR
AND de.city <> l.city
AND e.salary > (
  SELECT AVG(salary) FROM employees
  WHERE job_id = j.job_id
)
AND j.job_title LIKE '%Director%'
ORDER BY
   d.department_name;
;
