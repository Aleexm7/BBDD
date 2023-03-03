-- Ejercicio 1

insert into departamento(nombre, presupuesto, gastos) values ('Proyectos', 0, 0);
insert into departamento(nombre, presupuesto, gastos) values ('Publicidad', 0, 100);

-- Ejercicio 2

insert into empleado(nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) values ('41234836R', 'Irene', 'Salas', 'Flores', 'M', '1994-06-01', 6);
insert into empleado(nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) values ('82635162B', 'Juan Antonio', 'Saez', 'Guerrero', 'H', '1980-11-21', 6);

-- Ejercicio 3

select departamento.codigo, departamento.nombre, departamento.presupuesto, departamento.gastos, empleado.nombre, empleado.nif, empleado.apellido1, empleado.apellido2, empleado.sexo, empleado.nacimiento, empleado.codigo_departamento
from departamento
inner join empleado on departamento.codigo= empleado.codigo
order by departamento.nombre;

-- Ejercicio 4

select nombre, sexo from empleado
order by sexo;

-- Ejercicio 5

select * from departamento
where presupuesto between 120000 AND 280000 and gastos > 20000;

-- Ejercicio 6

select * from empleado where apellido2 is null;

-- Ejercicio 7

select departamento.nombre, count(empleado.codigo) as NumEmpleados
from departamento
inner join empleado on departamento.codigo = empleado.codigo_departamento
group by departamento.nombre;

-- Ejercicio 8

update departamento set presupuesto = 200000 where codigo = 6;
update departamento set gastos = 3000 where codigo = 6;

-- Ejercicio 9 y 10

update departamento set departamento = 'Contabilidad' where departamento = 'Publicidad';

-- Ejercicio 11 

select sum(presupuesto) as TotalPresupuestos, sum(gastos) as TotalGastos, sum(presupuesto - gastos) as TotalSinGastar
from departamento;

-- Ejercicio 14

create table copia_dep like departamento;
insert into copia_dep (codigo, nombre, presupuesto, gastos) select codigo, nombre, presupuesto, gastos from departamento;

-- Ejercicio 15

create table empleado_mujeres like empleado;
insert into empleado_mujeres (codigo, nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) select codigo, nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento from empleado
where sexo like 'M';


create table empleado_hombres like empleado;
insert into empleado_hombres (codigo, nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) select codigo, nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento from empleado
where sexo like 'H';
 