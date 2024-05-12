USE tienda;
-- Apuntes y ejercicios lección 11 Subconsultas
-- Link vídeo ANY/ALL: https://www.youtube.com/watch?v=Aj5SVVRRhOk
-- Link vídeo EXISTS/NOT EXISTS: https://www.youtube.com/watch?v=G8VUzPF14Xw
-- Link vídeo SUBCONSULTAS CORRELACIONADAS: https://www.youtube.com/watch?v=FQ0mPp_ueNw

-- Ejemplos
-- E1. Quiero sacar el cliente cuyo id sea 103
SELECT customer_number, customer_name
FROM customers
WHERE customer_number = 103;
-- dan el mismo resultado
SELECT customer_number, customer_name
FROM customers
WHERE customer_number IN(
	SELECT customer_number
    FROM orders
    WHERE customer_number = 103);
    
-- E2.1 Quiero sacar los productos cuyo precio sea superior a la media
SELECT product_name, product_line, buy_price
FROM products
WHERE buy_price > (SELECT AVG(buy_price) FROM products);

-- E2.2 Quiero sacar el valor medio de cada product_line
SELECT AVG(buy_price), product_line
FROM products
GROUP BY product_line;

-- E2.3 Quiero sacar los productos cuyo precio sea superior a la media de su product_line
SELECT *
FROM products AS p1
WHERE buy_price > (SELECT AVG(buy_price) FROM products AS p2
					WHERE p1.product_line = p2.product_line);

-- E3. Quiero sacar aquellos clientes (de todo el mundo) cuyo crédito sea mayor a la media de UK
SELECT *
FROM customers
WHERE credit_limit >
	(SELECT AVG(credit_limit)
    FROM customers
    WHERE country = 'UK');

-- E.4 Quieros sacar aquellos clientes de USA, cuyo crédito sea mayor a la media de UK.alter
SELECT *
FROM customers
WHERE credit_limit >
	(SELECT AVG(credit_limit)
    FROM customers
    WHERE country = 'UK')
AND country = 'USA';




-- EJERCICIOS
-- Ejercicio 1. Calcula el numero de clientes por cada ciudad.
-- No hace falta subquery
SELECT city, COUNT(DISTINCT customer_number) AS numero_clientes
FROM customers
GROUP BY city;

-- Ejercicio 2.Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.
SELECT city, COUNT(customer_number)
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL 
	(SELECT COUNT(DISTINCT customer_number) AS clientes_por_ciudad
	FROM customers
	GROUP BY city)
LIMIT 1;

-- Ejercicio 3. Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.
SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN
	(SELECT city
	FROM customers
	GROUP BY city
	HAVING COUNT(DISTINCT customer_number) >= ALL
		(SELECT COUNT(DISTINCT customer_number) AS cantidad_clientes
		FROM customers
		GROUP BY city)
	);

/* Ejercicio 4.Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes.
Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'*/

SELECT employee_number AS 'Número empleado', first_name AS 'Nombre empleado', last_name AS 'Apellido empleado'
FROM employees
WHERE employee_number IN
	(SELECT sales_rep_employee_number
    FROM customers);

/* Ejercicio 5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no tiene una oficina de nuestra empresa para ello:
Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers,
que no tengan una oficina en dicha ciudad de la tabla offices.*/
SELECT city AS ciudad, customer_name AS 'nombre de la empresa'
FROM customers
WHERE city NOT IN
	(SELECT city
    FROM offices);
-- Estas dos opciones llegan al mismo resultado
SELECT city AS "ciudad", customer_name AS "nombre de la empresa"
FROM customers
WHERE NOT EXISTS
	(SELECT city
    FROM offices
    WHERE customers.city = offices.city);
