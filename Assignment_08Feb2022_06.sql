--######################
--CREATING VIEW
--#######################

CREATE VIEW salesman AS 
SELECT
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative';

---------------

SELECT
    *
FROM
    salesman;

----------------

CREATE VIEW salesman_contacts AS 
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    salesman;

---------

SELECT
    *
FROM
    salesman_contacts;

--###########
--DROP VIEW
--###############

DROP VIEW salesman;

--##################
--CHECKING FOR DEPENDENT VIEW
--###############

SELECT
    object_name,
    status
FROM
    user_objects
WHERE
    object_type = 'VIEW'
    AND object_name = 'SALESMAN_CONTACTS';

-----------

DROP VIEW salesman_contacts;

commit;