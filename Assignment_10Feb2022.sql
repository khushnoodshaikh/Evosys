--#################
--SYNONYM
--################

CREATE SYNONYM users
FOR customers;

select name from users;

DROP SYNONYM users;

CREATE PUBLIC SYNONYM users
FOR customers;

select name from users;

DROP PUBLIC SYNONYM users;

--############################
--SEQUENCE
--############################

CREATE SEQUENCE id_seq
    INCREMENT BY 10
    START WITH 10
    MINVALUE 10
    MAXVALUE 100
    CYCLE
    CACHE 2;

SELECT 
    id_seq.NEXTVAL 
FROM 
    dual;
    
CREATE SEQUENCE invoice_seq
    START WITH 2022;

ALTER SEQUENCE invoice_seq
CACHE 10;

DROP SEQUENCE invoice_seq;

--#########################
--ROLES
--##########################

CREATE ROLES mdm;


GRANT SELECT, INSERT, UPDATE, DELETE
ON products
TO mdm;

SET ROLE mdm;

DROP ROLE mdm;

