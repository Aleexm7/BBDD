-- 1) Crea una copia de la tabla alumnos llamada Alumnos_sinclave, utiliza la sentencia que crea e introduce datos. Comprueba la estructura de la nueva tabla.

create table Alumnos_sinclave select * from alumnos;
describe Alumnos_sinclave;

--  2) Crea una copia de la tabla alumnos llamada Alumnos_segunda, la tabla debe ser una copia 
-- perfecta de la tabla Alumnos. Realiza las operaciones necesarias y haz las comprobaciones.

create table Alumnos_segunda like alumnos;
describe Alumnos_segunda;

--  3) Crea una copia de la tabla Asignaturas llamada Asignaturas_sinclave, utiliza la sentencia
-- que crea e introduce datos. Comprueba la estructura de la nueva tabla.

create table Asignaturas_sinclave select * from asignaturas;
describe Asignaturas_sinclave;

--  4) Crea una copia de la tabla Asignaturas llamada Asignaturas_segunda, la tabla debe ser
-- una copia perfecta de la tabla Asignaturas. Realiza las operaciones necesarias y haz las comprobaciones.

create table Asignatura_segunda like asignaturas;
describe Asignatura_segunda;


--  5) Crea una copia de la tabla alumnos llamada Datos_personales, en la que aparezcan el 
-- código, dni, nombre, apellidos y fecha de nacimientos de todos los alumnos.

create table Datos_personales select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento from alumnos;
insert into Datos_personales select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento from alumnos;
describe Datos_personales;

-- 6) Elimina los datos de la tabla anterior Datos_personales. Inserta en la tabla
-- Datos_personales, el código, dni, nombre, apellidos y fecha de nacimientos de todos los
-- alumnos de la comunidad de Madrid, que se encuentran en la tabla alumnos.
-- Inserta también los de la provincia de Córdoba y Jaén, con la misma sentencia.

delete from Datos_personales;
insert into Datos_personales (codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia) select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia from alumnos where provincia like '%Madrid%';
insert into Datos_personales (codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia) select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia from alumnos where provincia like '%Córdoba%';
insert into Datos_personales (codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia) select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento, provincia from alumnos where provincia like '%Jaen%';
Select distinct * from Datos_personales;


-- 7) Elimina las tablas creadas en este ejercicio (excepto Alumnos_sinclave, que la usamos luego)

drop table Alumnos_segunda, Asignatura_segunda, Asignaturas_sinclave, Datos_personales;

-- 8) Crea una nueva tabla: AlumnosDeSegundo. La tabla debe tener la estructura exacta de la tabla alumnos.

create table AlumnosDeSegundo like alumnos;

-- 1) Copia los registros de los alumnos de código 102 al 106 (ambos inclusive)

insert into AlumnosDeSegundo select * from alumnos where codigo_alumno >=102 AND codigo_alumno <=106;

-- 2) Copia el registro del alumno con DNI 45145254E

insert into AlumnosDeSegundo select * from alumnos where DNI = '45145254E';

-- 3) Copia el registro/s del alumno/os con Fecha_nacimiento = ‘1980/05/14’

insert into AlumnosDeSegundo select * from alumnos where Fecha_nacimiento = '198-05-14';

select * from alumnos where Fecha_nacimiento = '1980-05-14';

-- 4) Copia el registro/s del alumno/os con Fecha_nacimiento comprendidas entre el 
-- 1980/01/01 y 1981/12/31. (Lo habitual antes de realizar inserciones es ejecutar un
-- SELECT para ver si la consulta devuelve o no registros. Si devuelve registros,
-- realizaremos la sentencia INSERT.

select * from alumnos where Fecha_nacimiento >= '1980-01-01' AND Fecha_nacimiento <= '1981-12-31';

insert into AlumnosDeSegundo select * from alumnos where  Fecha_nacimiento >= '1980-01-01' AND Fecha_nacimiento <= '1981-12-31';


-- 5) Copia los alumnos de Malaga, Barcelona y Mallorca.

insert into AlumnosDeSegundo select * from alumnos where provincia= 'barcelona';






