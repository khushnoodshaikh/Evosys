--###########
--CREATING TABLES
--#############

CREATE TABLE brands(
	brand_id NUMBER CONSTRAINT pk_brands_brandid PRIMARY KEY,
	brand_name VARCHAR2(50) NOT NULL
);

CREATE TABLE cars (
	car_id NUMBER,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

--########################
--INSERING VALUES
--##########################

INSERT INTO brands
VALUES(1,'Audi');

INSERT INTO brands
VALUES(2,'BMW');

INSERT INTO brands
VALUES(3,'Ford');

INSERT INTO brands
VALUES(4,'Honda');

INSERT INTO brands
VALUES(5,'Toyota');

INSERT INTO cars 
VALUES(1,'Audi R8 Coupe',1);

INSERT INTO cars
VALUES(2,'Audi Q2',1);

INSERT INTO cars
VALUES(3,'Audi S1',1);

INSERT INTO cars
VALUES(4,'BMW 2-serie Cabrio',2);

INSERT INTO cars
VALUES(5,'BMW i8',2);

INSERT INTO cars
VALUES(6,'Ford Edge',3);

INSERT INTO cars 
VALUES(7,'Ford Mustang Fastback',3);

INSERT INTO cars
VALUES(8,'Honda S2000',4);

INSERT INTO cars
VALUES(9,'Honda Legend',4);

INSERT INTO cars 
VALUES(10,'Toyota GT86',5);

INSERT INTO cars
VALUES(11,'Toyota C-HR',5);

--###########################

SELECT
	*
FROM
	brands;

---------

SELECT
	*
FROM
	cars;

--###############
--CREATING VIEWS
--################

CREATE VIEW audi_cars AS 
SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 1;

-----

SELECT
    *
FROM
    audi_cars;

-----------

INSERT
    INTO
        audi_cars(
            car_id,car_name,
            brand_id
        )
    VALUES(
        12,'BMW Z3 coupe',
        2
    ); 
    
------------

UPDATE
    audi_cars
SET
    car_name = 'BMW 1-serie Coupe',
    brand_id = 2
WHERE
    car_id = 3;

---------

SELECT
    *
FROM
    audi_cars;

----------------------
--###################

CREATE VIEW ford_cars AS 
SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 3 WITH CHECK OPTION;
        
-------

INSERT INTO
        ford_cars(
            car_id,car_name,
            brand_id
        )
    VALUES(
        13,'Audi RS6 Avant',
        1
    );

-----------

UPDATE
    ford_cars
SET
    brand_id = 4,
    car_name = 'Honda NSX'
WHERE
    car_id = 6;




