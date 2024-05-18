/*1. Display all information in the tables EMP and DEPT*/
create database HR;
USE HR;

/*2. Display only the hire date and employee name for each employee*/ 
SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME AND HIRE_DATE;

/*4. Display the hire date, name and department number for all clerks*/ 
SELECT FIRST_NAME,HIRE_DATE,DEPARTMENT_ID FROM EMP;

/*3.Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title*/
SELECT FIRST_NAME ,LAST_NAME , CONCAT_WS (",", FIRST_NAME ,LAST_NAME) 
AS EMPLOYEE FROM EMP;

/*5.Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */
SELECT * FROM EMP;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PH_NO, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID 
,CONCAT_WS (",", EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PH_NO, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) 
AS THE_OUTPUT FROM EMP;

/*6.Display the names and salaries of all employees with a salary greater than 2000*/
SELECT * FROM EMP WHERE SALARY > "2000";

/*7. Display the names and dates of employees with the column headers "Name" and "Start
Date*/
SELECT EMPLOYEE_ID AS "NAME",HIRE_DATE AS "START DATE" FROM EMP;

/*8. Display the names and hire dates of all employees in the order they were hired*/
SELECT EMPLOYEE_ID,HIRE_DATE FROM EMP WHERE HIRE_DATE;

/*9. Display the names and salaries of all employees in reverse salary order*/ 
SELECT REVERSE(FIRST_NAME) FROM EMP;
SELECT REVERSE(SALARY) FROM EMP;
SELECT REVERSE(FIRST_NAME) AND (SALARY) FROM EMP;

/*10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order*/
SELECT EMPLOYEE_ID,DEPARTMENT_ID FROM EMP WHERE REVERSE (SALARY);

/*11. Display the last name and job title of all employees who do not have a manager*/
SELECT LAST_NAME,JOB_ID FROM EMP WHERE NOT MANAGER_ID;

/*12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/
SELECT LAST_NAME,JOB_ID,SALARY FROM EMP WHERE JOB_ID NOT IN ("2500","3500","5000");
 
/*13.Display the maximum, minimum and average salary and commission earned*/
SELECT MIN(SALARY)FROM EMP;
SELECT MAX(SALARY)FROM EMP;
SELECT AVG(SALARY)FROM EMP;
SELECT COUNT(SALARY)FROM EMP;
SELECT * FROM EMP WHERE COMMISSION_PCT;

/*14.Display the department number, total salary payout and total commission payout for
each department*/ 
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMP GROUP BY DEPARTMENT_ID;
SELECT COMMISSION_PCT FROM EMP;

/*15.Display the department number and number of employees in each department*/
SELECT DEPARTMENT_ID, COUNT(*) FROM EMP GROUP BY DEPARTMENT_ID; 
ALTER TABLE EMP ADD COLUMN DEPARTMENT VARCHAR(30) AFTER DEPARTMENT_ID;

/*16.Display the department number and total salary of employees in each department*/
SELECT  SUM(SALARY) FROM EMP;
select * from EMP WHERE DEPARTMENT_ID;

/*17.Display the employee's name who doesn't earn a commission. Order the result set
without using the column name*/
SELECT FIRST_NAME ,LAST_NAME AS FIRST_NAME,SALARY FROM EMP WHERE COMMISSION_PCT IS NULL; 

/*18.Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately*/
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE 
  WHEN (COMMISSION_PCT) THEN (SELECT(COMMISSION_PCT)
  FROM EMP) 
  ELSE COMMISSION_PCT
  END AS "NO COMMISSION" FROM EMP;
  
  
/*19.Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriate*/
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE
WHEN (COMMISSION_PCT*2)>0 THEN (SELECT(COMMISSION_PCT*2)
FROM EMP)
ELSE "NO COMMISSION"
END FROM EMP;  


/*20.Display the sum of salaries of the employees working under each Manager*/
SELECT MANAGER_ID, SUM(SALARY) FROM EMP
GROUP BY MANAGER_ID;

/*21.Select the Managers name, the count of employees working under and the department
ID of the manager*/
SELECT COUNT(EMPLOYEE_ID),COUNT(DEPARTMENT_ID) FROM EMP;

/*22.Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a'*/
SELECT FIRST_NAME,LAST_NAME FROM EMP WHERE LAST_NAME LIKE "_A%";


/*23.Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id*/
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

/*24.Select the maximum salary of each department along with the department id*/
SELECT MAX('SALARY') FROM EMP ;


/*25. Display the commission, if not null display 10% of salary, if null display a default value 1*/
SELECT EMPLOYEE_ID,COMMISSION_PCT,
CASE 
    WHEN COMMISSION_PCT = 0.00 THEN '1'
    ELSE 0.10*SALARY
END AS SALARY
FROM EMP;

/*26. Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label*/
SELECT LAST_NAME, CONCAT(UCASE(SUBSTR(LAST_NAME,2,1)),LCASE(SUBSTR(LAST_NAME,3,3)))
FROM EMP;

/*27. Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined*/
SELECT FIRST_NAME,LAST_NAME,CONCAT_WS("-",FIRST_NAME,LAST_NAME) AS EMPLOYEE_ID,DATE_FORMAT(HIRE_DATE,"%M") AS HIRE_MONTH
FROM EMP;


/*29. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!*/
SELECT EMPLOYEE_ID,CONCAT(INSERT(EMPLOYEE_ID,2,0,"00"),"E") AS EMPLOYEE_ID,DEPARTMENT_ID,SALARY,UCASE(MANAGER_ID) AS MANAGER,
CASE
  WHEN MANAGER_ID LIKE 'Z%' THEN '$!'
  WHEN MANAGER_ID LIKE '%Z%' THEN '$!'
  WHEN MANAGER_ID LIKE '%Z' THEN '$!'
  ELSE MANAGER_ID
  END AS MANAGER_EDITED
  FROM EMP;
  
/*30. Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names*/
SELECT CONCAT(UCASE(SUBSTR(LAST_NAME,1,1)),LCASE(SUBSTR(LAST_NAME,2))) AS SUR_NAME,LENGTH(LAST_NAME) AS CHAR_LENGTH
FROM EMP
WHERE LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%'
ORDER BY LAST_NAME;

/*31. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY*/
SELECT LAST_NAME,SALARY,CONCAT('$'," ",(FORMAT(SALARY,15))) AS SALARY
FROM EMP;


/*32. Display the employee's name if it is a palindrome*/
SELECT FIRST_NAME FROM EMP
WHERE FIRST_NAME=REVERSE(FIRST_NAME);

/*33. Display First names of all employees with initcaps*/
SELECT CONCAT(UCASE(SUBSTR(FIRST_NAME,1,1)),LCASE(SUBSTR(FIRST_NAME,2))) AS INITCAP_NAME FROM EMP;

/*35. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name*/
SELECT FIRST_NAME,LAST_NAME,LCASE(CONCAT(SUBSTR(FIRST_NAME,1,1),LAST_NAME,"@systechusa.com")) AS EMAIL_ADDRESS
FROM EMP;


/*36.Display the names and job titles of all employees with the same job as Trenna*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME,JOB_ID
FROM EMP 
WHERE JOB_ID IN 
(SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME ='TRENNA'); 

/*38.Display the name of the employee whose salary is the lowest*/ 
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME 
FROM EMP
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMP);


/* 39.Display the names of all employees except the lowest paid*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME
FROM EMP
WHERE SALARY NOT IN (SELECT MIN(SALARY) FROM EMP);

/* 40.Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label*/
SELECT LAST_NAME ,SUBSTR(LAST_NAME,2,5)
FROM EMP;
SELECT LAST_NAME ,SUBSTRING_INDEX(LAST_NAME," ",2)
FROM EMP;
SELECT LAST_NAME ,lcase(LAST_NAME)
FROM EMP;

/*41.Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/
SELECT FIRST_NAME , LAST_NAME ,CONCAT_WS("-",FIRST_NAME , LAST_NAME)
FROM EMP;
SELECT * ,FIRST_NAME, LAST_NAME , MONTH(HIRE_DATE) FROM EMP;

/*42. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.*/
SELECT LAST_NAME,
CASE
WHEN SALARY/2 > 10000
THEN SALARY*1.1
ELSE SALARY *1.115
END AS "ADJUSTED SALARY"
FROM EMP;


/* 43.Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!*/
SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), '00', 'E') AS "Modified Employee ID",
    department_id AS "Department ID",
    UPPER(salary) AS "Salary",
    REPLACE(UPPER(MANAGER_ID), 'Z', '$!') AS "Manager Name"
FROM EMP;

/*44. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names.*/ 
SELECT 
    CONCAT(UCASE(LEFT(last_name, 1)), LCASE(SUBSTRING(last_name, 2))) AS "Name",
    LENGTH(last_name) AS "Name Length"
FROM emp
WHERE 
    last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

/*45. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY.*/
SELECT last_name,
LPAD(CONCAT('$', FORMAT(salary, 2)), 15, '$') AS "SALARY"
FROM emp;

/*46.Display the employee's name if it is a palindrome.*/
 SELECT CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM emp
WHERE 
CONCAT(first_name, last_name) = REVERSE(CONCAT(first_name, last_name));

/*47. Display First names of all employees with initcaps.*/
SELECT INITCAPS(first_name) AS "First Name"
FROM emp;

/*48. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.*/
SELECT 
SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2), ' ', -1) AS "Word Between First and Second Space"
FROM LOCATION;

/*49.Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name.*/
SELECT 
CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), last_name, '@systechusa.com') AS "e-mail address",    
first_name
FROM emp;

/*50. Display the names and job titles of all employees with the same job as Trenna.*/
SELECT first_name,last_name,job_ID
FROM emp
WHERE job_ID = (
SELECT job_ID
FROM emp
WHERE first_name = 'Trenna'
LIMIT 1
);

/*51.Display the names and department name of all employees working in the same city as 
Trenna.*/
SELECT first_name,last_name,department_name
FROM emp 
JOIN 
dep ON department_id = d.department_id
WHERE city = (
SELECT city
FROM emp
WHERE first_name = 'Trenna'
LIMIT 1
);

/*52. Display the name of the employee whose salary is the lowest.*/
SELECT 
CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM emp
WHERE salary = 
(
SELECT MIN(salary)
FROM emp
);

/*53. Display the names of all employees except the lowest paid.*/
SELECT CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM emp
WHERE salary > 
(
SELECT MIN(salary)
FROM emp
);

/* 54. Write a query to display the last name, department number, department name for all 
employees. */
SELECT last_name,department_id,department_name
FROM emP
JOIN dep ON department_id = department_id;

/* 55. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.*/
SELECT DISTINCT job_ID,STREET_ADDRESS
FROM emp
JOIN dep ON department_id = department_id
JOIN location ON STREET_ADDRESS= STREET_ADDRESS
WHERE department_id = 4;

/*56. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission.*/
SELECT e.last_name,d.department_name,l.location_id,l.city
FROM emp
JOIN job_history j ON e.employee_id = j.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE j.commission_pct IS NOT NULL;

/*57.Display the employee last name and department name of all employees who have an 'a' 
in their last name */
SELECT e.last_name,d.department_name
FROM emp
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%';

/* 58.  Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA.*/
SELECT e.last_name,e.job_title,e.department_id,d.department_name
FROM emp
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'ATLANTA';

/* 59. Display the employee last name and employee number along with their manager's last 
name and manager number.*/
SELECT 
e.last_name AS "Employee Last Name",
e.employee_id AS "Employee Number",
m.last_name AS "Manager Last Name",
e.manager_id AS "Manager Number"
FROM emp
JOIN emp ON e.manager_id = m.employee_id;

/*59. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager).*/
SELECT 
e.last_name AS "Employee Last Name",
e.employee_id AS "Employee Number",
COALESCE(m.last_name, 'No Manager') AS "Manager Last Name",
COALESCE(e.manager_id, 'No Manager') AS "Manager Number"
FROM empl
LEFT JOIN employees m ON e.manager_id = m.employee_id;

/*60. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee.*/
SELECT 
e.last_name AS "Employee Last Name",
e.department_id AS "Department Number"
FROM emp
WHERE e.department_id = 
(
SELECT department_id
FROM emp
WHERE last_name = 'Given Employee Last Name' 
-- Replace 'Given Employee Last Name' with the actual last name of the given employee
LIMIT 1
);

/* 61. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) */
SELECT 
CONCAT(first_name, ' ', last_name) AS "Employee Name",
job_title AS "Job",
department_name AS "Department Name",
salary AS "Salary",
CASE
WHEN salary >= 50000 THEN 'A'
WHEN salary >= 30000 THEN 'B'
ELSE 'C'
END AS "Grade"
FROM emp
JOIN departments ON employees.department_id = departments.department_id;

/* 62.  Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date. */
SELECT 
CONCAT(e.first_name, ' ', e.last_name) AS "Employee Name",
e.hire_date AS "emp_hire_date",
CONCAT(m.first_name, ' ', m.last_name) AS "Manager Name",
hire_date AS "man_hire_date"
FROM emp
JOIN Emp ON manager_id = employee_id
WHERE e.hire_date < m.hire_date;

/* 63. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.*/
SELECT employee_id AS "Employee Number",
CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM emp
JOIN bonuses b ON employee_id = employee_id
WHERE job_title = 'Sales' AND amount = 2000;

/* 64. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A. */
SELECT 
e.employee_id,
COALESCE(a.address, 'N/A') AS address,
COALESCE(a.city, 'N/A') AS city,
COALESCE(a.state, 'N/A') AS state,
COALESCE(a.zipcode, 'N/A') AS zipcode
FROM emp
WHERE state = 'CA' OR state IS NULL;

/*65. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.*/
SELECT ProductID,ProductName,SalesOrderID
FROM Products;


/* 66.Find the subcategories that have at least two different prices less than $15.*/
SELECT 
subcategory,
COUNT(DISTINCT price) AS num_prices
FROM products
WHERE price < 15
GROUP BY subcategory
HAVING COUNT(DISTINCT price) >= 2;

/* 67. A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name.
B. Display the employee id and employee name of employees who do not have manager.*/
SELECT employee_id AS "Employee ID",
CONCAT(first_name, ' ', last_name) AS "Employee Name",
manager_id AS "Manager ID",
CONCAT(first_name, ' ', last_name) AS "Manager Name"
FROM emp
LEFT JOIN emp ON e.manager_id = m.employee_id;

SELECT 
employee_id AS "Employee ID",
CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM emp
WHERE manager_id IS NULL;

/* 68. A. Display the names of all products of a particular subcategory 15 and the names of their 
vendors.
B. Find the products that have more than one vendor. */
SELECT 
ProductName AS "Product_Name",
VendorName AS "Vendor_Name"
FROM Products 
WHERE SubcategoryID = 15;

SELECT ProductID,
COUNT(DISTINCT VendorID) AS num_vendors
FROM Products
GROUP BY ProductID
HAVING COUNT(DISTINCT VendorID) > 1;

/* 69. . Find all the customers who do not belong to any store.*/
SELECT CustomerID,CustomerName
FROM Customers 
LEFT JOIN 
Stores ON StoreID = StoreID
WHERE StoreID IS NULL;

/* 70. . Find sales prices of product 718 that are less than the list price recommended for that 
product. */
SELECT 
price AS "Sales Price",
list_price AS "List Price"
FROM sales 
WHERE product_id = 718
AND price < p.list_price;

 /* 71.Display product number, description and sales of each product in the year 2001.*/
SELECT product_number,
description,
sales
FROM products 
WHERE YEAR(sales_date) = 2001;

/* 72. Build the logic on the above question to extract sales for each category by year. Fetch 
Product Name, Sales_2001, Sales_2002, Sales_2003.*/
SELECT 
product_name,
SUM(CASE WHEN YEAR(s.sales_date) = 2001 THEN s.sales ELSE 0 END) AS Sales_2001,
SUM(CASE WHEN YEAR(s.sales_date) = 2002 THEN s.sales ELSE 0 END) AS Sales_2002,
SUM(CASE WHEN YEAR(s.sales_date) = 2003 THEN s.sales ELSE 0 END) AS Sales_2003
FROM products 
GROUP BY product_name;

/*73. Write a query to display the last name and hire date of any employee in the same 
department as SALES.*/
SELECT last_name,hire_date
FROM emp
WHERE department_name = 'SALES'; 

/* 74.Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary.*/
SELECT employee_id,last_name FROM emp
WHERE salary > (
SELECT AVG(salary)FROM emp
)
ORDER BY salary ASC;

/* 75.Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u.*/
 SELECT department_id FROM emp WHERE last_name LIKE '%u%';
 
 /*76.  Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA.*/
SELECT e.last_name,d.department_id,e.job_id
FROM emp
WHERE l.city = 'ATLANTA';

/*77. Display the last name and salary of every employee who reports to FILLMOR*/
SELECT last_name,salary
FROM emp
WHERE last_name = 'FILLMOR';

/* 78.Display the department number, last name, and job ID for every employee in the 
OPERATIONS department.*/
SELECT department_id,last_name,job_id FROM empl
WHERE department_name = 'OPERATIONS';

/*79. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.*/
SELECT employee_id,last_name,salary FROM emp
JOIN (SELECT DISTINCT department_id FROM emp
WHERE last_name LIKE '%u%') AS dept_with_u ON e.department_id = dept_with_u.department_id
WHERE salary > (SELECT AVG(salary)FROM emp);

/* 80.Display the names of all employees whose job title is the same as anyone in the sales 
dept.*/
SELECT last_name FROM emp
WHERE job_title IN (SELECT DISTINCT job_title FROM emp
WHERE department_id = (SELECT department_id FROM dep
WHERE department_name = 'Sales'));

/* 81. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise. */
-- Employees in department 1 and 3 with a 5% raise --
SELECT employee_id,'5%' AS raise_percentage,salary FROM emp
WHERE department_id IN (1, 3)
UNION ALL
-- Employees in department 2 with a 10% raise --
SELECT employee_id,
'10%' AS raise_percentage,salary * 1.1 AS salary FROM emp
WHERE department_id = 2
UNION ALL
-- Employees in departments 4 and 5 with a 15% raise --
SELECT employee_id,'15%' AS raise_percentage,salary * 1.15 AS salary
FROM emp
WHERE department_id IN (4, 5)
UNION ALL
-- Employees in department 6 with no raise --
SELECT employee_id,'No Raise' AS raise_percentage,salary
FROM emp
WHERE department_id = 6;

/*82. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries.*/
SELECT last_name,salary FROM emp
ORDER BY salary DESC LIMIT 3;

/*83. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column.*/
SELECT last_name,salary,COALESCE(commission, 0) AS commission FROM emp;

/*84. Display the Managers (name) with top three salaries along with their salaries and 
department information.*/
SELECT last_name AS Manager_Name,salary AS Manager_Salary,department_name
FROM emp WHERE job_id LIKE '%MANAGER%'ORDER BY salary DESC LIMIT 3;
 -- Assuming managers can be identified by their job title --

