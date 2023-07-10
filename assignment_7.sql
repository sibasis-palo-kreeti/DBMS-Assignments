-- Done using MySql
use sys;

-- Q.1. Create a trigger to fill up the full_name column in the dependents table while inserting any new records.

ALTER TABLE dependents ADD column full_name varchar(50);

CREATE TRIGGER fill
BEFORE INSERT ON dependents
FOR EACH ROW SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);

-- Q.2. Create a trigger that stores the transaction records of each insert, update and delete operations performed on the locations table into locations_info table.

CREATE TABLE locations_info(
location_id int,
operation varchar(50),
transaction_date date
);

CREATE TRIGGER ins_trig
AFTER INSERT ON locations
FOR EACH ROW
    INSERT INTO locations_info (location_id, operation, transaction_date)
    VALUES (NEW.location_id, 'insert', NOW());

CREATE TRIGGER del_trig
AFTER  delete ON locations
FOR EACH ROW
    INSERT INTO locations_info (location_id, operation, transaction_date)
    VALUES (old.location_id, 'delete', NOW());

CREATE TRIGGER upd_trig
AFTER update on locations
FOR EACH ROW
    INSERT INTO locations_info (location_id, operation, transaction_date)
    VALUES (NEW.location_id, 'update', NOW());
   
-- Q.3. For the following tables create a view named employee_information with employee first name, last name, salary, department name, city, postal code insert
-- only those records whose postal code length is less than 5.

CREATE VIEW employee_information as SELECT
e.first_name, e.last_name,e.salary, d.department_name, l.city, l.pincode
FROM employees e join departments d on e.department_id =d.department_id 
                 join locations l on d.location_id =l.location_id 
WHERE length(l.pincode)<5;

SELECT
* from employee_information;      

      
-- Q.4. Explain ACID properties with an example.

/*
The acronym ACID refers to the four key properties of a transaction: atomicity, consistency, isolation, and durability. 

It can be explained in the context of a banking application for transferring funds of its customers:

a. Atomicity

All changes to data are performed as if they are a single operation. That is, all the changes are performed, or none of them are.
For example, in an application that transfers funds from one account to another, the atomicity property ensures that, if a debit 
is made successfully from one account, the corresponding credit is made to the other account.

b. Consistency

Data is in a consistent state when a transaction starts and when it ends.

For example, in an application that transfers funds from one account to another, the consistency property ensures that the total 
value of funds in both the accounts is the same at the start and end of each transaction.

c. Isolation

The intermediate state of a transaction is invisible to other transactions. As a result, transactions that run concurrently appear
to be serialized.

For example, in an application that transfers funds from one account to another, the isolation property ensures that another
transaction sees the transferred funds in one account or the other, but not in both, nor in neither.

d. Durability

After a transaction successfully completes, changes to data persist and are not undone, even in the event of a system failure.
For example, in an application that transfers funds from one account to another, the durability property ensures that the changes
made to each account will not be reversed.
*/


-- Q.5. Answer the above question with explanation
/*
The index field associated with the values 1, 3, 2, 5 and 4 is the Occupation field because after sorting the Occupational field 
lexicographically will give the sequence 1,3,2,5,4. 
 */   