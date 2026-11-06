-- Relation in Database
-- One to One

create database employee;

CREATE TABLE employee (
  id int primary key AUTO_INCREMENT,
 emp_name varchar(50),
post varchar(50)
);

Query OK, 0 rows affected (0.05 sec)

insert into employee(emp_name,post)
values('A','HR'),
('B','IT'),
('C','IT'),
('D','Support'),
('E','Support'),
('F','Support');

desc employee;

+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int         | NO   | PRI | NULL    | auto_increment |
| emp_name | varchar(50) | YES  |     | NULL    |                |
| post     | varchar(50) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

select * from employee;

+----+----------+---------+
| id | emp_name | post    |
+----+----------+---------+
|  1 | A        | HR      |
|  2 | B        | IT      |
|  3 | C        | IT      |
|  4 | D        | Support |
|  5 | E        | Support |
|  6 | F        | Support |
+----+----------+---------+

select distinct post from employee;

+---------+
| post    |
+---------+
| HR      |
| IT      |
| Support |
+---------+

select post,count(*) as count from empoyee group by post;

+---------+-------+
| post    | count |
+---------+-------+
| HR      |     1 |
| IT      |     2 |
| Support |     3 |
+---------+-------+

drop database employee;

create databases tcs;

show databases;

use tcs;

create table dept(
    dept_id int primary key,
    dept_name varchar(50)
);

insert into dept(dept_id,dept_name)
values(101,'HR'),
(102,'IT'),
(103,'Support');

select * from dept;

+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|     101 | HR        |
|     102 | IT        |
|     103 | Support   |
+---------+-----------+

create table employee(
    id int primary key auto_increment,
    name varchar(50),
    salary int,
    d_id int,
    foreign key(d_id)
    references dept(dept_id)
);

insert into employee(
    name,
    salary,
    d_id
)
values('A',50000,101),
('B',55000,102),
('C',40000,102),
('D',45000,103),
('E',23000,103),
('F',35000,null);
select * from employee;

+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  1 | A    |  50000 |  101 |
|  2 | B    |  55000 |  102 |
|  3 | C    |  40000 |  102 |
|  4 | D    |  45000 |  103 |
|  5 | E    |  23000 |  103 |
|  6 | F    |  35000 | NULL |
+----+------+--------+------+

select * from  employee join dept on employee.d_id=dept.dept_id;
+----+------+--------+------+---------+-----------+
| id | name | salary | d_id | dept_id | dept_name |
+----+------+--------+------+---------+-----------+
|  1 | A    |  50000 |  101 |     101 | HR        |
|  2 | B    |  55000 |  102 |     102 | IT        |
|  3 | C    |  40000 |  102 |     102 | IT        |
|  4 | D    |  45000 |  103 |     103 | Support   |
|  5 | E    |  23000 |  103 |     103 | Support   |
+----+------+--------+------+---------+-----------+

select * from employee where salary>(
    select avg(salary) from employee e join dept d on e.d_id=d.dept_id where d.dept_name='IT'
    );
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  1 | A    |  50000 |  101 |
|  2 | B    |  55000 |  102 |
+----+------+--------+------+

-- Second max salary
select * from employee where salary=(select max(salary) from employee where salary<(select max(salary)from employee));
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  1 | A    |  50000 |  101 |
+----+------+--------+------+

-- First max salary
select * from employee where salary=(select max(salary) from employee);
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  2 | B    |  55000 |  102 |
+----+------+--------+------+

-- First min salary
select * from employee where salary=(select min(salary) from employee );
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  5 | E    |  23000 |  103 |
+----+------+--------+------+

-- Second min salary
select * from employee where salary=(select min(salary) from employee where salary>(select min(salary)from employee));
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  6 | F    |  35000 | NULL |
+----+------+--------+------+

-- give me employee where raj of department
select * from employee e join dept d on e.d_id=d.dept_id where d_id=(select d_id from employee where name='B');
+----+------+--------+------+---------+-----------+
| id | name | salary | d_id | dept_id | dept_name |
+----+------+--------+------+---------+-----------+
|  2 | B    |  55000 |  102 |     102 | IT        |
|  3 | C    |  40000 |  102 |     102 | IT        |
+----+------+--------+------+---------+-----------+

-- give me salary greater than rahul's salary
select * from employee e join dept d on e.d_id=d.dept_id where salary>(select d_id from employee where name='B');
+----+------+--------+------+---------+-----------+
| id | name | salary | d_id | dept_id | dept_name |
+----+------+--------+------+---------+-----------+
|  1 | A    |  50000 |  101 |     101 | HR        |
|  2 | B    |  55000 |  102 |     102 | IT        |
|  3 | C    |  40000 |  102 |     102 | IT        |
|  4 | D    |  45000 |  103 |     103 | Support   |
|  5 | E    |  23000 |  103 |     103 | Support   |
+----+------+--------+------+---------+-----------+
5 rows in set (0.00 sec)

select * from employee e join dept d on e.d_id=d.dept_id where salary>(select d_id from employee where name='C');

select * from employee where salary>(select avg(salary) from employee );
+----+------+--------+------+
| id | name | salary | d_id |
+----+------+--------+------+
|  1 | A    |  50000 |  101 |
|  2 | B    |  55000 |  102 |
|  4 | D    |  45000 |  103 |
+----+------+--------+------+

select * from employee e join dept d on e.d_id=d.dept_id where dept_name='Support';
+----+------+--------+------+---------+-----------+
| id | name | salary | d_id | dept_id | dept_name |
+----+------+--------+------+---------+-----------+
|  4 | D    |  45000 |  103 |     103 | Support   |
|  5 | E    |  23000 |  103 |     103 | Support   |
+----+------+--------+------+---------+-----------+

select count(*) from employee e join dept d on e.d_id=d.dept_id where dept_name='Support';
+----------+
| count(*) |
+----------+
|        2 |
+----------+

select count(*) from employee e join dept d on e.d_id=d.dept_id where d_id=103 and dept_name='Support';
+----------+
| count(*) |
+----------+
|        2 |
+----------+
select dept_name,count(*) as count  from  employee e join dept d on e.d_id=d.dept_id  group by dept_name having count>=2;

+-----------+-------+
| dept_name | count |
+-----------+-------+
| IT        |     2 |
| Support   |     2 |
+-----------+-------+
select dept_name,count(*) as count  from  employee e join dept d on e.d_id=d.dept_id  group by dept_name having count<2;
+-----------+-------+
| dept_name | count |
+-----------+-------+
| HR        |     1 |
+-----------+-------+



