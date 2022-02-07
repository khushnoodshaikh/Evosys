--#########################
--JOINS
--#########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;
    
 -----

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
JOIN
    order_items o
ON
    p.product_id=o.product_id
JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
--##########################
--RIGHT JOIN
--##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
RIGHT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------


SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
RIGHT JOIN
    order_items o
ON
    p.product_id=o.product_id
RIGHT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
--##########################
--LEFT JOIN
--##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

---------------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
LEFT JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
      
--##########################
--FULL OUTER JOIN
--##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
FULL OUTER JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
FULL OUTER JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
  
    
--##########################
--SELF JOIN
--##########################

SELECT 
    e1.employee_id,e1.first_name,e1.email,e2.manager_id
FROM
    employees e1
JOIN 
    employees e2
ON
    e1.employee_id=e2.manager_id


    
--##########################
--CROSS JOIN
--##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
 CROSS JOIN
    orders o
ORDER BY
    order_date;
    
-------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
CROSS JOIN
    order_items o, inventories i
ORDER BY
    p.product_id;
  
--#######################
--ANY
--#######################

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > ANY(
        2200,
        2259.99,
        2269.99
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
--#####################
--ALL
--#####################

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price <= ALL(
        977.99,
        1000,
        2200
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
---------------

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price >= ALL(
        1000,
        1500,
        2200
    )
    AND category_id = 1