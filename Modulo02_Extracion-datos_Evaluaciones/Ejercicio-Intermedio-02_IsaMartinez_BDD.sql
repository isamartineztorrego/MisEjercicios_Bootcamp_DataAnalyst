-- Parte 3. Diseño de una base de datos en SQL

CREATE SCHEMA Ejercicio_Intermedio_02;
USE Ejercicio_Intermedio_02;

CREATE TABLE rutas(
id_ruta INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL UNIQUE,
donde VARCHAR (75) NOT NULL,
tipo ENUM('circular', 'ida', 'ida y vuleta'),
duracion TIME,
km FLOAT,
dificultad ENUM('baja, dependerá de la estación del año', 'media, Dependerá de la estación del año', 'alta, Dependerá de la estación del año'),
esfuerzo ENUM('bajo', 'bajo-medio', 'medio', 'medio-alto', 'alto'),
descripcion TEXT,
PRIMARY KEY (id_ruta)
);

CREATE TABLE aemet(
id_registro INT NOT NULL AUTO_INCREMENT,
temp_maxima TINYINT,
temp_minima TINYINT,
sierra VARCHAR(50),
fecha DATE,
PRIMARY KEY (id_registro)
);