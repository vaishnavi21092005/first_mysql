-- Join Clause
use infosys;

create table company(
    c_id int primary key,
    company_name varchar(50),
    found_year int,
    founder varchar(100),
    location varchar(100)
);

desc company;

INSERT INTO company(c_id,company_name,found_year,founder,location)
values(101,'infosys',1995,'Sudha Murthy','pune'),
(102,'TCS',1968,'Ratan Tata','Mumbai'),
(103,'Capgemini',1967,'Serge Kampf','France');

select * from company;
+------------+--------------+------------+--------------+----------+
| company_id | company_name | found_year | founder      | location |
+------------+--------------+------------+--------------+----------+
|        101 | infosys      |       1995 | Sudha Murthy | pune     |
|        102 | TCS          |       1968 | Ratan Tata   | Mumbai   |
|        103 | Capgemini    |       1967 | Serge Kampf  | France   |
+------------+--------------+------------+--------------+----------+

CREATE TABLE emp(
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    city VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(50),
    age INT,
    salary INT,
    company_id int,
    foreign key(company_id)
    references company(c_id)
);
desc emp;
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
| company_id | int          | YES  | MUL | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

insert into emp(
    Name,
    city,
    department,
    email,
    age,
    salary,
    company_id
)values('amit','satara','IT','amit@gmail.com',28,300000,103),
('sita','pune','sales','sita@gmail.com',22,22000,102),
('ram','chenni','IT','rem@gamil.com',25,28000,101),
('saurabh','thane','Account','saurabh@gmail.com',27,27000,101),
('rohan','mumbai','marketing',null,30,36000,102),
('rajat','vashi','IT',null,32,40000,103),
('ravi','haidrabad','marketing',null,32,40000,103),
('janvhi','satara','hr','janavhi@gamil.com',32,40000,103);
+----+---------+-----------+------------+-------------------+------+--------+------------+
| id | Name    | city      | department | email             | age  | salary | company_id |
+----+---------+-----------+------------+-------------------+------+--------+------------+
|  1 | amit    | satara    | IT         | amit@gmail.com    |   28 | 300000 |        103 |
|  2 | sita    | pune      | sales      | sita@gmail.com    |   22 |  22000 |        102 |
|  3 | ram     | chenni    | IT         | rem@gamil.com     |   25 |  28000 |        101 |
|  4 | saurabh | thane     | Account    | saurabh@gmail.com |   27 |  27000 |        101 |
|  5 | rohan   | mumbai    | marketing  | NULL              |   30 |  36000 |        102 |
|  6 | rajat   | vashi     | IT         | NULL              |   32 |  40000 |        103 |
|  7 | ravi    | haidrabad | marketing  | NULL              |   32 |  40000 |        103 |
|  8 | janvhi  | satara    | hr         | janavhi@gamil.com |   32 |  40000 |        103 |
+----+---------+-----------+------------+-------------------+------+--------+------------+

select * from company;

select * from company Join emp on company.c_id = emp.company_id;
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
| c_id | company_name | found_year | founder      | location | emp_id | Name    | city      | department | email             | age  | salary | company_id |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      3 | ram     | chenni    | IT         | rem@gamil.com     |   25 |  28000 |        101 |
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      4 | saurabh | thane     | Account    | saurabh@gmail.com |   27 |  27000 |        101 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      2 | sita    | pune      | sales      | sita@gmail.com    |   22 |  22000 |        102 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      5 | rohan   | mumbai    | marketing  | NULL              |   30 |  36000 |        102 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      1 | amit    | satara    | IT         | amit@gmail.com    |   28 | 300000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      6 | rajat   | vashi     | IT         | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      7 | ravi    | haidrabad | marketing  | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      8 | janvhi  | satara    | hr         | janavhi@gamil.com |   32 |  40000 |        103 |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+

select * from company left Join emp on company.c_id = emp.company_id;

+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
| c_id | company_name | found_year | founder      | location | emp_id | Name    | city      | department | email             | age  | salary | company_id |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      3 | ram     | chenni    | IT         | rem@gamil.com     |   25 |  28000 |        101 |
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      4 | saurabh | thane     | Account    | saurabh@gmail.com |   27 |  27000 |        101 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      2 | sita    | pune      | sales      | sita@gmail.com    |   22 |  22000 |        102 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      5 | rohan   | mumbai    | marketing  | NULL              |   30 |  36000 |        102 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      1 | amit    | satara    | IT         | amit@gmail.com    |   28 | 300000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      6 | rajat   | vashi     | IT         | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      7 | ravi    | haidrabad | marketing  | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      8 | janvhi  | satara    | hr         | janavhi@gamil.com |   32 |  40000 |        103 |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+

select * from company right Join emp on company.c_id = emp.company_id;

+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
| c_id | company_name | found_year | founder      | location | emp_id | Name    | city      | department | email             | age  | salary | company_id |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      1 | amit    | satara    | IT         | amit@gmail.com    |   28 | 300000 |        103 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      2 | sita    | pune      | sales      | sita@gmail.com    |   22 |  22000 |        102 |
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      3 | ram     | chenni    | IT         | rem@gamil.com     |   25 |  28000 |        101 |
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      4 | saurabh | thane     | Account    | saurabh@gmail.com |   27 |  27000 |        101 |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |      5 | rohan   | mumbai    | marketing  | NULL              |   30 |  36000 |        102 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      6 | rajat   | vashi     | IT         | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      7 | ravi    | haidrabad | marketing  | NULL              |   32 |  40000 |        103 |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |      8 | janvhi  | satara    | hr         | janavhi@gamil.com |   32 |  40000 |        103 |
+------+--------------+------------+--------------+----------+--------+---------+-----------+------------+-------------------+------+--------+------------+

select * from company Join emp on company.c_id = emp.company_id where c_id=101;

+------+--------------+------------+--------------+----------+--------+---------+--------+------------+-------------------+------+--------+------------+
| c_id | company_name | found_year | founder      | location | emp_id | Name    | city   | department | email             | age  | salary | company_id |
+------+--------------+------------+--------------+----------+--------+---------+--------+------------+-------------------+------+--------+------------+
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      3 | ram     | chenni | IT         | rem@gamil.com     |   25 |  28000 |        101 |
|  101 | infosys      |       1995 | Sudha Murthy | pune     |      4 | saurabh | thane  | Account    | saurabh@gmail.com |   27 |  27000 |        101 |
+------+--------------+------------+--------------+----------+--------+---------+--------+------------+-------------------+------+--------+------------+

select company_name,city,department,salary from company Join emp on company.c_id = emp.company_id where salary>50000;

+--------------+--------+------------+--------+
| company_name | city   | department | salary |
+--------------+--------+------------+--------+
| Capgemini    | satara | IT         | 300000 |
+--------------+--------+------------+--------+

select distinct c_id,company_name,department from company Join emp on company.c_id = emp.company_id;

+------+--------------+------------+
|  101 | infosys      | IT         |
|  101 | infosys      | Account    |
|  102 | TCS          | sales      |
|  102 | TCS          | marketing  |
|  103 | Capgemini    | IT         |
|  103 | Capgemini    | marketing  |
|  103 | Capgemini    | hr         |
+------+--------------+------------+

select distinct company_name from company Join emp on company.c_id = emp.company_id;

+--------------+
| company_name |
+--------------+
| infosys      |
| TCS          |
| Capgemini    |
+--------------+