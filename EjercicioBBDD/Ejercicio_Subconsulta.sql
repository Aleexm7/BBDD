-- 0) Mostrar los datos de los empleados que pertenezcan al mismo departamento que 'GIL'.

select dept_no, emp_no, apellido from emple where dept_no =(select dept_no  from emple where apellido like 'GIL');


-- 1) Mostrar los datos de los empleados que tengan el mismo oficio que 'CEREZO'. El resultado debe ir ordenado por apellido.


select emp_no, apellido, oficio from emple where oficio =(select oficio from emple where apellido like 'CEREZO') order by apellido asc;

-- 2) Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen el mismo oficio que 'JIMÉNEZ' o que tengan un salario mayor o igual que 'FERNÁNDEZ'.

select emp_no, oficio, salario, fecha_alt from emple where oficio=(select oficio from emple where apellido like 'JIMENEZ') or salario >=(select salario from emple where apellido like 'FERNANDEZ');


-- 3) Mostrar en pantalla el apellido, oficio y salario de los empleados del departamento de 'FERNÁNDEZ' que tengan su mismo salario.

select  apellido, oficio, salario from emple where dept_no =(select dept_no from emple where apellido like 'FERNÁNDEZ')and 
salario =(select salario from emple where apellido like 'FERNANDEZ');

-- 4) Mostrar los datos de los empleados que tengan un salario mayor que 'GIL' y que pertenezcan al departamento número 10.

select apellido, oficio, salario, fecha_alt, dept_no from emple where dept_no = 10 and salario > (select salario from emple where apellido like 'GIL');

-- 5) Mostrar los apellidos, oficios y localizaciones de los departamentos de cada uno de los empleados.

select apellido, oficio, (select loc from depart where emple.dept_no = depart.dept_no) localizacion from emple;

-- 6) Seleccionar el apellido, el oficio y la localidad de los departamentos donde trabajan los ANALISTAS.

select apellido, oficio, (select loc from depart where emple.dept_no = depart.dept_no) localizacion from emple where oficio like 'ANALISTAS';


  -- 7) Seleccionar el apellido, el oficio y salario de los empleados que trabajan en Madrid.
  
  select apellido, oficio, salario from emple, depart
  where emple.dept_no = depart.dept_no and loc = 'Madrid';
  
  select apellido, oficio, salario from emple
  where dept_no = (select dept_no from depart where loc='Madrid');
  

-- 8) Seleccionar el apellido, salario y localidad donde trabajan los empleados que tengan un salario entre 2000 y 3000.

select apellido, salario, (select loc from depart where emple.dept_no = depart.dept_no) localidad from emple
where salario between 2000 and 3000;

-- 9) Mostrar el apellido, salario y nombre del departamento de los empleados que tengan el mismo oficio que 'GIL'.

select apellido, salario, (select dnombre from depart where emple.dept_no = depart.dept_no) nombre_departamento from emple
where oficio =( select oficio from emple where apellido like 'GIL');

-- 10) Mostrar el apellido, salario y nombre del departamento de los empleados que tengan el mismo oficio que 'GIL' y que no tengan comisión.

select apellido, salario, (select dnombre from depart where emple.dept_no = depart.dept_no) nombre_departamento from emple
where oficio =( select oficio from emple where apellido like 'GIL') and comision is null;


-- 11) Mostrar los datos de los empleados que trabajan en el departamento de contabilidad, ordenados por apellidos.

select apellido, (select dnombre from depart where emple.dept_no = depart.dept_no) departamento, oficio, salario, fecha_alt from emple
where (select dnombre from depart where emple.dept_no = depart.dept_no) like 'CONTABILIDAD'  order by apellido asc;

-- 12) Apellido de los empleados que trabajan en Sevilla y cuyo oficio sea analista o empleado.

select apellido from emple, depart
where emple.dept_no = depart.dept_no and loc = 'SEVILLA' and oficio in ('ANALISTA', 'EMPLEADO');

-- 13) Calcula el salario mínimo de los empleados del departamento 'VENTAS'.

select min(salario) salario_minimo from emple join depart on emple.dept_no = depart.dept_no where dnombre like 'ventas';

-- 14) Calcula la media de salarios de los empleados del departamento de 'CONTABILIDAD'.

select avg(salario) media_salario_contabilidad from emple where dept_no = (select dept_no from depart where dnombre like 'CONTABILIDAD');

-- 15) Mostrar los datos de los empleados cuyo salario sea mayor que la media de todos los salarios.

select * from emple where salario > (select avg(salario) from emple);

-- 16) ¿Cuántos empleados hay en el departamento de 'VENTAS'?


-- 17) Calcula el número de empleados que hay que no tienen comisión.

-- 18) Seleccionar el apellido del empleado que tiene máximo salario.

-- 19) Mostrar los apellidos del empleado que tiene el salario más bajo.

-- 20) Mostrar los datos del empleado que tiene el salario más alto en el departamento de 'VENTAS'.
-- 21) A partir de la tabla EMPLE visualizar cuántos apellidos de los empleados empiezan por la letra 'A'.

-- 22) Dada la tabla EMPLE, obtener el sueldo medio, el número de comisiones no nulas, el máximo sueldo y el sueldo mínimo de los empleados del departamento 30.

-- 23) Mostrar los departamentos cuya media de salarios sea mayor que la media de salarios de todos los empleados.

-- 24) Visualizar el número de departamento que tenga más empleados cuyo oficio sea empleado.

select emple.dept_no, count(apellido) as CantidadgEmpleado from emple where oficio = 'EMPLEADO'
group by dept_no having count(apellido) >= all(select count(apellido) from emple where oficio = 'EMPLEADO' group by dept_no);

-- 25) Mostrar el número de oficios distintos de cada departamento.

-- 26) REALIZA 3 SUBCONSULTAS QUE NO SE HAYAN PLANTEADO EN LOS EJERCICIOS PROPUESTOS.
