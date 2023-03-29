-- 1) Modifica el nombre del campo telefono_movil a telefonoM.
ALTER TABLE alumnos CHANGE Telefono_movil telefonoM varchar(9);
ALTER TABLE alumnos CHANGE telefonoM telefonoM varchar(9) not null;

-- 2) Modifica el campo nombre a varchar(60) caracteres.

ALTER TABLE alumnos MODIFY Nombre varchar(60);
ALTER TABLE alumnos MODIFY Nombre varchar(60) not null;

-- 3) Añade un nuevo campo sexo, el tipo es un char de un caracter, por defectos es &#39;F&#39; y con una restriccion ckeck que sólo permita los valores M o F; además debe ir antes de la dirección.

ALTER TABLE alumnos ADD sexo char(1) default 'F' check (sexo = 'F' or sexo = 'M') after apellidos;

-- 4) Modifica el campo cp a CodigoPostal (es un número de 5 dígitos) cambia al valor que creas más oportuno, debe ser sin signo.

ALTER TABLE alumnos CHANGE CP CodigoPostal mediumint unsigned;

-- 5) Modifica el campo nombre y apellidos a un varchar(100) caracteres y provincia a varchar(30) caracteres. En la misma sentencia.

ALTER TABLE alumnos MODIFY Nombre varchar(100) not null, MODIFY Apellidos varchar(100) not null, MODIFY Provincia varchar(30) not null;

-- 6) Inserta un nuevo campo correoContacto, varchar(150) no nulo. Irá después del campo telefonoM.

ALTER TABLE alumnos ADD correoContacto varchar(150) NOT NULL AFTER telefonoM;

-- 7) El campo correoContacto se llamará correoPersonal.

ALTER TABLE alumnos CHANGE correoContacto correoPersonal varchar(150) not null;

-- 8) Inserta los correos de cada alumno.

SET sql_safe_updates = 0;
UPDATE alumnos SET correoPersonal = CONCAT(lower(left(nombre,5)),substring(nombre,2, 4),right(dni,6), '@gmail.com');
SET sql_safe_updates = 1;

-- 11) Carmen Moreno García ha cambiado su domicilio a C/ Arganzuela, 32 de Madrid, CP=28021 cambiar los datos necesarios.

UPDATE alumnos SET direccion = 'C/ Arganzuela, 32', localidad = 'Madrid', CodigoPostal = 28021 WHERE codigo_alumno = 110;

-- 12) Elimina la clave foránea que tiene alumnos con asignaturas.

ALTER TABLE alumnos DROP FOREIGN KEY Codigo_asignatura;
show index from alumnos;

-- 13) Elimina las claves principales de las tablas alumnos y asignaturas.

ALTER TABLE alumnos DROP PRIMARY KEY;
ALTER TABLE asignaturas DROP PRIMARY KEY;

-- 14) Vuelve a crear las claves principales.

ALTER TABLE alumnos ADD PRIMARY KEY (Codigo_alumno);
ALTER TABLE asignaturas ADD PRIMARY KEY (Codigo);

-- 15) Vuelve a crear las claves foráneas.

ALTER TABLE alumnos ADD CONSTRAINT alumnos_asignatura_fk FOREIGN KEY (Codigo_asignatura) REFERENCES asignaturas (codigo) ON DELETE NO ACTION ON UPDATE CASCADE;

-- 16) Inserta 2 nuevos alumnos.

INSERT INTO alumnos VALUES (122, '49126859D', 'Raquel', 'Perez Dominguez', 'F', 'Plaza la lujuria 1', 'Sevilla', 'Sevilla', 41006, '954556612' , '644814399' , 'Raquelita23@gmail.com', 5 , '1994-06-07');
INSERT INTO alumnos VALUES (123, '49176459D', 'Alberto', 'Moreno', 'M', 'Gorda calatrava', 'Sevilla', 'Sevilla', 41002, '954667213' , '610676513' , 'Albertomoreno_@gmail.com', 2 , '1999-01-24');


-- **** Añade los siguientes índices: Utiliza ALTER TABLE.
-- 17) Indexa el campo DNI. Decide qué índice es el más adecuado.

ALTER TABLE alumnos ADD UNIQUE INDEX(DNI);


-- 18) Indexa los campos nombre y apellidos en un índice compuesto.

ALTER TABLE alumnos ADD INDEX (nombre, apellidos);

-- 19) Crea el índice provincias.

ALTER TABLE alumnos ADD INDEX (provincia);

-- 20) Elimina el índice provincias.

ALTER TABLE alumnos DROP INDEX provincia;

-- 21) Crea un índice con los 4 primeros caracteres de la localidad.

ALTER TABLE alumnos ADD INDEX (localidad(4));
-- 22) Elimina los índices anteriores con ALTER TABLE

ALTER TABLE alumnos DROP INDEX dni, DROP INDEX nombre, DROP INDEX localidad;

-- Crea todos los índices anteriores con CREATE INDEX. Luego los eliminas con DROP INDEX.

CREATE UNIQUE INDEX idx_dni ON alumnos (DNI);
CREATE INDEX idx_nombre ON alumnos (Nombre);
CREATE INDEX idx_apellidos ON alumnos (Apellidos);
CREATE INDEX idx_provincia ON alumnos (Provincia);
CREATE INDEX idx_localidad ON alumnos (Localidad(4));

DROP INDEX idx_dni ON alumnos;
DROP INDEX idx_nombre on alumnos;
DROP INDEX idx_apellidos on alumnos;
DROP INDEX idx_provincia on alumnos;
DROP INDEX idx_localidad on alumnos;