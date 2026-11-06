-- Group by Clause
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

select city from employees group by city;
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

select department from employees group by department;
+------------+
| department |
+------------+
| IT         |
| sales      |
| Account    |
| marketing  |
+------------+

select department,count(*) as dept_count from employees group by department;
+------------+------------+
| department | dept_count |
+------------+------------+
| IT         |          3 |
| sales      |          1 |
| Account    |          1 |
| marketing  |          1 |
+------------+------------+

select city,count(*) as dept_count from employees group by city;

+--------+------------+
| city   | dept_count |
+--------+------------+
| satara |          1 |
| pune   |          1 |
| chenni |          1 |
| thane  |          1 |
| mumbai |          1 |
| vashi  |          1 |
+--------+------------+

select department,count(*) as dept_count from employees where department='IT' group by department;
+------------+------------+
| department | dept_count |
+------------+------------+
| IT         |          3 |
+------------+------------+

select city,count(*) as city_count from employees  group by  city having city_count count>=1;
+--------+------------+
| city   | city_count |
+--------+------------+
| satara |          1 |
| pune   |          1 |
| chenni |          1 |
| thane  |          1 |
| mumbai |          1 |
| vashi  |          1 |
+--------+------------+

select department,count(*) as dept_count from employees  group by department having dept_count>1 ;   
+------------+------------+
| department | dept_count |
+------------+------------+
| IT         |          3 |
+------------+------------+






