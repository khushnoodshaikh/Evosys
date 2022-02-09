--###############
--CREATING VIEW
--###############

CREATE VIEW employee_yos AS
SELECT
    employee_id,
    first_name || ' ' || last_name full_name,
    FLOOR( months_between( CURRENT_DATE, hiredate )/ 12 ) yos
FROM
    employees;
    
----------------

SELECT
    *
FROM
    employee_yos
WHERE
    yos = 6
ORDER BY
    full_name;
    
--####################
--WITH READ ONLY
--####################

CREATE OR REPLACE VIEW customer_credits(
        customer_id,
        name,
        credit
    ) AS 
SELECT
        customer_id,
        name,
        credit_limit
    FROM
        customers WITH READ ONLY;
        
--##################
--JOIN WITH VIEWS
--###################

CREATE OR REPLACE VIEW backlogs AS
SELECT
    product_name,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR,
    SUM( quantity * unit_price ) amount
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN products
        USING(product_id)
WHERE
    status = 'Pending'
GROUP BY
    EXTRACT(
        YEAR
    FROM
        order_date
    ),
    product_name;


commit;