CREATE DATABASE test_join;

CREATE TABLE departamentos (
	id INT,
	nombre VARCHAR(20)
);

CREATE TABLE empleados (
	nombre VARCHAR(20),
	departamentos INT
);

INSERT INTO departamentos 
VALUES
	(31, 'Sales'),
	(33, 'Engineering'),
	(34, 'Clerical'),
	(35, 'Marketing');

INSERT INTO empleados 
VALUES
	('Rafferty', 31),
	('Jones', 33),
	('Heisenberg', 33),
	('Robinson', 34),
	('Smith', 34),
	('Williams', NULL);

