-- 1. LISTA TODAS LAS TABLAS Y OBSERVA LOS DATOS

select *from cliente
inner join registra using (dni)
inner join comercio using (cif)
inner join distribuye using (cif)
inner join programa on distribuye.codigo = programa.codigo
inner join desarrolla on programa.codigo = desarrolla.codigo
inner join fabricante using (id_fab);

-- -- 2) ¿Cuáles son los programas cuyo código es inferior o igual a 10?

select * from programa
where programa.codigo <= 10 ;

-- 3) ¿Cuál es el programa cuyo código es 11?

select * from programa
where programa.codigo = 11 ;

-- 4) ¿Qué fabricantes son de Estados Unidos?

select nombre, pais from fabricante
where fabricante.pais like 'estados unidos';

-- 5) ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.
select nombre, pais from fabricante
where pais not in ('España');


-- 6) Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN y otra sin BETWEEN.

select nombre, edad from cliente
where edad between 10 and 25 or edad > 50; 

select nombre, edad from cliente
where ( edad >= 10 and edad <= 25 or edad  > 50);

-- 7) Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.

select distinct * from comercio
where ciudad in ('Sevilla','Madrid');

-- 8) Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.

select nombre, version from programa
where version like '%i' or nombre like 'A%s';


-- 9)Genera un listado de los programas que desarrolla Oracle.

select programa.nombre, fabricante.nombre, fabricante.pais from programa
inner join fabricante on programa.codigo = fabricante.id_fab
where fabricante.nombre like 'Oracle';

-- 10) ¿Qué comercios distribuyen Windows?

select comercio.*, distribuye.*,programa.* from comercio
inner join distribuye on comercio.cif = distribuye.cif
inner join programa on distribuye.codigo = programa.codigo
where programa.nombre like 'Window';

-- 11) Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.



-- 12) ¿Qué fabricante ha desarrollado Freddy Hardest?



-- 13) Selecciona el nombre de los programas que se registran por Internet.

-- 14) Selecciona el nombre de las personas que se registran por Internet.

-- 15) ¿Qué medios ha utilizado para registrarse Pepe Pérez?

-- 16) Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.

-- 17) Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

-- 18) Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.

-- 19) Obtén el nombre de los usuarios que han registrado el programa Paradox en su versión 2

-- 20) Muestra qué programas Ha comprado Pepe Perez

-- 21) A la consulta anterior añade también el nombre del fabricante de cada programa

-- 22) Cuántos productos de oracle ha comprado Pepe Perez

-- 23) Cuenta el número de programas de cada fabricante

-- 24) Muestra los comercios, los programas que distribuyen y los fabricantes

-- 25) Qué comercios distribuyen programas de Microsoft