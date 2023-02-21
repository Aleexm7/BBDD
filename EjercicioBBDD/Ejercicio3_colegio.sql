-- Crea una copia de la tabla alumnos llamada Alumnos_sinclave, utiliza la sentencia que crea e introduce datos. Comprueba la estructura de la nueva tabla.

create table Alumnos_sinclave select * from alumnos;
describe Alumnos_sinclave;

-- Crea una copia de la tabla alumnos llamada Alumnos_segunda, la tabla debe ser una copia 
-- perfecta de la tabla Alumnos. Realiza las operaciones necesarias y haz las comprobaciones.

create table Alumnos_segunda like alumnos;
describe Alumnos_segunda;

-- Crea una copia de la tabla Asignaturas llamada Asignaturas_sinclave, utiliza la sentencia
-- que crea e introduce datos. Comprueba la estructura de la nueva tabla.

create table Asignaturas_sinclave select * from asignaturas;
describe Asignaturas_sinclave;

-- Crea una copia de la tabla Asignaturas llamada Asignaturas_segunda, la tabla debe ser
-- una copia perfecta de la tabla Asignaturas. Realiza las operaciones necesarias y haz las comprobaciones.

create table Asignatura_segunda like asignaturas;
describe Asignatura_segunda;


-- Crea una copia de la tabla alumnos llamada Datos_personales, en la que aparezcan el 
-- código, dni, nombre, apellidos y fecha de nacimientos de todos los alumnos.

create table Datos_personales select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento from alumnos;
insert into Datos_personales select codigo_alumno, DNI, nombre, apellidos, Fecha_nacimiento from alumnos;
describe Datos_personales;

-- Elimina los datos de la tabla anterior Datos_personales. Inserta en la tabla
-- Datos_personales, el código, dni, nombre, apellidos y fecha de nacimientos de todos los
-- alumnos de la comunidad de Madrid, que se encuentran en la tabla alumnos.
-- Inserta también los de la provincia de Córdoba y Jaén, con la misma sentencia.





