CREATE DATABASE IF NOT EXISTS escuela_final_new;

use  escuela_final_new;

-- TABLA PROVINCIAS
CREATE TABLE IF NOT EXISTS provincias (
  id_provincia INT PRIMARY KEY auto_increment,
  nombre  VARCHAR(255) NOT NULL
);

-- TABLA LOCALIDADES
CREATE TABLE IF NOT EXISTS Localidades (
  id_localidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255) NOT NULL,
  id_provincia INT ,
  FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

-- TABLA MATERIAS
CREATE TABLE IF NOT EXISTS materias(
  id_materia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  anio int not null,
  division VARCHAR (255) NOT NULL
);

-- TABLA MAAESTROS
CREATE TABLE IF NOT EXISTS maestros(
  id_maestro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255)  NOT NULL,
  dni VARCHAR(255) NOT NULL,
  genero ENUM ('Masculino','Femenino','No binario') NOT NULL,
  correo VARCHAR(255) NOT NULL,
  contrasenia VARCHAR(255) NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_provincia INT ,
  FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia),
  id_localidad INT ,
  FOREIGN KEY (id_localidad) REFERENCES Localidades(id_localidad)
);

-- TABLA ALUMNOS
CREATE TABLE IF NOT EXISTS alumnos(
  id_alumno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255)  NOT NULL,
  dni VARCHAR(255) NOT NULL,
  genero ENUM ('Masculino','Femenino','No binario') NOT NULL,
  correo VARCHAR(255) NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_provincia INT ,
  FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia),
  id_localidad INT ,
  FOREIGN KEY (id_localidad) REFERENCES Localidades(id_localidad)
);


-- TABLA CALIFICACIONES
CREATE TABLE IF NOT EXISTS calificaciones (
  id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
  trimestre enum('Primer trimestre','Segundo trimestre',"Tercer trimestre") NOT NULL,
  nota DECIMAL(5,2),
  id_alumno INT,
  FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
  id_materia INT,
  FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

-- TABLA MATERIAS_X_MAESTROS
CREATE TABLE IF NOT EXISTS materias_x_maestros(
  id_maestro INT,
  id_materia INT,
  FOREIGN KEY (id_maestro) REFERENCES maestros(id_maestro),
  FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);


-- TABLA MATERIAS_X_ALUMNOS
CREATE TABLE IF NOT EXISTS materias_x_alumnos(
  id_alumno INT,
  id_materia INT,
  FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
  FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

CREATE TABLE IF NOT EXISTS alta_historico_maestros(
id INT,
nombre_maestro VARCHAR(255),
apellido_maestro VARCHAR(255),
dni_maestro VARCHAR(255),
fecha_hora DATETIME,
usuario VARCHAR(255),
operacion varchar(255)
);


/*************************************************INSERTS*******************************************************************************/

-- INSERT TABLA PROVINCIAS 
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (1,'Buenos Aires');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (2,'Ciudad Autónoma de Buenos Aires');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (3,'Catamarca');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (4,'Chaco');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (5,'Chubut');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (6,'Córdoba');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (7,'Corrientes');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (8,'Entre Ríos');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (9,'Formosa');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (10,'Jujuy');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (11,'La Pampa');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (12,'La Rioja');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (13,'Mendoza');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (14,'Misiones');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (15,'Neuquén');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (16,'Río Negro');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (17,'Salta');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (18,'San Juan');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (19,'San Luis');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (20,'Santa Cruz');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (21,'Santa Fe');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (22,'Santiago del Estero');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (23,'Tierra del Fuego, Antártida e Islas del Atlántico Sur');
INSERT INTO provincias (`id_provincia`,`Nombre`) VALUES (24,'Tucumán');

select * from provincias;

-- INSERTS TABLA LOCALIDADES

INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (1,'Tres De Febrero',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (2,'Zarate',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (3,'Adolfo Alsina',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (4,'Adolfo Gonzales Chaves',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (5,'Alberti',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (6,'Almirante Brown',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (7,'Arrecifes',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (8,'Avellaneda',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (9,'Ayacucho',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (10,'Azul',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (11,'Bahía Blanca',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (12,'Balcarce',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (13,'Baradero',1);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (14,'Bermejo',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (15,'Boedo',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (16,'Caballito',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (17,'Calacita',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (18,'Chacarita',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (19,'Cildáñez',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (20,'Coghlan',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (21,'Colegiales',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (22,'Constitución',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (23,'El Campito',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (24,'El Ombú',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (25,'El Pueblito',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (26,'Emáus',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (27,'Flores',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (28,'Floresta',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (29,'Jorge Newbery',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (30,'La Boca',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (31,'La Carbonilla',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (32,'La Esperanza',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (33,'La Esquina',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (34,'La Paternal',2);
INSERT INTO localidades (`id_Localidad`,`Nombre`,`id_Provincia`) VALUES (35,'La Rotonda',2);

select * from localidades;

-- inserts tabla MATERIAS

INSERT INTO materias (id_materia,nombre,anio,division) VALUES (1,'Lengua',2023,'1° "A"');
INSERT INTO materias (id_materia,nombre,anio,division) VALUES (2,'Matematica',2023,'1° "A"');
INSERT INTO materias (id_materia,nombre,anio,division) VALUES (3,'Geografia',2023,'1° "A"');
INSERT INTO materias (id_materia,nombre,anio,division) VALUES (4,'Musica',2023,'1° "A"');
INSERT INTO materias (id_materia,nombre,anio,division) VALUES (5,'Economia Moderna',2023,'1° "A"');


select * from materias;

-- INSERTS MAESTROS 
INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value (1,'Agustin','sanchez','43468602','Masculino','aghuz219@gmail.com','Tito1223',1,1);
INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value (2,'Elisabet','Agostini','48565478','Femenino','eli@gmail.com','e123',1,2);
INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(3,'Matias','Rey','42459602','Masculino','matirey@gmail.com','Mati2341',2,14);
INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(4,'Jesus','Rey','42459621','Masculino','jesusrey@gmail.com','Jesus123',2,16);
INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(5,'Antonio','Rios','17852256','Masculino','antonio@gmail.com','Elmascapo',1,1);
select * from maestros;

-- tabla alumnos
INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (1,'Juan', 'Pérez', '12345678', 'Masculino', 'juan@example.com', 1, 1);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (2,'María', 'González', '87654321', 'Femenino', 'maria@example.com', 2, 14);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (3, 'Carlos', 'López', '98765432', 'Masculino', 'carlos@example.com', 1, 2);

INSERT INTO alumnos(id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (4, 'Laura', 'Rodríguez', '54321678', 'Femenino', 'laura@example.com', 1, 3);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (5, 'Andrés', 'Fernández', '87654321', 'Masculino', 'andres@example.com', 1, 5);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (6,'Ana', 'López', '65432187', 'Femenino', 'ana@example.com', 1, 6);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (7,'Pedro', 'Gómez', '98765432', 'Masculino', 'pedro@example.com', 2, 16);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (8,'Marta', 'Martínez', '12347865', 'Femenino', 'marta@example.com', 2, 15);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (9,'Luis', 'García', '87651234', 'Masculino', 'luis@example.com', 1, 1);

INSERT INTO alumnos (id_alumno,nombre, apellido, dni, genero, correo, id_provincia, id_localidad)
VALUES (10,'Sofía', 'Sánchez', '43215678', 'Femenino', 'sofia@example.com', 1, 7);


-- insert tabla materias_x_alumnos
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (1,1);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (1,2);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (1,3);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (1,4);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (1,5);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (2,1);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (2,2);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (2,3);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (2,4);
INSERT INTO materias_x_alumnos(id_alumno,id_materia ) VALUES (2,5);

SELECT * FROM materias_x_alumnos;

-- inserts tabla calificaciones
INSERT INTO calificaciones (id_calificacion,trimestre,nota,id_alumno,id_materia) 
VALUES (1,'Primer trimestre',8,1,1);
INSERT INTO calificaciones (id_calificacion,trimestre,nota,id_alumno,id_materia) 
VALUES (2,'Segundo trimestre',5,1,1);
INSERT INTO calificaciones (id_calificacion,trimestre,nota,id_alumno,id_materia) 
VALUES (3,'Tercer trimestre',10,1,1);
INSERT INTO calificaciones (id_calificacion,trimestre,nota,id_alumno,id_materia) 
VALUES (4,'Primer trimestre',4.5,2,2);
INSERT INTO calificaciones (id_calificacion,trimestre,nota,id_alumno,id_materia) 
VALUES (5,'Segundo trimestre',10,2,2);


INSERT INTO materias_x_maestros(id_maestro,id_materia ) VALUES (1,1);
INSERT INTO materias_x_maestros(id_maestro,id_materia ) VALUES (1,2);
INSERT INTO materias_x_maestros(id_maestro,id_materia ) VALUES (2,3);
INSERT INTO materias_x_maestros(id_maestro,id_materia ) VALUES (3,4);
INSERT INTO materias_x_maestros(id_maestro,id_materia ) VALUES (4,5);


/*********************** views *******************************/

CREATE VIEW vista_notas_alumnos AS
SELECT a.id_alumno, a.nombre, a.apellido, c.trimestre, c.nota, m.nombre AS nombre_materia, m.anio, m.division
FROM alumnos AS a
LEFT JOIN calificaciones AS c ON a.id_alumno = c.id_alumno
LEFT JOIN materias AS m ON c.id_materia = m.id_materia;

CREATE VIEW vista_maestros_materia AS
SELECT a.id_alumno, a.nombre AS "Nombre del maestro", a.apellido AS "Apellido del maestro", 
m.nombre AS "Nombre de la materia que imparte", m.anio, m.division
FROM alumnos AS a
INNER JOIN materias_x_maestros AS mm ON a.id_alumno = mm.id_maestro
INNER JOIN materias AS m ON mm.id_materia = m.id_materia;

CREATE VIEW vista_alumnos_provincias AS
SELECT a.nombre AS "Nombre del alumno", a.apellido AS "Apellido del alumno", p.nombre AS "Provincia del alumno"
FROM alumnos AS a
INNER JOIN provincias AS p ON a.id_provincia = p.id_provincia;

CREATE VIEW vista_notas_materias AS
SELECT a.id_alumno, a.nombre, a.apellido, c.trimestre, c.nota, m.nombre AS nombre_materia, m.anio, m.division
FROM alumnos AS a
LEFT JOIN calificaciones AS c ON a.id_alumno = c.id_alumno
LEFT JOIN materias AS m ON c.id_materia = m.id_materia
WHERE m.nombre='Lengua' and m.division = '1° "A"';

/*********************************FUNCIONES****************************************/
/* FUNCION NUMERO 1*/
DELIMITER $$
CREATE FUNCTION get_Provincia (p_id_provincia INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
		DECLARE resultado VARCHAR(255);
        SET resultado =(SELECT nombre FROM provincias where id_provincia = p_id_provincia);
        return resultado;
END $$

SELECT nombre, apellido, dni, genero, get_Provincia(id_provincia) AS 'Provincia', id_localidad FROM alumnos;

/* FUNCION NUMERO 2*/
DELIMITER $$
CREATE FUNCTION get_Provincia_localidad(p_id_provincia INT, p_id_localidad INT)
  RETURNS VARCHAR(255)
  READS SQL DATA
  BEGIN
    DECLARE resultado VARCHAR(255);
    DECLARE nombre_provincia VARCHAR(255);
    DECLARE nombre_localidad VARCHAR(255);
    
    SELECT nombre INTO nombre_provincia
    FROM provincias
    WHERE id_provincia = p_id_provincia;
    
    SELECT nombre INTO nombre_localidad
    FROM Localidades
    WHERE id_localidad = p_id_localidad;
    
    SET resultado = CONCAT('PROVINCIA: ', nombre_provincia,'.', ' Y  LOCALIDAD: ', nombre_localidad,'.');
    
    RETURN resultado;
  END $$
  SELECT nombre, apellido, dni, genero, get_Provincia_localidad(id_provincia,id_localidad)AS 'Provincia y localidad' from alumnos;

/*****************************STORE PORCEDURE********************************************/


/*store procedure 1* contador de maestros registrados*/
DELIMITER $$
CREATE PROCEDURE get_sp_count_maestros(OUT recuento int)
BEGIN
  SELECT count(*) INTO recuento from maestros;
END $$

SET @recuento=0;
call get_sp_count_maestros(@recuento);
SELECT @recuento as 'Total maestros registrados';

/*store procedure 2*/
DELIMITER $$
CREATE PROCEDURE sp_order_table(IN campo varchar(255), IN tipo_ordenamiento ENUM('ASC','DESC',''), IN tabla varchar(255))
BEGIN
	IF campo <> '' then
		SET @ordenar = CONCAT(' ORDER BY ',campo);
	else
		SET @ordenar = '';
	END IF ;
    
    IF tipo_ordenamiento <> '' then
		SET @tipo = CONCAT(' ',tipo_ordenamiento);
	else
		SET @tipo = '';
	END IF ;
    
    
    SET @clausula = CONCAT('SELECT * FROM ', tabla ,@ordenar, @tipo);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END $$
CALL sp_order_table('nombre','DESC','alumnos');
/*******************************TRIGGERS******************************************/
/*trigger 1*/
DELIMITER $$
CREATE TRIGGER comprobar_correo
BEFORE INSERT ON maestros
FOR EACH ROW
BEGIN
	IF NEW.correo IS NOT NULL AND NEW.correo NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico no tiene un formato válido.';
	END IF;
END $$
-- INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(8,'Samuel','Etoo','15857867','Masculino','samuel','Pesadilla1',2,2);



/*trigger 2*/

DELIMITER $$
CREATE TRIGGER historico_maestro
AFTER INSERT ON maestros
FOR EACH ROW
BEGIN
	INSERT INTO alta_historico_maestros (id,nombre_maestro,apellido_maestro,dni_maestro,fecha_hora,usuario,operacion)value(
		NEW.id_maestro, NEW.nombre, NEW.apellido, NEW.dni, now(), user(), "ALTA MAESTRO"
    );
END $$

-- INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(6,'Miguel','Rios','17857888','Masculino','miguel@gmail.com','123454',1,1);
-- INSERT INTO maestros(id_maestro,nombre,apellido,dni,genero,correo,contrasenia,id_provincia,id_localidad) value(7,'Luis','Pirilli','19857888','Masculino','Luis2022@hotmail.com','Pesadilla1',2,2);
-- SELECT * FROM alta_historico_maestros;