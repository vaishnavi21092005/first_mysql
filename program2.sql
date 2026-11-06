-- Aggregate function
use infosys;

CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    city VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(50),
    age INT,
    salary INT
);
desc employees;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| Name       | varchar(100) | YES  |     | NULL    |                |
| city       | varchar(50)  | YES  |     | NULL    |                |
| department | varchar(50)  | YES  |     | NULL    |                |
| email      | varchar(50)  | YES  |     | NULL    |                |
| age        | int          | YES  |     | NULL    |                |
| salary     | int          | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

insert into employees(
    Name,
    city,
    department,
    email,
    age,
    salary
)values('amit','satara','IT','amit@gmail.com',28,300000),
('sita','pune','sales','sita@gmail.com',22,22000),
('ram','chenni','IT','rem@gamil.com',25,28000),
('saurabh','thane','Account','saurabh@gmail.com',27,27000),
('rohan','mumbai','marketing',null,30,36000),
('rajat','vashi','IT',null,32,40000);

SELECT * FROM employeees;
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  1 | amit    | satara | IT         | amit@gmail.com    |   28 | 300000 |
|  2 | sita    | pune   | sales      | sita@gmail.com    |   22 |  22000 |
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
+----+---------+--------+------------+-------------------+------+--------+

-- count of rows
select count(*) as emp_count from employees;
+-----------+
| emp_count |
+-----------+
|         6 |
+-----------+

select count(email) as email_count from employees;
+-------------+
| email_count |
+-------------+
|           4 |
+-------------+

select count(department) as department_count from employees;
+------------------+
| department_count |
+------------------+
|                6 |
+------------------+

-- sum of salary
select sum(salary) as spend from employees;
+--------+
| spend  |
+--------+
| 453000 |
+--------+

-- maximum salary
select max(salary) as spend from employees;
+--------+
| spend  |
+--------+
| 300000 |
+--------+

select Name max(salary) as spend from employees;
-- error

-- Limit of rows
select * from employees limit 3;
+----+------+--------+------------+----------------+------+--------+
| id | Name | city   | department | email          | age  | salary |
+----+------+--------+------------+----------------+------+--------+
|  1 | amit | satara | IT         | amit@gmail.com |   28 | 300000 |
|  2 | sita | pune   | sales      | sita@gmail.com |   22 |  22000 |
|  3 | ram  | chenni | IT         | rem@gamil.com  |   25 |  28000 |
+----+------+--------+------------+----------------+------+--------+

-- Highest Salary
select * from employees where department='IT' order by age limit 2;
+----+------+--------+------------+----------------+------+--------+
| id | Name | city   | department | email          | age  | salary |
+----+------+--------+------------+----------------+------+--------+
|  3 | ram  | chenni | IT         | rem@gamil.com  |   25 |  28000 |
|  1 | amit | satara | IT         | amit@gmail.com |   28 | 300000 |
+----+------+--------+------------+----------------+------+--------+

-- Avs Salary
select avg(salary) from employees;
+-------------+
| avg(salary) |
+-------------+
|  75500.0000 |
+-------------+

select avg(salary) from employees where department='IT';
+-------------+
| avg(salary) |
+-------------+
| 122666.6667 |
+-------------+

