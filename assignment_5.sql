-- Done using MySql

/* Q.1. Find all the departments where the minimum salary is less than 2000. */

SELECT d.department_name from departments d where d.department_id in 
(
    SELECT e.department_id  from employees e where e.job_id in (
        SELECT j.job_id  from jobs j WHERE j.min_salary < 20000
    )
);

/* Q.2. Find all the countries where no employees exist.  */

SELECT country_name
FROM countries
WHERE country_id IN (
    SELECT DISTINCT country_id
    FROM locations
    WHERE location_id IN (
        SELECT DISTINCT location_id
        FROM departments
        WHERE department_id IN (
            SELECT DISTINCT department_id
            FROM employees
            GROUP BY department_id
            HAVING COUNT(employee_id) = 0;
        )
    )
);

-- Q.3. From the following tables write a query to find all the jobs, having at least 2 employees in a single department.(don’t use joins) 
 
SELECT j.job_title  FROM jobs j where job_id in 
    (SELECT e2.job_id from employees e2 where e2.department_id in 
        (SELECT department_id from employees e1 group by e1.department_id  having count(e1.employee_id)>=2));

-- Q.4. From the following tables write a query to find all the countries, having locations with all the city names starting with 'a'.(don’t use joins)
 
SELECT c.country_name  from countries c where c.country_id in (
    SELECT l.country_id from locations l group by l.country_id having count(DISTINCT city)=(
        SELECT count(DISTINCT city) from locations where city like'a%'
    )
);
-- Q.5.From the following tables write a query to find all the departments, having no cities.

SELECT d.department_name  from departments d where d.location_id in (
    SELECT l.location_id from locations l group by l.location_id having COUNT(DISTINCT city)=0  
);

