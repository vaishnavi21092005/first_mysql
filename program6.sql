DELIMITER //

CREATE PROCEDURE getAllEmp()
BEGIN
    SELECT * FROM company;
END //

DELIMITER ;

CALL getAllEmp();
+------+--------------+------------+--------------+----------+
| c_id | company_name | found_year | founder      | location |
+------+--------------+------------+--------------+----------+
|  101 | infosys      |       1995 | Sudha Murthy | pune     |
|  102 | TCS          |       1968 | Ratan Tata   | Mumbai   |
|  103 | Capgemini    |       1967 | Serge Kampf  | France   |
+------+--------------+------------+--------------+----------+

DELIMITER //

CREATE PROCEDURE getEmpbyId(in id int)
BEGIN
    SELECT * FROM company
    where c_id=id;
END //

DELIMITER ;

call getEmpbyId(102);
+------+--------------+------------+------------+----------+
| c_id | company_name | found_year | founder    | location |
+------+--------------+------------+------------+----------+
|  102 | TCS          |       1968 | Ratan Tata | Mumbai   |
+------+--------------+------------+------------+----------+
call getEmpbyId(103);
+------+--------------+------------+-------------+----------+
| c_id | company_name | found_year | founder     | location |
+------+--------------+------------+-------------+----------+
|  103 | Capgemini    |       1967 | Serge Kampf | France   |
+------+--------------+------------+-------------+----------+

SHOW PROCEDURE STATUS;
all procedure which are predefined and databases.

show procedure status 
where database="infosys";
---------+
| Db      | Name       | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+---------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| infosys | getAllEmp  | PROCEDURE | root@localhost | 2026-09-07 23:26:29 | 2026-09-07 23:26:29 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| infosys | getEmpbyId | PROCEDURE | root@localhost | 2026-09-07 23:28:44 | 2026-09-07 23:28:44 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+---------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+


show create procedure
getAllEmp;
+-----------+-----------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Procedure | sql_mode                                                                                                              | Create Procedure                                                                               | character_set_client | collation_connection | Database Collation |
+-----------+-----------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| getAllEmp | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllEmp`()
BEGIN
    SELECT * FROM company;
END | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+-----------+-----------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
