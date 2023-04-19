/*----------SUBCONSULTA DE TIPO TABLA --------------
Clausula FROM.
Obten el nombre, la region, el continente y el presidente del gobierno de los paises del mundo que todavía no se han independizado

---------------------------------------------------*/

select Name, Region, Continent, HeadOfState
from (select * from country where IndepYear is null) as independencia;

create view nose
as
select * from country where IndepYear is null;



/*--------USO DE OPERADORES------

1. Clausula ALL, ANY y SOME
2. Clausula ALL

Ejemplo: Muestra la poblacion y los paises donde la poblacion sea mayor que la medida de poblaciones de todos los continentes
*/

/* 1. Media de poblacion de los continentes y su nombre */

select continent, avg(population) as media from country group by continent;

/* subconsulta */

select name pais, population from country where population > all (select avg(population) as media from country group by continent);