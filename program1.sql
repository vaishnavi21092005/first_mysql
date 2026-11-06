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

SELECT * FROM employees where='IT';
+----+-------+--------+------------+----------------+------+--------+
| id | Name  | city   | department | email          | age  | salary |
+----+-------+--------+------------+----------------+------+--------+
|  1 | amit  | satara | IT         | amit@gmail.com |   28 | 300000 |
|  3 | ram   | chenni | IT         | rem@gamil.com  |   25 |  28000 |
|  6 | rajat | vashi  | IT         | NULL           |   32 |  40000 |
+----+-------+--------+------------+----------------+------+--------+

SELECT Name from employees where department='IT';
+-------+
| Name  |
+-------+
| amit  |
| ram   |
| rajat |
+-------+
SELECT Name ,department from employees where email is null;
+-------+------------+
| Name  | department |
+-------+------------+
| rohan | marketing  |
| rajat | IT         |
+-------+------------+
SELECT Name ,department from employees where email is not null;
+---------+------------+
| Name    | department |
+---------+------------+
| amit    | IT         |
| sita    | sales      |
| ram     | IT         |
| saurabh | Account    |
+---------+------------+
-- remove duplicate
SELECT distinct city from employees;
+--------+
| city   |
+--------+
| satara |
| pune   |
| chenni |
| thane  |
| mumbai |
| vashi  |
+--------+
SELECT distinct department from employees;
+------------+
| department |
+------------+
| IT         |
| sales      |
| Account    |
| marketing  |
+------------+

-- select salary greater than 15k
select * from employees where salary>=25000;
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  1 | amit    | satara | IT         | amit@gmail.com    |   28 | 300000 |
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
+----+---------+--------+------------+-------------------+------+--------+

select * from employees where salary>=30000;
+----+-------+--------+------------+----------------+------+--------+
| id | Name  | city   | department | email          | age  | salary |
+----+-------+--------+------------+----------------+------+--------+
|  1 | amit  | satara | IT         | amit@gmail.com |   28 | 300000 |
|  5 | rohan | mumbai | marketing  | NULL           |   30 |  36000 |
|  6 | rajat | vashi  | IT         | NULL           |   32 |  40000 |
+----+-------+--------+------------+----------------+------+--------+

-- select department =IT salary greater than 25k
select * from employees where department='IT' and salary>25000; 
+----+-------+--------+------------+----------------+------+--------+
| id | Name  | city   | department | email          | age  | salary |
+----+-------+--------+------------+----------------+------+--------+
|  1 | amit  | satara | IT         | amit@gmail.com |   28 | 300000 |
|  3 | ram   | chenni | IT         | rem@gamil.com  |   25 |  28000 |
|  6 | rajat | vashi  | IT         | NULL           |   32 |  40000 |
+----+-------+--------+------------+----------------+------+--------+

-- select department =IT salary greater than 30k
select * from employees where department='IT' and salary>30000; 
+----+-------+--------+------------+----------------+------+--------+
| id | Name  | city   | department | email          | age  | salary |
+----+-------+--------+------------+----------------+------+--------+
|  1 | amit  | satara | IT         | amit@gmail.com |   28 | 300000 |
|  6 | rajat | vashi  | IT         | NULL           |   32 |  40000 |
+----+-------+--------+------------+----------------+------+--------+

-- It department or sal is grater than 25000
select * from employees where department='IT' or salary>25000; 
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  1 | amit    | satara | IT         | amit@gmail.com    |   28 | 300000 |
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
+----+---------+--------+------------+-------------------+------+--------+

-- give me data from satara and pune
select * from employees where city in ('satara','pune');
+----+------+--------+------------+----------------+------+--------+
| id | Name | city   | department | email          | age  | salary |
+----+------+--------+------------+----------------+------+--------+
|  1 | amit | satara | IT         | amit@gmail.com |   28 | 300000 |
|  2 | sita | pune   | sales      | sita@gmail.com |   22 |  22000 |
+----+------+--------+------------+----------------+------+--------+

select * from employees where city in ('satara','pune') and department in ('sales','IT');
+----+------+--------+------------+----------------+------+--------+
| id | Name | city   | department | email          | age  | salary |
+----+------+--------+------------+----------------+------+--------+
|  1 | amit | satara | IT         | amit@gmail.com |   28 | 300000 |
|  2 | sita | pune   | sales      | sita@gmail.com |   22 |  22000 |
+----+------+--------+------------+----------------+------+--------+

select * from employees where city in ('satara','pune') and department in ('sales','marketing');
+----+------+------+------------+----------------+------+--------+
| id | Name | city | department | email          | age  | salary |
+----+------+------+------------+----------------+------+--------+
|  2 | sita | pune | sales      | sita@gmail.com |   22 |  22000 |
+----+------+------+------------+----------------+------+--------+

-- employees not from satara and pune
select * from employees where city not in ('satara','pune');
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
+----+---------+--------+------------+-------------------+------+--------+

-- Order Clause
-- by default ascending
select * from employees order by salary;
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  2 | sita    | pune   | sales      | sita@gmail.com    |   22 |  22000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
|  1 | amit    | satara | IT         | amit@gmail.com    |   28 | 300000 |
+----+---------+--------+------------+-------------------+------+--------+

-- salary in descending order
select * from employees order by salary desc;
+----+---------+--------+------------+-------------------+------+--------+
| id | Name    | city   | department | email             | age  | salary |
+----+---------+--------+------------+-------------------+------+--------+
|  1 | amit    | satara | IT         | amit@gmail.com    |   28 | 300000 |
|  6 | rajat   | vashi  | IT         | NULL              |   32 |  40000 |
|  5 | rohan   | mumbai | marketing  | NULL              |   30 |  36000 |
|  3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |
|  4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |
|  2 | sita    | pune   | sales      | sita@gmail.com    |   22 |  22000 |
+----+---------+--------+------------+-------------------+------+--------+

select * from employees where department='IT' order by salary desc;
+----+-------+--------+------------+----------------+------+--------+
| id | Name  | city   | department | email          | age  | salary |
+----+-------+--------+------------+----------------+------+--------+
|  1 | amit  | satara | IT         | amit@gmail.com |   28 | 300000 |
|  6 | rajat | vashi  | IT         | NULL           |   32 |  40000 |
|  3 | ram   | chenni | IT         | rem@gamil.com  |   25 |  28000 |
+----+-------+--------+------------+----------------+------+--------+

