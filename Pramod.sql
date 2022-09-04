CREATE DATABASE Pramod;
USE Pramod;

/*Create table for student*/
CREATE TABLE STUDENT (
	Enrollment_NO int, 
	Name varchar(40), 
	State varchar(50), 
	DOB date
    );
    
    /*Create table for emplyoee*/
CREATE TABLE EMP (
	EMPNO int, 
	ENAME varchar(35), 
	JOB varchar(35), 
	MGR varchar(30), 
	HIREDATE date, 
	SAL int, 
	COMM int,
	DEPTNO int
	);
    
    /*create table for Department*/
CREATE TABLE DEPT (
	DEPTNO int, 
	DNAME varchar(50), 
	LOC varchar(20)
	);
    
    /*create table for salgrade */
CREATE TABLE SALGRADE (
	GRADE int, 
	LOSAL int, 
	HISAL int
	);

/*Adding the columns in Dept table*/
ALTER TABLE DEPT
ADD COLUMN NoOfEmplyoees INT;

/*Modify datatype*/
ALTER TABLE DEPT
MODIFY COLUMN NoOfEmplyoees VARCHAR(30);

/*delete the column*/
ALTER TABLE DEPT
DROP COLUMN NoOfEmplyoees;

/*drop the salgrade table*/
DROP TABLE SALGRADE;

/*Insert data into DEPt table*/
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES (10,'Accounting', 'New York'),(20,'Research','Dallas'),(30, 'Sales','Chicago'),(40,'operations','Boston');

/*insert data into emp table*/
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7369,'Smith', 'Clerk', 7902, '1989-12-17', 800, NULL, 20),
		(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600, 300,30),
		(7521,'Ward', 'Salesman', 7698,'1981-02-22', 1250,500,30),
		(7566,'Jones','Manager',7839,'1981-04-02',2975,NULL, 20),
		(7654,'MARTIN','Salesman',7698,'1981-09-28',1250,1400,30),
		(7698,'Blake','Manager',7839,'1981-05-01',2850,NULL,30),
		(7782,'Clark','Manager',7839,'1981-06-09',2450, NULL, 30),
		(7788,'Scott','analyst',7566,'1982-12-09',3000,NULL,20),
		(7839,'King','President',NULL, '1981-11-17',5000,NULL, 10),
		(7844,'Turner','Salesman',7698,'1981-10-08', 1500, 0,30),
		(7876,'Adams','Clerk',7788,'1983-01-12',1100,NULL,20),
		(7900,'James','Clerk',7698,'1981-12-03',950,NULL,30),
		(7902,'Ford','Analyst',7566,'1981-12-03',3000,NULL, 20),
		(7934,'Miller','Clerk',7782,'1982-01-23',1300,NULL,10);
      
      /*select all data from dept table*/
SELECT * FROM DEPT;

/*where clause*/
SELECT DNAME FROM DEPT
WHERE DEPTNO = 40;

/*select all info from department where name is sales*/
SELECT * FROM DEPT
WHERE DNAME = 'Sales';

SELECT * FROM EMP;

/*and command use for true condition ONLY*/
SELECT * FROM EMP
WHERE EMPNO=7566
AND ENAME = 'Jones';

/*in descending odrder*/
SELECT SAL FROM EMP
ORDER BY SAL DESC;

SELECT * FROM EMP
WHERE EMPNO = 7788
OR JOB = 'President';

/*display all the unique job title from emplyoee table*/
SELECT DISTINCT JOB
FROM EMP;  

/*DISPLAY the unique deptno from emp table*/
SELECT DISTINCT DEPTNO 
FROM EMP;

/*LIMIT CLUASE or top cluase display top 7 records from emp table*/
SELECT EMPNO
FROM EMP 
LIMIT 7;

/*Display 3 lowest salary from emp table*/
SELECT SAL
FROM EMP
ORDER BY SAL 
LIMIT 3;

/*display name of employee whose name starts with S*/
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';

/*display name and job title of emplyoee whose job ends with T*/
SELECT ENAME, JOB FROM EMP
WHERE JOB LIKE '%T';

/*update command*/
SET SQL_SAFE_UPDATES=0;  /*To fix the bug for safe mode in mysql workbench*/
UPDATE EMP SET JOB = 'Vice President' WHERE EMPNO = 7839;
SELECT * FROM EMP;

/*display name of emplyoees whose job title is president */
SELECT ENAME FROM EMP
WHERE JOB = 'President';

/*display name of emplyoees in alphabetically order*/
SELECT ENAME 
FROM EMP
ORDER BY ENAME ASC;

/*display name of emplyoees whose name starts with S and person job titile is analyst*/
SELECT ENAME,JOB FROM EMP
WHERE ENAME LIKE 'S%'
AND JOB = 'Analyst';

/*display compete info of emplyoees whose job iseither manager or analyst*/
SELECT * FROM EMP
WHERE JOB = 'Manager'
OR JOB = 'Analyst';

/*display unique job title available in organization*/
SELECT DISTINCT JOB FROM EMP;

/*Display complete info of emplyoee whose salary is more than 1000 USD*/
SELECT * FROM EMP
WHERE SAL > 1000;

/* display compleete info eplyoees who is not president*/
SELECT * FROM EMP 
WHERE NOT JOB = 'President';

SELECT * FROM EMP
WHERE JOB != 'President';

SELECT * FROM EMP 
WHERE NOT JOB <> 'President';

/*Display all info of emplyoees where salary is in the range of 1000 to 2000 */
SELECT * FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;

/*Dispaly all the info of emplyoees who is not earning any commision */
SELECT * FROM EMP
WHERE COMM =0 OR COMM IS NULL;

/* display all info of emplyoees who is earning commnision and job is manager */
SELECT * FROM EMP
WHERE COMM IS NOT NULL
AND JOB = 'Manager';

/*for maximum value */
SELECT max(SAL) FROM EMP;

/*Alias command in table or change the column to highest salary in output */
SELECT max(SAL) AS Highest_Salary FROM EMP;

/*GROUP BY according to DEPTNO */ 
SELECT COUNT(EMPNO), DEPTNO FROM EMP
GROUP BY DEPTNO;

/*Display avg salary in department */
SELECT AVG(SAL), DEPTNO FROM EMP 
GROUP BY DEPTNO;

/*Display highestsalary accroding to job title */
SELECT MAX(SAL), JOB FROM EMP
GROUP BY JOB;

/*inner join example */
SELECT EMP.ENAME,EMP.JOB,DEPT. * FROM 
EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

/*SELECT EMP.ENAME, DEPT.DNAME FROM EMP FULL  JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO; */

/* full join is not applicable in mysql workbench */
SELECT EMP.*, DEPT.* FROM EMP FULL JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

/*left join */
SELECT EMP.*, DEPT.* FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

/*right join */
SELECT EMP.*,DEPT.* FROM EMP RIGHT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

/*display all name of empyoees along with department which department name they are working */
SELECT EMP.ENAME, DEPT.DNAME FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

/*display names of emplyoess and department name for only who is working at sales department */
SELECT EMP.ENAME, DEPT.DEPTNO FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO 
WHERE DNAME = 'Sales';

/*display name, sal, job title of empyoees who are working in chicago */
SELECT EMP.ENAME,SAL, JOB FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE LOC = 'Chicago';

/*display maximum salary of each department */
SELECT EMP.ENAME, max(SAL) FROM EMP FULL JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME;

/* having condition */
SELECT count(EMPNO),DEPTNO FROM EMP
GROUP BY DEPTNO
HAVING count(EMPNO) > 2;

/*display job title where average salary is more than 1000 usd */
SELECT avg(SAL),JOB FROM EMP
GROUP BY JOB
HAVING avg(SAL) > 1000;

CREATE TABLE DEPARTMENT(Did int, Dname  varchar(39));
INSERT INTO DEPARTMENT(Did, Dname) VALUES (10, 'Accounting'), (50, 'IT');

/*unin command */
select Dname, DEPTNO from DEPT
union
select Dname, Did from DEPARTMENT;

/*UNION ALL COMMAND */
select Dname, DEPTNO from DEPT
union all
select Dname, Did from DEPARTMENT;



