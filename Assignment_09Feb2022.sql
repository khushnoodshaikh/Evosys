--####################
--CREATING INDEX
--######################

SELECT first_name FROM employees WHERE first_name LIKE 'S%';

CREATE INDEX i_employees_firstname
ON employees(first_name);

-------------

SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'employees';
    
-------------

EXPLAIN PLAN FOR
SELECT * FROM employees WHERE first_name LIKE 'S%';

-----------

SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());

--#######################
--REMOVING INDEX
--#########################

DROP INDEX i_employees_firstname;

--####################
--CREATING UNIQUE INDEX
--###################

CREATE UNIQUE INDEX ui_employees_lastname
ON employees(last_name);







