-- 1. Obtener los datos completos de los empleados.

select * from empleados;

-- 2. Obtener los datos completos de los departamentos.

select * from departamentos;

-- 3. Obtener los datos de los empleados con cargo ‘Secretaria’.

select * from empleados where cargoE like 'Secretaria';

-- 4. Obtener el nombre y salario de los empleados.

select nomEmp, salEmp from empleados;

-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre

select * from empleados where cargoE like 'Vendedor'
order by nomEmp asc;

-- 6 Listar el nombre de los departamentos.

select distinct nombreDpto from departamentos;

-- 7 Obtener el nombre y cargo de todos los empleados, ordenado por salario

select nomEmp, cargoE, salEmp from empleados
order by salEmp;

-- 8 Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión.

select salemp, comisione 
from empleados 
order by comisionE;

-- 9  Listar todas las comisiones.

select comisionE from empleados;

-- 10 Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de 500.000, en orden alfabético del empleado

select nomemp, salemp, (salemp+500000) as 'pago estimado'
from empleados 
where codDepto = '3000'
order by nomemp;

-- 11  Obtener la lista de los empleados que ganan una comisión superior a su sueldo.

select nomEmp, salEmp, comisionE from empleados where comisionE > salEmp;


-- 12 Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.

select nomEmp, salEmp, comisionE from empleados where comisionE <= (salEmp*0.3);

-- 13 Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado.

select nomEmp as 'Nombre', cargoE as 'Cargo' from empleados;