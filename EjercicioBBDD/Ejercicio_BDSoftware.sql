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

select comercio.nombre, distribuye.cantidad,programa.nombre from comercio
inner join distribuye using (cif)
inner join programa on distribuye.codigo = programa.codigo
where programa.nombre like 'Window';

-- 11) Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.

select programa.nombre, distribuye.cantidad, comercio.nombre from programa
inner join distribuye using (codigo)
inner join comercio on distribuye.cif = comercio.cif
where comercio.nombre like 'El Corte Ingles';


-- 12) ¿Qué fabricante ha desarrollado Freddy Hardest?

select fabricante.nombre, programa.nombre from fabricante
inner join desarrolla on fabricante.id_fab = desarrolla.id_fab
inner join programa on desarrolla.codigo = programa.codigo
where programa.nombre like 'Freddy Hardest';

-- 13) Selecciona el nombre de los programas que se registran por Internet.

select programa.nombre, registra.medio from programa
inner join registra on programa.codigo = registra.codigo
where registra.medio like 'Internet';

-- 14) Selecciona el nombre de las personas que se registran por Internet.

select programa.nombre, registra.medio, cliente.nombre from programa
inner join registra on programa.codigo = registra.codigo
inner join cliente on registra.dni = cliente.dni
where registra.medio like 'Internet';

-- 15) ¿Qué medios ha utilizado para registrarse Pepe Pérez?

select registra.medio, cliente.nombre from registra
inner join cliente on registra.dni = cliente.dni
where cliente.nombre like 'Pepe Perez';


-- 16) Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.

select cliente.nombre, registra.medio, programa.nombre from cliente
inner join registra on cliente.dni = registra.dni
inner join programa on registra.dni = programa.codigo
where registra.medio like 'Internet';


-- 17) Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

select cliente.nombre, registra.medio, programa.nombre, comercio.nombre from cliente
inner join registra on cliente.dni = registra.dni
inner join programa on registra.dni = programa.codigo
inner join comercio on registra.cif = comercio.cif;

-- 18) Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.

select comercio.ciudad, programa.nombre from programa
inner join comercio on programa.codigo = comercio.cif;


-- 19) Obtén el nombre de los usuarios que han registrado el programa Paradox en su versión 2

select cliente.nombre, programa.nombre, programa.version from cliente
inner join registra on cliente.dni = registra.cif
inner join programa on registra.cif = programa.codigo
where programa.nombre like 'Paradox';

-- 20) Muestra qué programas Ha comprado Pepe Perez

select programa.nombre, cliente.nombre from programa
inner join registra on programa.codigo = registra.codigo
inner join cliente on registra.cif = cliente.dni
where cliente.nombre like 'Pepe perez';

-- 21) A la consulta anterior añade también el nombre del fabricante de cada programa

select programa.nombre, cliente.nombre, fabricante.nombre from programa
inner join registra on programa.codigo = registra.codigo
inner join cliente on registra.cif = cliente.dni
inner join desarrolla on programa.codigo = desarrolla.codigo
inner join fabricante on desarrolla.id_fab = fabricante.id_fab
where cliente.nombre like 'Pepe perez';

-- 22) Cuántos productos de oracle ha comprado Pepe Perez

select programa.nombre, cliente.nombre, fabricante.nombre from programa
inner join registra on programa.codigo = registra.codigo
inner join cliente on registra.cif = cliente.dni
inner join desarrolla on programa.codigo = desarrolla.codigo
inner join fabricante on desarrolla.id_fab = fabricante.id_fab
where cliente.nombre like 'Pepe perez' and fabricante.nombre like 'Oracle';

-- 23) Cuenta el número de programas de cada fabricante

select count(p.codigo) as num_programas, f.nombre  from programa p
inner join desarrolla d on p.codigo = d.codigo
inner join fabricante f on d.id_fab = f.id_fab
group by f.nombre;

-- 24) Muestra los comercios, los programas que distribuyen y los fabricantes

select c.nombre, p.nombre, f.nombre  from comercio c
inner join distribuye d on c.cif = d.cif
inner join programa p on d.codigo = p.codigo
inner join desarrolla on p.codigo = desarrolla.codigo
inner join fabricante f on desarrolla.id_fab = f.id_fab;


-- 25) Qué comercios distribuyen programas de Microsoft

select c.nombre, p.nombre from programa p
inner join distribuye d on p.codigo = d.codigo
inner join comercio c on d.cif = c.cif
where p.nombre like 'Microsoft';

