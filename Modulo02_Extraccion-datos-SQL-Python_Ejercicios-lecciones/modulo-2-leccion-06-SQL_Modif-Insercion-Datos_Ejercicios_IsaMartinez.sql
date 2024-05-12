-- Ejercicios Lección 06 (parte 1)

CREATE SCHEMA ejercicios_leccion06;
USE ejercicios_leccion06;

CREATE TABLE t1 (a INTEGER, b CHAR(10));
-- 1. Renombra la tabla t1 a t2.
RENAME TABLE t1 TO T2;

-- 2. Cambia la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna).
ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

-- 3. Cambia la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Además, renombra la columna como c.
ALTER TABLE t2
MODIFY COLUMN b CHAR(20);
ALTER TABLE t2
RENAME COLUMN b TO c;

-- 4. Añade una nueva columna llamada d de tipo TIMESTAMP.
ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

-- 5. Elimina la columna c que definiste en el ejercicio 3.
ALTER TABLE t2
DROP COLUMN c;

-- 6. Crea una tabla llamada t3 idéntica a la tabla t2 (de manera automática, no definiéndola columna a columna).
CREATE TABLE t3 SELECT * FROM t2;

-- 7. Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.
DROP TABLE IF EXISTS t2;

RENAME TABLE t3 TO t1;

-- 8. De la BDD tienda, crea una copia de la tabla Customers, ya que vamos a modificar los datos originales de dicha tabla. Para ello ejecuta la siguiente sentencia:
CREATE TABLE copia_customers
SELECT * FROM tienda.customers;

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM copia_customers;

-- Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.
INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_Number, credit_limit)
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', ' Puerta 42', 'Madrid', 'España', 28000, 'España', 15, 20000000);

-- Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información. Fíjate que ahora no tenemos toda la información.
INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_Number, credit_limit)
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);

-- Introduce ahora 5 filas nuevas con la información que consideres relevante para los campos disponibles en una misma instrucción. Se recuerda que el Indice(=la clave primaria), no es necesaria especificarla. En 3 de las nuevas filas debes dejar vacio el campo 'contactFirstName'
INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_Number, credit_limit)
VALUES(345, 'Mi empresa', 'Martinez', 'Isa', '666111222', 'Mi calle', '3ºB', 'Vigo', 'Galicia', 36209, 'España', 26, 300000),
	(346, 'Tu empresa', 'Lopez', 'Pepa', '666222333', 'Tu calle', '4ºB', 'Vigo', 'Galicia', 36214, 'España', 26, 43574),
	(347, 'Su empresa', 'Martin', '', '666333444', 'Su calle', '5ºB', 'Vigo', 'Galicia', 36201, 'España', 26, 34537),
	(348, 'Nuestra empresa', 'Jimenez', '', '666444555', 'Nuestra calle', '6ºB', 'Vigo', 'Galicia', 36208, 'España', 13, 4535),
	(349, 'Vuestra empresa', 'Penedo',  '', '666555666', 'Vuestra calle', '7ºB', 'Vigo', 'Galicia', 36209, 'España', 11, 684684);

-- Actualiza ahora los datos faltantes correspondientes al CustomerName 'La pegatina After' con la siguiente información
UPDATE customers_mod
SET address_line1= 'Polígono Industrial de Son Castelló', address_line2= 'Nave 92', city='Palma de mallorca', state='España', postal_code=28123, country='España', sales_rep_employee_Number=25, credit_limit=500000
WHERE customer_name  = 'La pegatina After';

/* vamos a actualizar algunos de los cambios sin especificar la condición del WHERE.
Modifica los siguientes campos de
addressline1: Vamos
addressline2: a
postalcode: fastidiar
country: la tabla :)
no permite poner 'fastidiar' en postal_code porque tiene que ser un INTEGEER, así que pongo un número*/
UPDATE customers_destroy
SET address_line1 ='Vamos',
	address_line2 = 'a',
	postal_code = 12345,
    country = 'la tabla';
