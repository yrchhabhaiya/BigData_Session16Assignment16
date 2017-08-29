USE default;
CREATE TABLE employee
(
id INT,
name STRING,
salary INT,
unit STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH '/home/acadgild/dataset/assignment16/employee.txt'
INTO TABLE employee;
SELECT * FROM employee;

SELECT id, name, salary, unit, (lead_salary - salary) AS diff_salary FROM
(
SELECT id, name, salary, unit, LEAD(salary) OVER (PARTITION BY unit ORDER BY salary) AS lead_salary
FROM employee
) temp
WHERE lead_salary - salary > 100;

SELECT id, name, salary, unit, avg_salary 
FROM
(
SELECT avg(salary) OVER (PARTITION BY unit) AS avg_salary, id, name, salary, unit
FROM employee
) temp
WHERE salary > avg_salary;

