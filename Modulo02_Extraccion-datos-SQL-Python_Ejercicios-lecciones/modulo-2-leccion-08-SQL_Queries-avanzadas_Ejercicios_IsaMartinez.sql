-- En este ejercicio vamos a usar una tabla ya creada llamada customers (clientes/as), que está en la base de datos tienda.

CREATE SCHEMA ejercicios_leccion08;
USE tienda;

/*  Ejemplo combinado con SUM
Seleciona el product_name, sumanado los buy_price, dale el nombre suma_precio, y agrúpalo por product_name*/
SELECT product_name, SUM(buy_price) AS suma_precio
FROM products
GROUP BY product_name;

-- 1. Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
SELECT MIN(customer_number)
FROM customers;
-- Mismo caso pero me traigo también el nombre del producto
SELECT customer_name, customer_number
FROM customers
WHERE customer_number = (SELECT MIN(customer_number) FROM customers);

-- 2. Selecciona el limite de crédito medio para los clientes de España.
SELECT AVG(credit_limit) AS credito_medio
FROM customers;

-- 3. Selecciona el numero de clientes en Francia.
SELECT COUNT(country) AS customers_from_france
FROM customers
WHERE country='France';

-- 4. Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.
SELECT MAX(credit_limit)
FROM customers
WHERE sales_rep_employee_number = 1323;

-- 5. ¿Cuál es el número máximo de empleado de la tabla customers?
SELECT MAX(sales_rep_employee_number)
FROM customers;

-- 6. Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
SELECT sales_rep_employee_number, COUNT(customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- 7. Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.
SELECT sales_rep_employee_number
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(customer_number) >7;

-- 8. Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.
SELECT sales_rep_employee_number, COUNT(customer_number) AS AltoRendimiento
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(customer_number)>7;

-- 9. Selecciona el número de clientes en cada pais.
SELECT country, COUNT(customer_number)
FROM customers
GROUP BY country;

-- 10. Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT country, COUNT(city)
FROM customers
GROUP BY country
HAVING COUNT(city)>3;

-- Ejemplo de uso de CASE
-- Si el precio es menor de 20 en bajo, si es mayor de 40 es alto
SELECT buy_price,
CASE
	WHEN buy_price < 20 THEN 'bajo'
    WHEN buy_price >40 THEN 'alto'
    ELSE 'medio'
	END AS rango_buy_price -- hace falta este END AS porque va a 'crear' una nueva columna y hay que decirle qué nombre le damos
FROM products;