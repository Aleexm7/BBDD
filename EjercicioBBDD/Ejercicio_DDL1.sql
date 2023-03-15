-- CHECK -----

create table if not exists libros3 (
	id int unsigned not null primary key,
    titulo varchar(50),
    num_pag int check (num_pag > 10),
    editorial varchar(50) not null check (editorial in('ALFAGUARA', 'SM', 'ANAYA')),
    precio int not null,
    constraint chk_precio check (precio > 0 and precio < 60)

);

insert into libros3 values (1,'La Regenta', 850, 'ALFAGUARA', 20);
insert into libros3 values (2,'El Buscón', 10, 'ALFAGUARA', 10);
update libros3 set precio= 200 where id = 1;

select * from libros3;


create index idx_tit on libros3(titulo);
show index from libros3;

drop table if exists coches;
create table coches(
	idprod int not null auto_increment,
    nombre varchar(120),
    descripcion varchar(255),
    primary key (idprod)

);

INSERT INTO coches VALUES 
(1,'Audi A3 TDI','El Audi A3 es un compacto premium, cuyos rivales principales son los BMW Serie 1, Mercedes Clase A e Infiniti Q30.'),
(2,'Audi A4 TDI','El Audi A4 es la berlina de referencia de Audi, el rival de BMW Serie 3 y Mercedes Clase C'),
(3,'Audi A8 TDI','El Audi A8 es la gran berlina de Audi, rivaliza con el BMW Serie 7, el Mercedes Clase S y el Lexus LS'),
(4,'Audi 100','El modelo en sus variantes deportivas y de lujo se comercializó En 1995'),
(5,'Audi 100 CV','un cinco cilindros en línea de 2,3 litros y 133 CV,'),
(6,'coche con Equipo de Audio 100 Wats',NULL),
(7,'coche para audiencias',NULL);

select * from coches;

-- 1) Busca los Audis, utilizo like

select * from coches where nombre like 'AUDI%';

create fulltext index idx_full_nombre on coches (nombre);
show index from coches;

select nombre, descripcion from coches where match (nombre) against('Audi TDI'); -- Ponemos en el match el mismo nombre que hemos creado en el index de arriba

select nombre, descripcion from coches where match (nombre) against('TDI');

select nombre, descripcion from coches where match (nombre) against('A3 TDI');

select nombre, descripcion from coches where match (nombre) against('Mercedes');

-- Eliminamos el index creado anteriormente para crear otro de nuevo
drop index idx_full_nombre on coches;

create fulltext index idx_full_nombre on coches (nombre, descripcion);

select nombre, descripcion from coches where match (nombre, descripcion) against('100');

/*
TABLAS TEMPORALES
*/

select * from tabla_origen;

create temporary  table tabla_origen select * from tabla_origen;

show create table tabla_origen;

set sql_safe_updates = 0;
delete from tabla_origen where id > 1;
set sql_safe_updates = 1;

select * from tabla_origen;

drop temporary table tabla_origen;


-- Creo una temporal con nombre específico ---

create temporary table tmp_tabla_origen select * from tabla_origen;

select * from tmp_tabla_origen;

set sql_safe_updates = 0;
 delete from tmp_tabla_origen where id > 1;
 set sql_safe_updates = 1;
 
 show tables;
 drop temporary table tmp_tabla_origen;
 
 
 -- UNION Y UNION ALL ---
 
 -- UNION - UNO DOS TABLAS QUE TIENEN QUE TENER LA MISMA ESTRUCTURA. NO COPIA LOS REGISTROS DE LA SEGUNDA TABLA CON CÓDIGOS DUPLICADOS
 
 -- UNION ALL - UNE DOS TABLAS CON LA MISMA ESTRUCTURA Y COPIA REGISTROS DUPLICADOS
 
 
 select * from coches;
 
 create table coches2 select * from coches where idprod in (1,2,3);
 insert into coches2 values (9,'MERCEDES CLASE A', 'COCHE DE LUJO');

select * from coches
union
select * from coches2;

select * from coches
union all
select * from coches2;

-- error, tiene que tener el mismo numero de campos

select idprod, nombre from coches
union
select idprod, descripcion, nombre from coches2;

select idprod, nombre from coches
union
select idprod, descripcion as nombre from coches2;


