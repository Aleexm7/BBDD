create database prueba2;

create table tabla1(
cantidad int,
precio int
);

insert into tabla1 values (3,50);
insert into tabla1 values (4,80);

select * from tabla1;

create view vista1 as select cantidad, precio, (cantidad* precio) total from tabla1;

select * from vista1;

show create view vista1; -- ver el codigo de la vista

-- vista2 voy a cambiar el nombre de los campos

create or replace view vista2 (cantidad_almacen, precio_venta, total_venta) 
as 
select cantidad, precio, (cantidad * precio) total from tabla1;

select * from vista2;


create or replace view vista3
as 
select sum(total_venta) total from vista2;
select * from vista3;