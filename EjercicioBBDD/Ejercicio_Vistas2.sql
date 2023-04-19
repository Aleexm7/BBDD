-- Ejercicios 1
-- 1) Crea una vista de la tabla Country llamada Países, que muestre todos los países cambiando el nombre de los campos a castellano.

create or replace view Paises as 
select Code as codigo, Name as Nombre, Continent as Continente, Region as region, SurfaceArea  as area, IndepYear as anioIndepen
from country;

select * from Paises;
-- 2) Crea una vista VistaEuropa de la tabla City, que muestre todos los datos de las ciudades del continente europeo (cambiar el código del país por su nombre), cambiando el nombre de los campos a castellano.

create view VistaEuropa as 
select ID as codigo, Name as Nombre, CountryCode as cod_pais, District as barrio, Population as Poblacion
from city;

select * from VistaEuropa;
-- 3) CREA una vista VISTA_CAPITALES en la que aparezca el código, nombre, continente y region de los países junto con el nombre de su capital. Los campos de la vista en castellano.

create or replace view VISTA_CAPITALES as 
select country.Code as Codigo, country.Name as Pais, country.Continent as Continente, country.Region as Region, city.Name as Capital
from country
join city on country.Capital = city.ID;

select * from VISTA_CAPITALES;
-- Ejercicios 2
-- 1. Crea una vista llamada iberia, basada en la table city que solo tenga el nombre, la región y la población de las ciudades españolas.

create or replace view iberia as 
select Name, District, Population
from city
where CountryCode = 'ESP';

select * from iberia;
-- 2. Vuelve a crear la vista iberia, pero solamente con las ciudades andaluzas.

create or replace view  iberia as 
select Name, District, Population
from city
where CountryCode = 'ESP' and District = 'Andalusia';

select * from iberia;
-- a. ¿Qué ocurre? 
-- Dará un error de que la vista iberia ya existe

-- b. ¿Cómo se soluciona?
--  Debemos utilizar la clausula OR REPLACE
-- 3. ¿Se pueden crear vistas basadas en INNER JOINS? Pon un ejemplo

create view prueba as 
select country.Name as Pais, city.Name as Capital, city.Population as Poblacion
from country
inner join city on country.Capital = city.ID;

-- 4. Crea una vista llamada “nocapital” que obtenga el nombre, el continente y la población de los países que no tienen capital.

create or replace view nocapital as
select country.Name, country.Continent, country.Population
from country
where Capital is null;

select * from nocapital;
/* 4-b Crea una vista llamada “nocapital” que obtenga
el nombre, el continente y la población de las ciudades que no sean capital.*/

create or replace view nocapital as
select city.Name, country.Continent, city.Population
from city
join country on city.CountryCode = country.Code
where city.ID <> country.Capital  OR country.Capital is null;

select * from nocapital;

-- 5. Obtén una vista llamada “capitales” que muestre el nombre de la ciudad, el nombre del país y el continente de las ciudades que son capital de algún país.

create view capitales as 
select city.Name as ciudad, country.Name as pais, country.Continent as continente
from city
join country on city.ID = country.Capital;

select * from capitales;
-- 6. Crea una vista llamada “ciudades_esp” con el nombre del país, el nombre de la ciudad y el continente de las ciudades de España que no son capital.

create or replace view ciudades_esp as
select country.Name as pais, city.Name as ciudad, country.continent as continente
from country
join city on country.Code = city.CountryCode
where country.Name = 'Spain' and city.ID <> country.Capital;

select * from ciudades_esp;

-- 8. Cree la vista ciudades_esp2, basada en la vista ciudades_esp.
create or replace view ciudades_esp2 as
select *
from ciudades_esp;

select * from ciudades_esp2;
-- 9. Elimine la vista base de ciudades_esp2. Compruebe qué ocurre en la vista ciudades_esp2.

drop view if exists ciudades_esp;

-- 10. Cuando creamos una vista con un campo calculado, una función, sum(), etc. Qué ocurre? REALIZA TODAS LAS COMPROBACIONES NECESARIAS.

create view poblacion_continente as
select country.Continent as continente, sum(city.Population) as poblacion
from country
join city on country.Code = city.CountryCode
group by country.Continent;

select * from poblacion_continente;
-- Ejercicios 3
-- 1) Utiliza la BD colegio y crea 5 vista HAZ PRUEBAS Y DOCUMENTA TODO EL PROCESO.

create view alumnos_cordoba as -- Se utiliza la cláusula AS seguida de la consulta que define la vista.  
select DNI,Nombre, Apellidos, Localidad -- Selecciona las columnas DNI, Nombre, Apellidos y Localidad de la tabla alumnos
from alumnos
where Localidad = 'Cordoba'; -- solo las filas en las que la localidad sea "Cordoba".

create view asignatura_BBDD as
select asignaturas.Departamento, alumnos.Nombre, alumnos.Apellidos, alumnos.DNI 
from asignaturas
right join alumnos on asignaturas.Codigo = alumnos.Codigo_asignatura  
where asignaturas.Departamento = 'Base de Datos';

select * from asignatura_BBDD;
-- 2) Utiliza la BD tienda_informatica y crea 5 HAZ PRUEBAS Y DOCUMENTA TODO EL PROCESO.

-- EJERCICIO 4
-- Crea dos ejercicios de UNION para cada una de las BD de este ejercicio. Es decir, una con UNION Y OTRA CON UNION ALL , para cada una de las BD.