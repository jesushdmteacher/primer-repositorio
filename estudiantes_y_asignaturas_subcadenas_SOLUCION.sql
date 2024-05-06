CREATE DATABASE estudiantes_y_asignaturas_alter;
GO
USE estudiantes_y_asignaturas_alter;

---------------------------------------
SELECT * FROM estudiantes
SELECT * FROM asignaturas
SELECT * FROM asignaturas_matriculadas
---------------------------------------

--Creacion de tablas
CREATE TABLE estudiantes (
    id_estudiante INT,
    nombre        VARCHAR(50),
    edad          INT,
    carrera       VARCHAR(50),
	nota_media    DECIMAL(2,1)
);

CREATE TABLE asignaturas (
    id_asignatura  INT,
    asignatura   VARCHAR(50),
    creditos       INT,
    departamento   VARCHAR(50)
);

CREATE TABLE asignaturas_matriculadas(
	id_estudiante INT, 
	id_asignatura INT
);

--Insertar datos en tabla "estudiantes"
INSERT INTO estudiantes values(1, 'Juan Pérez' ,20, 'Ingeniería de Sistemas' ,8.5)
INSERT INTO estudiantes values(2, 'María García', 22 , 'Psicología' ,7.2)
INSERT INTO estudiantes values(3, 'Carlos Martínez' ,21, 'Administración de Empresas' ,9.5)
INSERT INTO estudiantes values(4, 'Sofía López' ,19, 'Contabilidad' ,5.5)
INSERT INTO estudiantes values(5, 'Luis Rodríguez' ,23, 'Ingeniería Civil' ,8.7)
INSERT INTO estudiantes values(6, 'Ana Ruiz', 20, 'Medicina', 9.2)
INSERT INTO estudiantes values(7, 'Pablo Gómez', 22, 'Arquitectura' ,8.1)
INSERT INTO estudiantes values(8, 'Andrea Díaz', 21, 'Economía', 6.7)
INSERT INTO estudiantes values(9, 'Elena Fernández', 20, 'Psicología', 7.3)
INSERT INTO estudiantes values(10, 'Miguel Torres', 27, 'Economía', 8.2)
--Insertar datos en tabla "asignaturas"
INSERT INTO asignaturas VALUES (1,'Bases de Datos',3,'Ciencias de la Computación')
INSERT INTO asignaturas VALUES (2,'Matemáticas Avanzadas',4,'Matemáticas')
INSERT INTO asignaturas VALUES (3,'Finanzas Corporativas',3,'Economía')
INSERT INTO asignaturas VALUES (4,'Psicología Social',3,'Psicología')
INSERT INTO asignaturas VALUES (5,'Inglés Avanzado',2,'Lenguas Extranjeras')
INSERT INTO asignaturas VALUES (6, 'Programación en C', 4, 'Ciencias de la Computación')
INSERT INTO asignaturas VALUES (7, 'Arte Contemporáneo', 2, 'Bellas Artes')
INSERT INTO asignaturas VALUES (8, 'Derecho Civil', 3, 'Derecho')
INSERT INTO asignaturas VALUES (9, 'Marketing Estratégico', 3, 'Marketing')
INSERT INTO asignaturas VALUES (10, 'Física Cuántica', 4, 'Física')
--Insertar datos en tabla "asignaturas_matriculadas"
INSERT INTO asignaturas_matriculadas values (1, 1);
INSERT INTO asignaturas_matriculadas values (1, 6);
INSERT INTO asignaturas_matriculadas values (1, 10);
INSERT INTO asignaturas_matriculadas values (2, 3);
INSERT INTO asignaturas_matriculadas values (3, 4);
INSERT INTO asignaturas_matriculadas values (3, 5);
INSERT INTO asignaturas_matriculadas values (4, 7);
INSERT INTO asignaturas_matriculadas values (5, 10);
INSERT INTO asignaturas_matriculadas values (7, 2);
INSERT INTO asignaturas_matriculadas values (8, 9);
INSERT INTO asignaturas_matriculadas values (9, 2);
INSERT INTO asignaturas_matriculadas values (15, 15);

---------------------------------------
SELECT * FROM estudiantes
SELECT * FROM asignaturas_matriculadas

SELECT * FROM asignaturas
---------------------------------------


-- 1. Obtener el nombre de los estudiantes seguido de su edad, con este formato: 
-- "Juan Pérez tiene 20 años"
SELECT CONCAT(nombre, ' tiene ', edad, ' años') FROM estudiantes;

-- 2. Obtener el nombre de los estudiantes seguido de su carrera y su nota media, con este formato: 
-- "Juan Pérez estudia Ingeniería de Sistemasy tiene una media de 8.5"
SELECT CONCAT(nombre, ' estudia  ', carrera, ' y tiene una media de ' , nota_media) AS 'Informacion del alumno' FROM estudiantes;

-- 3. Obtener el nombre de los estudiantes seguido del nº de asignaturas que tiene cada uno
-- "Juan Pérez tiene 3 asignaturas"
SELECT CONCAT (nombre, ' tiene ', COUNT(am.id_asignatura), ' asignaturas') AS 'Informacion del alumno'
FROM estudiantes e
LEFT JOIN asignaturas_matriculadas am ON e.id_estudiante = am.id_estudiante
GROUP BY nombre;
