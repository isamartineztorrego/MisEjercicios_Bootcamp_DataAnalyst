CREATE SCHEMA ejercicios_leccion05;
USE ejercicios_leccion05;

-- LECCIÓN 2. CREACIÓN BBDD
/* Para comentarios multilínea, hay que cerrarlo!!!!! */

-- Ejercicio 1
CREATE TABLE empleadas(
id_empleada INT NOT NULL,
salario FLOAT,
nombre VARCHAR(50),
apellido VARCHAR(50),
pais VARCHAR(50)
);

-- Ejercicio 2
CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid'
);

CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad>16),
    ciudad varchar(255) DEFAULT 'Madrid'
);

-- Ejercicio 3
CREATE TABLE empleadas2(
id_empleada INT AUTO_INCREMENT,
salario FLOAT,
nombre VARCHAR(50),
apellido VARCHAR(50),
pais VARCHAR(50),
PRIMARY KEY (id_empleada)
);

CREATE TABLE empleadas_en_proyectos(
id_empleada INT NOT NULL,
id_proyecto INT NOT NULL,
PRIMARY KEY (id_proyecto),
FOREIGN KEY (id_empleada)
	REFERENCES empleadas2 (id_empleada)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);