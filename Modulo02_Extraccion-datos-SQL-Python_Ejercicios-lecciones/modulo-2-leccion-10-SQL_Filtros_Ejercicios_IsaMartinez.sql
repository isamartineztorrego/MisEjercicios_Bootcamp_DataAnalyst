USE tienda;
-- Apuntes y ejercicios lección 10 FILTROS
-- UNION: une 2 consultas y elimina filas duplicadas.
-- UNION ALL: une 2 consultas y mantiene las filas duplicadas.
-- IN(INTERSECT): parecido al OR pero más práctico
-- NOT IN (EXCEPT)
-- LIKE y NOT LIKE: busca por patrones, 'algo similar a'
-- Puedo usar un LIKE para buscar por una palabra concreta y también puedo concatenarlo con un OR o AND
SELECT * FROM customers
WHERE contact_last_name LIKE 'King';

SELECT * FROM customers
WHERE contact_last_name LIKE 'King' OR contact_last_name LIKE 'Lee';
-- ^^^esto sería más práctico hacerlo con un IN --> WHERE contact_last_name IN ('King', 'Lee')
-- REGEX
-- CONCAT(): para unir dos columnas en una
SELECT CONCAT(first_name, ' ', last_name) AS NombreCompleto
FROM employees
WHERE first_name LIKE'A%' OR last_name LIKE 'A%';

-- 1. Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.
-- Puedo poner el AS Apellidos en ambos SELECT o sólo en el primero (pero no sólo en el segundo)
SELECT last_name AS Apellidos
FROM employees
UNION
SELECT contact_last_name
FROM customers;

-- 2. Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.
SELECT first_name AS Nombres, last_name AS Apellidos
FROM employees
UNION
SELECT contact_first_name, contact_last_name
FROM customers;

-- 3. Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.
SELECT first_name AS Nombres, last_name AS Apellidos
FROM employees
UNION ALL
SELECT contact_first_name, contact_last_name
FROM customers;

-- 4. Queremos ver ahora el employee_number como 'Número empleado', first_n_ame como 'nombre Empleado' y last_name como 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.
SELECT employee_number AS 'Número Empleado', first_name AS 'Nombre Empleado', last_name AS 'Apellido Empleado'
FROM employees
WHERE employee_number IN (1002, 1076, 1088, 1612);

-- 5. Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.
SELECT city, customer_name AS 'nombre de la empresa', country
FROM customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

-- 6. Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.
SELECT customer_name, city
FROM customers
WHERE city LIKE '%on';

-- 7. Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.
SELECT customer_name, city
FROM customers
WHERE city LIKE '__on%';

-- 8. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).
SELECT customer_name, address_line1
FROM customers
WHERE address_line1 LIKE '%3%';

-- 9. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%' AND city NOT LIKE 'T%';

-- 10. Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 REGEXP '[0-9]';
