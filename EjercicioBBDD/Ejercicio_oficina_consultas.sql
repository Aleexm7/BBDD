use bd_oficina;

-- 1. Calcula cuánto ganan en total todos los empleados
select nomEmp, sum(salEmp+comisionE) as Total_ganancias from empleados group by nomEmp;

-- 2. Calcula cuánto ganan en total cada uno de los grupos de empleados clasificados por cargo
select sum(salEmp+comisionE) as Total_ganancias, cargoE from empleados group by cargoE;

-- 3. Calcula el máximo sueldo para cada uno de los grupos de empleados clasificados por cargoE
select max(comisionE) as maximo, cargoE from empleados group by cargoE;

-- 4. Calcula el sueldo medio de los empleados de cada departamento
select departamentos.codDepto, nombreDpto, ciudad, round(avg(salEmp), 2) as sueldo_medio
From departamentos, empleados
where departamentos.codDepto=empleados.codDepto
group by departamentos.codDepto;

-- 5 Muestra a qué departamento pertenece cada empleado
select e.nomEmp, dp.nombreDpto, dp.ciudad from empleados as e join departamentos as dp on dp.codDepto = e.codDepto;

-- 6. Muestra cuantos empleados hay en cada departamento.
select codDepto, nombreDpto, ciudad, count(*) as num_emp 
from empleados 
join departamentos using (codDepto) 
group by codDepto;

-- 7. A partir de la tabla empleados, visualizar cuántos apellidos de los empleados empiezan por la letra A.
select count(nomEmp) as total from empleados where nomEmp like '% A%';

-- 8. Muestra el nombre de los que trabajan en gerencia.
select e.nomEmp, dp.nombreDpto from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where dp.nombreDpto like 'GERENCIA';

-- pero los gerentes son:


-- 9. Visualiza los empleados hombres y mujeres poniendo: SEXO: HOMBRE O MUJER (usa if)
select nomEmp , IF(sexEmp = 'F', "Sexo: Mujer", "Sexo: Hombre") from empleados;

-- 10. Muestra EL NÚMERO DE HOMBRES Y MUJERES
select count(nomEmp) , IF(sexEmp = 'F', "Sexo: Mujer", "Sexo: Hombre") from empleados group by sexEmp;

-- 11. Muestra el sueldo bruto de cada empleado
select nomEmp, salEmp from empleados;

-- 12. Muestra los nombre de los empleados y quiénes son sus jefes (debe aparecer el nombre del jefe).

select nDIEmp as 'DNI del empleado', nomEmp as Empleado, nDIEmp as 'DNI del jefe', j.nombEmp as jefe
from empleados e
join empleados j on e.jefeID = j.nDIEmp;


-- Modifica la consulta anterior para que también aparezca el nombre del gerente y su correspondiente jefe que será NULL (ya que el gerente no tiene jefe).


-- 13. Cuenta los empleados de cada ciudad
select count(e.nomEmp), dp.ciudad from empleados as e join departamentos as dp on dp.codDepto = e.codDepto group by ciudad;

-- 14. Muestra los diferentes cargos de los distintos departamentos
select distinct e.cargoE, dp.nombreDpto from empleados as e join departamentos as dp on dp.codDepto = e.codDepto;

-- 15. Muestra los salarios maxímos de cada departamento
select max(salEmp) as Total_ganancias, cargoE from empleados group by cargoE;

-- si añado que el salario supere 10500
select max(salEmp) as Total_ganancias, cargoE from empleados where salEmp >10500 group by cargoE;

-- si agrupo por nombre de departamento
select max(e.salEmp) as Total_ganancias, dp.nombreDpto from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where salEmp >10500 group by dp.nombreDpto;

-- 16) Muestra quién es el jefe de cada departamento.
select e.nomEmp, e.nDIEmp, dp.nombreDpto from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where e.nDIEmp = dp.codDirector;

-- 17) Muestra el dni y nombre de los empleados del departamento de ventas de Madrid, y el nombre de su JEFE.
select nomEmp, nDIEmp from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where ciudad = 'MADRID';

-- 18) Muestra los datos de los empleados y de los jefes del departamento de VENTAS (da igual la ciudad) y ordena por nombre del JEFE.
select nomEmp, nDIEmp from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where nombreDpto = 'VENTAS';

-- 19) Muestra los datos de los empleados y los del jefe del departamento de INVESTIGACIÓN (da igual la ciudad)
select nomEmp, nDIEmp from empleados as e join departamentos as dp on dp.codDepto = e.codDepto where nombreDpto = 'INVESTIGACIÓN';

-- 20) Muestra quién es el gerente de la manera más fácil que se te ocurra.
select * from empleados where jefeID like null;