-- Done in MySql

-- Q.1. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

SELECT department_id ,SUM(salary) as total_sal FROM employees
GROUP BY department_id ORDER BY total_sal ASC ;

-- Q.2. Write the query to get the department, total no. employee of each department, total(sum) salary with respect to department from "Employee" table. 

SELECT department_id ,COUNT(employee_id) as total_no_of_employees ,SUM(salary) as total_salary FROM employees
GROUP BY department_id ;

-- Q.3. Get department wise maximum salary from "Employee" table order by salary ascending 

SELECT department_id ,max(salary) as max_salary from employees 
GROUP BY department_id ORDER by max_salary asc;

/* Q.4. Write a query to get the departments where average salary is more than 60k */

SELECT department_id ,AVG(salary) as avg_sal FROM employees 
GROUP BY department_id HVING avg_sal > 60000 ; 

/* Q.5. Write down the query to fetch department name assign to more than one Employee */

SELECT department_name  from departments 
WHERE department_id in (SELECT department_id  from employees GROUP BY department_id HAVING count(employee_id)>1);

/* Q.6. Write a query to show department_name and assignedTo where assignedTo will be “One candidate” if its assigned to only one employee otherwise “Multiple candidates” */
 
SELECT d.department_name,
CASE WHEN count(e.department_id)=1 THEN 'One candidate' else 'Multiple candidates'
END
as assignedTo
FROM departments d
LEFT JOIN employees e on d.department_id = e.department_id GROUP BY d.department_id ,d.department_name ;    

