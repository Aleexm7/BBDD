-- 1. Haz un select a cada tabla para saber el número de registros que tiene cada una. Observa los campos y los datos que contienen.

select * from alumnos, asignaturas;

-- 2. Ordena la tabla asignaturas por departamento descendente y nombre asignaturas ascendente.

select codigo, nombre, departamento from asignaturas order by departamento desc, nombre asc;

-- 3. Devuelve el nombre y apellidos de los 5 primeros alumnos y el departamento al que pertenecen, ordenados por departamento.
select al.nombre, al.apellidos, a.departamento from alumnos as al
join asignaturas as a on al.codigo_asignatura = a.codigo
order by codigo_alumno, a.departamento asc
limit 5;

-- 4. Muestra las diferentes provincias de los alumnos.

select distinct provincia from alumnos;

-- 5. Cuenta el númro de alumnos que tengo de diferentes provincias. Debe aparecer el nombre de la provincia y en número de alumnos.
select count(dni) as 'Num alum', provincia from alumnos group by provincia;

/*6. Muestra la información siguiente con estos "Alias". Y ordena por orden alfabético los alumnos.
Codigo_alumno= Código del alumno.
Apellidos= Apellidos del alumno
Direccion= Direción del alumno.
Asignaturas.nombre= "Asignatura que cursa el alumno"
Asignaturas.departamenteo="Departamento al que corresponde el alumno" */

select alumnos.Codigo_alumno as "Codigo del alumno", alumnos.Apellidos as "Apellidos del alumno", alumnos.Direccion as "Direccion del alumno", asignaturas.Nombre as "Asignatura que cursa el alumno", asignaturas.Departamento as "Departamento al que corresponde el alumno"
from alumnos join asignaturas on Codigo_asignatura = Codigo order by alumnos.Apellidos asc;

-- 7. Muestra los datos de los alumnos cuyo código postal es menor de 28000.
select * from alumnos where cp < 28000;

-- 8. Muestra los datos de los alumnos cuyo código postal está entre 14100 y 28000 (ambos imcluídos). Utiliza and y between. Luego muestra los que NO están incluídos (usando AND y between).
select * from alumnos where cp >= 14100 and cp <= 28000;

select * from alumnos where cp between 14100 and 28000;

select * from alumnos where cp <=14100 or cp >=28000;

 
-- 9. Muestra código alumno, nombre y apellido de los alumnos que son de Córdoba o Madrid y además su código_asignatura sea igual 1 ó 4.
select codigo_alumno, nombre, apellidos, provincia, codigo_asignatura from alumnos where (provincia = "Madrid" or provincia = "Cordoba") and (codigo_asignatura = 1 or codigo_asignatura = 4);

select codigo_alumno, nombre, apellidos, provincia, codigo_asignatura from alumnos where provincia in ("Madrid" ,"Cordoba") and codigo_asignatura in (1, 4);
-- 10. Muestra código alumno, nombre y apellido de los alumnos y nombre de la asignatura, cuyo código de alumno está entre 104 y 108 y cursan la asignatura "Administración de Base de datos"
select al.codigo_alumno, al.nombre, al.apellidos, al.provincia, a.nombre from alumnos as al 
join asignaturas as a on a.codigo  = al.codigo_asignatura
where (al.codigo_alumno between 104 and 108) and (a.nombre = "Administración de Base de datos"); 

-- 11. Quiro saber cuántas horas lectivas tiene cada asignatura (un crédito = 25 horas lectivas)
select  nombre, creditos*25 as "Horas lectivas" from asignaturas;

-- 12. Muestra los datos de los 5 primeros alumnos matriculados(consideramos que el orden de matrícula es el orden de inserción en la tabla) (Utiliza IF). El resultado de la función IF debe aparecer con el Alias PRIMERAS_MATRICULAS Si es uno de los 5 primeros alumnos matriculados debe aparecer la leyenda 'Cincuenta primeros matriculados',  en caso contrario debe aparecer la leyenda 'Resto de alumnos matriculados'
select *,
if(codigo_alumno < 105, 'Primeras Matriculados', 'Resto de matriculados') as 'Primeras matriculas' 
from alumnos;

-- 13.  Muestra las direcciones que comiencen por C/
select direccion from alumnos where direccion like 'C/%';


-- 14. Muestra los alumnos cuyo segundo apellido sea García.
select codigo_alumno, nombre, apellidos, direccion from alumnos 
WHERE apellidos like '%García';

-- 15. Muestra los alumnos cuyo segundo apellido no sea García.
select codigo_alumno, nombre, apellidos, direccion from alumnos 
WHERE apellidos not like '%García';

-- 16. Muestra los alumnos cuyo primer apellido sea García.
select codigo_alumno, nombre, apellidos, direccion from alumnos 
WHERE apellidos like 'García%';

-- 17. Muestra los alumnos que tengan el apellido García, da igual si primero o segundo.
select codigo_alumno, nombre, apellidos, direccion from alumnos 
WHERE apellidos like '%García%';

-- 18) Muestra los alumnos cuyo segundo apellido sea Estrada o López
select codigo_alumno, nombre, apellidos, direccion from alumnos 
WHERE (apellidos like '%Estrada' or apellidos like '%López');

-- 19) Muestra los alumnos de la comunidad de Valencia (utiliza operador IN en una consulta y en otra diferente el  operador LIKE) 
-- provincias= Alicante , Castellón y Valencia .
select * from alumnos where provincia in ('Valencia', 'Castellón', 'Alicante');

select * from alumnos where (provincia like 'Castellón' or provincia like 'Valencia' or provincia like 'Alicante');

-- 20 Muestra los datos de todos los alumnos, busca los ANDALUCES (COMPRUEBA LAS 8 PROVINCIAS) utiliza IF, debe aparecer la leyenda “Alumno Andaluz” y en caso contrario “lo siento, no eres Andaluz”, ordena de forma que primero salgan los andaluces.
select nombre, provincia, 
if((provincia like 'Huelva' or provincia like 'Sevilla' or provincia like 'Cordoba' or provincia like 'Jaen' or provincia like 'Malaga' or provincia like 'Granada' or provincia like 'Almeria'),'Alumno Andaluz', 'lo siento, no eres Andaluz' ) as Comunidad
from alumnos;

select nombre, provincia, 
if(provincia in ('Huelva','Sevilla','Cordoba','Jaen','Malaga','Granada','Almeria'),'Alumno Andaluz', 'lo siento, no eres Andaluz') as Comunidad
from alumnos;

-- 21) Muestra los 4 departamentos que existen y Cuenta las asignaturas que tiene cada departamento. 
select departamento, count(nombre) 'Num alumno' from asignaturas group by departamento;

-- 22) Muestra las asignaturas que existen (y sus créditos) y cuenta el número de alumnos matriculados en cada una de ella.
select asi.nombre, asi.creditos, count(a.DNI) as 'Alumnos matriculados' from asignaturas as asi
left join alumnos as a on asi.codigo = a.codigo_asignatura
group by asi.codigo;

-- 22) Muestra las asignaturas que existen (y sus créditos) y cuenta el número de alumnos matriculados en cada una de ella, pero sólo de las asignaturas de más de 15 créditos.
select asi.nombre, asi.creditos, count(a.DNI) as 'Alumnos matriculados' from asignaturas as asi
join alumnos as a on asi.codigo = a.codigo_asignatura
where creditos >15
group by asi.codigo;

-- 23) Cuenta cuántos alumnos tengo de Madrid en cada asignatura (Muestra el nombre de la asignatura y el número de alumnos)
select count(codigo_alumno) cant_alum, a.nombre, provincia from alumnos 
join asignaturas as a on codigo_asignatura = codigo where provincia = 'Madrid' group by a.nombre;

-- 24) Añade lo que haga falta a la consulta anterior para mostrar sólo las asignaturas que tienen más de un alumno matriculado de Madrid.
select count(codigo_alumno) cant_alum, a.nombre, provincia from alumnos 
join asignaturas as a on codigo_asignatura = codigo where provincia = 'Madrid' group by a.nombre having cant_alum >1;

-- 25) Muestra la Suma de los créditos de todas las asignaturas que tiene cada uno de los departamentos. 
select departamento, sum(creditos) total_creditos from asignaturas group by departamento;

-- 26) A la consulta anterior. Solo sumaré las asignaturas de más de 10 créditos.
select departamento, sum(creditos) total_creditos from asignaturas where creditos >10 group by departamento;

-- 27) A la consulta anterior. Sólo mostraré los departamentos que oferten más de 25 créditos en total
select departamento, sum(creditos) total_creditos from asignaturas where creditos >10 group by departamento having total_creditos > 25;