--################
--CREATING VIEW
--################

CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;

--DELETING ROW FROM CARS_MASTER VIEW 

DELETE
FROM
    cars_master
WHERE
    car_id = 1;

------UPDATING VIEW

UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;

--INSERTING VALUE giving error

INSERT INTO cars_master
VALUES('Audi S1 Sportback');

--############
--CREATING UPDATEABLE JOIN VIEW
--#############

CREATE VIEW all_cars AS 
SELECT
    car_id,
    car_name,
    c.brand_id,
    brand_name
FROM
    cars c
INNER JOIN brands b ON
    b.brand_id = c.brand_id; 

---------

INSERT INTO all_cars(car_id,car_name, brand_id )
VALUES(13,'Audi A5 Cabriolet', 1);

-----------------

SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';

