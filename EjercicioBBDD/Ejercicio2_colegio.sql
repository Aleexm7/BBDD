use colegio;

create table alumnos2 select * from alumnos;
select * from alumnos2;

describe alumnos2;
describe alumnos;

create table alumnos3 select dni, nombre, apellidos from alumnos;
select * from alumnos3;

create table alumnos4 select * from alumnos where provincia like 'madrid';
select * from alumnos4;

insert alumnos4 select * from alumnos;

/*
SEGUNDA FORMA.

USANDO LIKE, CREA LA TABLA VACIA, CON LA MISMA ESTRUCTURA QUE LA TABLA ORIGINAL EXCEPTO FOREING KEY


*/

CREATE TABLE alumnosCopia5 like alumnos;
select * from alumnosCopia5;

describe alumnosCopia5;

insert into alumnosCopia5 select * from alumnos where provincia like 'Cordoba';
insert into alumnosCopia5 select * from alumnos where provincia like 'Madrid';




