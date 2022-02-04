--###################################################
-- 1. Display all the information of the EMP table?
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp;    
    
--###################################################
-- 2. Display unique Jobs from EMP table?
--###################################################

SELECT DISTINCT
    job
FROM
    emp;

--###################################################
-- 3. List the emps in the asc order of their Salaries?
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
ORDER BY
    sal;

--###################################################
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
ORDER BY
    deptno ASC, job DESC;

--###################################################
-- 5. Display all the unique job groups in the descending order?
--###################################################

SELECT DISTINCT 
    job
FROM 
    emp
ORDER BY 
    job DESC;

--###################################################
-- 6. Display all the details of all ‘Mgrs’
--###################################################

SELECT 
    mgr,empno,ename,job,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE
    mgr IN 
        (SELECT 
            mgr 
        FROM 
            emp 
        WHERE 
            mgr IS NOT NULL)
ORDER BY
    mgr;

--###################################################
-- 7. List the emps who joined before 1981
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE
    hiredate<'01-01-81';   

--###################################################
-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
--###################################################

SELECT 
    empno,ename,sal,(sal)/30 daily_sal
FROM
    emp
ORDER BY 
    sal*12;

--###################################################
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
--###################################################

SELECT 
    mgr,empno,ename,job,hiredate,MONTHS_BETWEEN(SYSDATE,hiredate) exp
FROM
    emp
WHERE
    mgr IS NOT NULL
ORDER BY 
    mgr;   

--###################################################
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
--###################################################

SELECT 
    empno,ename,sal,MONTHS_BETWEEN(SYSDATE,hiredate) exp
FROM
    emp
WHERE   
    mgr=7369;   

--###################################################
-- 11. Display all the details of the emps whose Comm  Is more than their Sal
--###################################################


SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    comm>sal;

--###################################################
-- 12. List the emps along with their Exp and Daily Sal is more than Rs 100
--###################################################

SELECT 
    empno,ename,job,sal,(sal)/30 AS daily_sal,MONTHS_BETWEEN(SYSDATE,hiredate) exp
FROM
    emp
WHERE 
    (sal)/30 > 100;

--###################################################
-- 13. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    job='CLERK' OR job='ANALYST'
ORDER BY
    job DESC;

--###################################################
-- 14. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
--###################################################

SELECT 
    empno,ename,job,hiredate
FROM
    emp
WHERE 
    hiredate IN ('01-05-1981','03-12-1981','17-12-1981','19-01-1980')
ORDER BY
    hiredate;

--###################################################
-- 15. List the emp who are working for the Deptno 10 or20
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    deptno IN (10,20)
ORDER BY
    deptno;

--###################################################
-- 16. List the emps who are joined in the year 81
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    TO_CHAR(hiredate,'yyyy')='1981';

--###################################################
-- 17. List the emps Who Annual sal ranging from 22000 and 45000
--###################################################

SELECT 
    empno,ename,job,sal,comm,sal*12 as annual_sal
FROM
    emp
WHERE
    sal*12 BETWEEN 22000 AND 45000;

--###################################################
-- 18. List the Enames those are having five characters in their Names
--###################################################

SELECT 
    empno,ename,job
FROM
    emp
WHERE
    ename LIKE '_____';

--###################################################
-- 19. List the Enames those are starting with ‘S’ and with five characters
--###################################################

SELECT 
    empno,ename,job
FROM
    emp
WHERE
    ename LIKE 'S____';

--###################################################
-- 20. List the emps those are having four chars and third character must be ‘r’
--###################################################

SELECT 
    empno,ename,job
FROM
    emp
WHERE
    ename LIKE '__R_';

--###################################################
-- 21. List the Five character names starting with ‘S’ and ending with ‘H’
--###################################################

SELECT 
    empno,ename,job
FROM
    emp
WHERE
    ename LIKE 'S___H';

--###################################################
-- 22. List the emps who joined in January
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE
    TO_CHAR(hiredate,'mon')='jan';

--###################################################
-- 23. List the emps whose names having a character set ‘ll’ together
--###################################################

SELECT
    empno,ename,job
FROM
    emp
WHERE   
    ename LIKE '%LL%';

--###################################################
-- 24. List the emps who does not belong to Deptno 20
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    deptno!=20
ORDER BY
    deptno ASC;

--###################################################
-- 25. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
--###################################################

SELECT 
    empno,ename,mgr,job,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    job!='PRESIDENT' AND empno NOT IN 
                                    (SELECT DISTINCT 
                                        mgr 
                                     FROM 
                                        emp 
                                     WHERE 
                                        mgr IS NOT NULL)
ORDER BY
    sal ASC;

--###################################################
-- 26. List the emps whose Empno not starting with digit78
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    empno NOT LIKE '78%'
ORDER BY
    empno;

--###################################################
-- 27. List the emps who are working under ‘MGR’
--###################################################

SELECT 
    mgr,empno,ename,job,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE
    mgr IN 
        (SELECT 
            mgr 
        FROM 
            emp 
        WHERE 
            mgr IS NOT NULL)
ORDER BY
    mgr;

--###################################################
-- 28. List the emps who joined in any year but not belongs to the month of March
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    TO_CHAR(hiredate,'mon')!='mar' AND hiredate IS NOT NULL;

--###################################################
-- 29. List all the Clerks of Deptno 20
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    job='CLERK' AND deptno=20;

--###################################################
-- 30. List the emps of Deptno 30 or 10 joined in the year 1981
--###################################################

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    deptno IN (10,30) AND TO_CHAR(hiredate,'yyyy')='1981'
ORDER BY
    deptno;

--###################################################
-- 31. Display the details of SMITH
--###################################################

SELECT 
    emp.empno,emp.ename,emp.job,emp.hiredate,emp.mgr,emp.sal,emp.comm,dept.deptno,dept.dname,branch.branchno,branch.branchname,branch.location
FROM
    emp,branch,dept
WHERE
    emp.branchno=branch.branchno AND emp.deptno=dept.deptno AND
    ename='SMITH' ;

--###################################################
-- 32. Display the location of SMITH
--###################################################

SELECT 
    emp.empno,emp.ename,branch.branchno,branch.location
FROM
    emp,branch
WHERE 
    emp.branchno=branch.branchno AND emp.ename='SMITH';

