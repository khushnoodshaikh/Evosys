--####################
--CREATING TABLES
--#####################

create table authors
(
id NUMBER(2) CONSTRAINT pk_authors_id PRIMARY KEY,
first_name VARCHAR2(2000),
last_name VARCHAR2(2000)
);

---------

create table editors
(
id NUMBER(2) CONSTRAINT pk_editors_id PRIMARY KEY,
first_name VARCHAR2(2000),
last_name VARCHAR2(2000)
);

-----------

create table translators
(
id NUMBER(2) CONSTRAINT pk_translators_id PRIMARY KEY,
first_name VARCHAR2(2000),
last_name VARCHAR2(2000)
);

------------

create table books
(
id NUMBER(2) CONSTRAINT pk_books_id PRIMARY KEY,
title VARCHAR2(2000),
type VARCHAR2(2000),
author_id NUMBER(2) CONSTRAINT fk_books_author_id REFERENCES authors,
editor_id NUMBER(2) CONSTRAINT fk_books_editor_id REFERENCES editors,
translator_id NUMBER(2) CONSTRAINT fk_books_translator_id REFERENCES translators
);

--#############################
--INSERTING VALUES
--############################

INSERT INTO authors VALUES(11,'Ellen','Writer');
INSERT INTO authors VALUES(12,'Olga','Savelieva');
INSERT INTO authors VALUES(13,'Jack','Smart');
INSERT INTO authors VALUES(14,'Donald','Brain');
INSERT INTO authors VALUES(15,'Yao','Dou');

----------------

INSERT INTO editors VALUES(21,'Daniel','Brown');
INSERT INTO editors VALUES(22,'Mark','Johnson');
INSERT INTO editors VALUES(23,'Maria','Evans');
INSERT INTO editors VALUES(24,'Cathrine','Roberts');
INSERT INTO editors VALUES(25,'Sebastian','Wright');
INSERT INTO editors VALUES(26,'Barbara','Jones');
INSERT INTO editors VALUES(27,'Matthew','Smith');

------------

INSERT INTO translators VALUES(31,'Ira','Davies');
INSERT INTO translators VALUES(32,'Ling','Weng');
INSERT INTO translators VALUES(33,'Kristian','Green');
INSERT INTO translators VALUES(34,'Roman','Edwards');

--------

INSERT INTO books VALUES(1,'Time to Grow Up!','original',11,21,NULL);
INSERT INTO books VALUES(2,'Your Trip','translated',15,22,32);
INSERT INTO books VALUES(3,'Lovely Love','original',14,24,NULL);
INSERT INTO books VALUES(4,'Dream Your Life','original',11,24,NULL);
INSERT INTO books VALUES(5,'Oranges','translated',12,25,31);
INSERT INTO books VALUES(6,'Your Happy Life','translated',15,22,33);
INSERT INTO books VALUES(7,'Applied AI','translated',13,23,34);

--#################
--INNER JOIN
--to show book titles along with their authors
--####################

SELECT b.id,b.title,b.type,a.first_name,a.last_name
FROM books b
INNER JOIN authors a
ON b.author_id=a.id;

-------
--displaying books along with their translators
---------
SELECT b.id, b.title, t.first_name, t.last_name
FROM books b
INNER JOIN translators t
ON b.translator_id = t.id;

--#######################
--LEFT JOIN
-- display information about each book’s author and translator (i.e., their last names).
--#######################

SELECT b.id,b.title,a.first_name author_firstname,t.last_name translator_lastname
FROM books b
LEFT JOIN authors a
ON b.author_id=a.id
LEFT JOIN translators t
ON b.translator_id=t.id;

----------
-- to show the basic book information (i.e., ID and title) along with the last names of the corresponding editors.
---------

SELECT b.id,b.title,e.last_name
FROM books b
LEFT JOIN editors e
ON b.editor_id=e.id;

--################
--RIGHT JOIN
--to show the basic book information (i.e., ID and title) along with the last names of the corresponding editors.
--###############

SELECT b.id,b.title,e.last_name
FROM books b
RIGHT JOIN editors e
ON b.editor_id=e.id;

--####################
--FULL JOIN
--to show the basic book information (i.e., ID and title) along with the last names of the corresponding editors.
--###################

SELECT b.id,b.title,e.last_name
FROM books b
FULL JOIN editors e
ON b.editor_id=e.id;

--------------
--we want to join all four tables to get information about all of the books, authors, editors, and translators in one table
------------

SELECT b.id,b.title,e.first_name editors_fname,t.first_name translator_fname,a.first_name author_fname
FROM books b
FULL JOIN editors e
ON b.editor_id=e.id
FULL JOIN translators t
ON b.translator_id=t.id
FULL JOIN authors a
ON b.author_id=a.id;
