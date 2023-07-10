-- Done in MySql

-- Q.1. Create the following schema 

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    min_salary int check(min_salary>1000),
    max_salary int
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name varchar(50) not null,
last_name varchar(50)not null,
email varchar(50),
phone_number INT,
hire_date DATE,
job_id int,
salary int,
manager_id int,
department_id int,
foreign key (job_id) references jobs(job_id),
foreign key(manager_id) references employees(employee_id),
foreign key(department_id) references departments(department_id)
);

CREATE TABLE dependents(
dependent_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
relationship varchar(50),
employee_id int,
foreign key(employee_id) references employees(employee_id)
);

CREATE TABLE departments(
department_id int primary key,
department_name varchar(50),
location_id int,
foreign key(location_id) references locations(location_id)
);

CREATE TABLE regions(
region_id int primary key,
region_name varchar(50)
);

CREATE TABLE countries(
country_id int primary key,
country_name varchar(50),
region_id int,
foreign key (region_id) references regions(region_id)
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code VARCHAR(50),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    CHECK (CHAR_LENGTH(postal_code) <= 10)
);

/* Q.2.Insert 5 rows in the jobs, dependents, regions, countries, locations, departments tables and  10 rows in the Employee table.*/

INSERT into jobs(job_id,job_title,min_salary,max_salary)
values (1,"SDE",500000,10000000000),
       (2,"MLE",400000,10000000000),
       (3,"Front end dev",3000000,10000000000),
       (4,"Front end Dev",3000000,10000000000),
       (5,"Backend Dev",540000,10000000000);
       
INSERT into dependents(dependent_id,first_name,last_name,relationship,employee_id)
values (1,"Doraemon","Gian","Father",1),
       (2,"Robin","Batman","Mother",2),
       (3,"Doraemi","Lol","Mother",3),
       (4,"Gwen","Spiderman","Wife",4),
       (5,"Mary Jane","Spiderman","Wife",5);

INSERT into regions(region_id,region_name)
values (1,"New York"),
       (2,"California"),
       (3,"London"),
       (4,"Singapore"),
       (5,"New Delhi");
      
INSERT into countries(country_id ,country_name ,region_id)
values (1,"USA",1),
       (2,"USA",2),
       (3,"UK",3),
       (4,"Singapore",4),
       (5,"India",5);
      
INSERT into locations(location_id, street_address, postal_code, city, state_province, country_id)
values (1,"NY Lane 1",777017,"New York","New York",1),
       (2,"CA Lane 1",444555,"California","California",2),
       (3,"LD Lane 1",333444,"London","London",3),
       (4,"SG Lane 1",111111,"Singapore","Singapore",4),
       (5,"Sarojini Market",222222,"New Delhi","Delhi",5);    

INSERT into departments(department_id,department_name,location_id)
values (1,"CSE",1),
       (2,"IT",2),
       (3,"ELE",3),
       (4,"I&E",4),
       (5,"MEC",5);

      
INSERT into employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', 123456789, '2022-01-01', 1, 5000, 1,1),
    (2, 'Jane', 'Smith', 'janesmith@example.com', 987654321, '2022-02-01', 2, 6000, 2,2),
    (3, 'Mike', 'Johnson', 'mikejohnson@example.com', 555555555, '2022-03-01', 1, 5500, 1,3),
    (4, 'Emily', 'Davis', 'emilydavis@example.com', 111111111, '2022-04-01', 3, 7000, 2,4),
    (5, 'Chris', 'Wilson', 'chriswilson@example.com', 999999999, '2022-05-01', 2, 6500, 1,5),
    (6, 'Sarah', 'Anderson', 'sarahanderson@example.com', 444444444, '2022-06-01', 1, 5200, 2,3),
    (7, 'Michael', 'Brown', 'michaelbrown@example.com', 222222222, '2022-07-01', 3, 7200, 1,2),
    (8, 'Jessica', 'Taylor', 'jessicataylor@example.com', 888888888, '2022-08-01', 2, 6300, 2,1),
    (9, 'David', 'Clark', 'davidclark@example.com', 666666666, '2022-09-01', 1, 5100, 1,2),
    (10, 'Amy', 'Moore', 'amymoore@example.com', 333333333, '2022-10-01', 3, 6800, 2,3);
   

-- Q.3.a In departments table, add a new field ‘manager_name’ of type VARCHAR  
     
ALTER TABLE departments ADD column manager_name varchar(50); 

-- Q.3.b Remove field max_salary from jobs.

ALTER TABLE jobs DROP column max_salary;

-- Q.3.c In the locations table, rename postal_code column to pincode.

ALTER TABLE locations drop constraint locations_chk_1;
ALTER TABLE locations change column postal_code pincode varchar(50);

-- Q.4.a First_name and last_name should not be null

ALTER TABLE employees
ADD CONSTRAINT not_null  NOT NULL (first_name, last_name);

-- Q.4.b. Min_salary must be greater than 1000

ALTER TABLE jobs
ADD CHECK (min_salary>=1000);

-- Q.4.c. Max length of postal_code should be 10.

ALTER TABLE locations
MODIFY COLUMN postal_code VARCHAR(10);