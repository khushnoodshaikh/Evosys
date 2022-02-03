--######################
--DENSE_RANK
--######################

SELECT DENSE_RANK (31) WITHIN GROUP (ORDER BY quantity)rank_asc ,
DENSE_RANK (31) WITHIN GROUP (ORDER BY quantity DESC)rank_desc
FROM order_items;

----------

SELECT employee_id,first_name,hiredate,job_title,
DENSE_RANK() OVER(PARTITION BY TO_CHAR(hiredate,'mm') ORDER BY hiredate )
FROM employees;

--######################
--CREATE TABLE AS
--######################

CREATE TABLE emp1
AS (SELECT * 
    FROM employees 
    WHERE job_title='Sales Representative' );

------------

SELECT 
    employee_id,first_name,job_title 
FROM 
    emp1;
    
--#####################
--SUB QUERY
--#####################

SELECT 
    employee_id,first_name,hiredate
FROM
    employees
WHERE
    hiredate LIKE '17%';
    
------------------------

SELECT product_id,product_name,description
FROM 
    products
WHERE
    product_id IN(SELECT product_id FROM order_items WHERE unit_price=64099);

---------------------

SELECT product_id,product_name,description
FROM 
    products
WHERE
    product_id IN(SELECT product_id FROM order_items WHERE item_id=6);

COMMIT;