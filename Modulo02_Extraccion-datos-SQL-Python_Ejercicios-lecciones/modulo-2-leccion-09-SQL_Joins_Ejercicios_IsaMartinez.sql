CREATE SCHEMA ejercicios_leccion09;
USE tienda;

-- Apuntes y ejercicios lección 09 UNIÓN TABLAS (JOINS)

-- CROSS JOIN: devuelve todas las combinaciones posibles

-- Ejercicio 1. Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.
-- Esta primera opción no devuelve una unión correcta, le atribuye a un único customer varios employees (sacado de ejercicios resueltos)
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees CROSS JOIN customers;

-- Esta segunda opción sí devuelve una unión correcta (comprobado con tablas dinámicas)
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

-- Ejercicio 2. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) >8;

-- Ejercicio 3. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees CROSS JOIN customers
WHERE employees.employee_number=customers.sales_rep_employee_number
GROUP BY customers.sales_rep_employee_number
HAVING COUNT(DISTINCT customers.country) >1;

-- NATURAL JOIN: compara dos columnas con el mismo nombre
SELECT products.product_code, products.product_name, order_details.order_number, order_details.product_code
FROM products NATURAL JOIN order_details;

SELECT customers.customer_number, customers.customer_name,  orders.customer_number
FROM customers NATURAL JOIN orders
WHERE customers.credit_limit > 200000;

-- INNER JOIN ON: combina columnas de diferente nombre

SELECT customers.customer_number, orders.order_date
FROM customers INNER JOIN orders
ON customers.customer_number = orders.order_date;

-- INNER JOIN USING: especificas la columna de unión porque tienen el mismo nombre

-- Ejercicio 4. Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Ejercicio 5. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees INNER JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- Ejercicio 6. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country) >1;

-- Ejercicio 7. Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).
-- Best option: Con un LEFT JOIN, devuelve los registros NULL de aquellos empleados que no tengan clientes asignados.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Con un CROSS JOIN WHERE, no devuelve los registros NULL, es decir, no me daría aquellos empleados que no tienen clientes asignados
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

-- Ejercicio 8. Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT customers.customer_number, employees.first_name, employees.last_name
FROM customers LEFT JOIN employees
ON customers.sales_rep_employee_number = employees.employee_number;

SELECT employees.employee_number, employees.first_name,  employees.last_name, customers.customer_number
FROM employees
RIGHT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Ejercicio 9. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) >8;
-- comprobación que es ok
select sales_rep_employee_number
from customers
group by sales_rep_employee_number
having count(customer_number) >8;

-- Ejercicio 10. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees RIGHT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING COUNT(DISTINCT customers.customer_number) >8;

-- Ejercicio 11. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING COUNT(DISTINCT customers.country) >1;

