CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

-- Ejercicio 4
CREATE TABLE customers(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_nacimineto DATE NOT NULL,
PRIMARY KEY (id_cliente)
);

-- Ejercicio 5
CREATE TABLE employees(
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_nacimineto DATE NOT NULL,
puesto_ VARCHAR(50) NOT NULL,
PRIMARY KEY (id_empleado)
);


-- Ejercicio 6
CREATE TABLE empleados(
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_nacimineto DATE NOT NULL,
puesto_ VARCHAR(50) NOT NULL,
PRIMARY KEY (id_empleado)
);
CREATE TABLE clientes(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_nacimineto DATE NOT NULL,
comercial_asociado VARCHAR(50) NOT NULL,
PRIMARY KEY (id_cliente),
CONSTRAINT comercial_cliente
		FOREIGN KEY(comercial_asociado)
	REFERENCES empleados(id_empleado)
);

-- Ejercicio bonus: 
-- De la siguiente tabla origen crea las tablas y normalizaciones necesarias

CREATE TABLE tabla_origen(
id_pedido INT NOT NULL, 
id_cliente INT NOT NULL,
nombre_cliente VARCHAR(50),
id_articulo INT,
articulo_marca VARCHAR(100),
cantidad INT,
precio_unitario FLOAT
);

-- Creo tabla clientes
CREATE TABLE clientes_ejercicio_leccion01(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre_cliente VARCHAR(50),
apellido_cliente VARCHAR(50),
PRIMARY KEY (id_cliente)
);

-- Creo tabla productos
CREATE TABLE productos_ejercicio_leccion01(
id_articulo INT NOT NULL AUTO_INCREMENT,
articulo VARCHAR (50),
marca VARCHAR (50), 
precio_unitario FLOAT,
PRIMARY KEY (id_articulo)
);

-- Creo tabla pedidos
CREATE TABLE pedidos_ejercicio_leccion01(
id_pedido INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_articulo INT NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (id_pedido),
FOREIGN KEY (id_cliente) REFERENCES clientes_ejercicio_leccion01(id_cliente)
);






