
-- 2. Inserta los registros en las tablas LIBROS y EDITORIALES. Practica utilizando
-- diferentes modalidades de la sentencia INSERT.

-- EDITORIALES
insert into editoriales(codigo, nombre) values (1, 'Paidos');

insert into editoriales(codigo, nombre) values (2, 'Emece');
insert into editoriales(codigo, nombre) values (3, 'Planeta');
insert into editoriales(codigo, nombre) values (4, 'Sudamericana');

-- LIBROS
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (1, 'El Aleph', 'Borges', 3, 43.50, 200);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (2, 'Alicia en el pais de las maravillas', 'Lewis Carroll', 2, 33.50, 100);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (3, 'Aprenda PHP', 'Mario Perez', 1, 55.80, 50);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (4, 'Java en 10 minutos', 'Juan Lopez', 1, 88.00, 150);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (5, 'Alicia a traves del espejo', 'Lewis Carroll', 1, 15.50, 80);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (6, 'Cervantes y el quijote', 'Borges-Bioy Casares', 3, 25.50, 250);
insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (7, 'Aprenda Java en 10 minutos', 'Lopez Juan', 4, 28.00, 100);

-- 3) MODIFICACIONES.
-- a) La editorial Paidos pasa a llamarse ANAYA y la editorial Emece se llamará Grijalbo.

update editoriales set nombre = 'ANAYA' where codigo = 1;

-- b) El libro Apreda PHP también ha sido escrito por Ana Torroja, añadirla

insert into libros(codigo, titulo, autor, codigoeditorial, precio, cantidad) values (8, 'Aprenda PHP', 'Ana Torroja', 1, 30.50, 180);

-- c) Ha habido un error en la introducción de datos, el libro Java en 10 minutos, en realidad se
-- llama Aprenda Java 8 en hora y media.

update libros set titulo = 'Aprenda Java 8 en hora y media' where codigo = 4;

-- d) El autor del libro con código 7 tiene el apellido antes que el nombre. CORREGIRLO.

update libros set autor = 'Juan Lopez' where codigo = 7;

-- e) Rebajas. Disminuye el precio de los libros un 10%.

UPDATE libros SET precio = precio * 0.9;


-- f) INVÉNTATE 3 SENTENCIAS DE MODIFICACIÓN.
insert into editoriales (codigo, nombre) values ( 5 ,'Occiden');

insert into libros (codigo, titulo, autor, codigoeditorial, precio, cantidad) values (9, 'The hill House', 'Bruno Brennes', 5, 20.30, 250);

-- 4) CONSULTAS.
-- a) Muestra cada libro junto a su editorial

select libros.titulo, editoriales.nombre from libros
join editoriales ON libros.codigoeditorial = editoriales.codigo;

-- b) Cuenta los libros que tiene cada editorial.

select editoriales.nombre, count(libros.codigo) as cantidad_libros
from libros
join editoriales on libros.codigoeditorial = editoriales.codigo
group by editoriales.nombre;


-- c) Cuánto dinero tenemos invertido en cada editorial?

select editoriales.nombre, sum( libros.precio) as dinero_invertido
from libros
join editoriales on libros.codigoeditorial = editoriales.codigo
group by editoriales.nombre;


-- d) Cuánto dinero tenemos invertido en total?

select editoriales.nombre, sum( libros.precio *  libros.cantidad) as dinero_invertido
from libros
join editoriales on libros.codigoeditorial = editoriales.codigo
group by editoriales.nombre;

-- e) Cuenta los libros que tiene cada autor.

select count(codigo) as total, autor from libros
group by autor;

-- 5) COPIA DE TABLAS.
-- a) Copia la tabla LIBROS (vacía) a otra tabla llamada libros_vendidos (¡¡NO CREES FORANEAS!!)

create table libros_vendidos like libros;

-- b) Vendemos un ejemplar de El Alep de Borges.
-- - Disminuimos en una unidad el libro en la tabla LIBROS.

update libros set cantidad = cantidad -1 where codigo = 1;

-- -  Insertamos el registro en la tabla libros_vendidos , la cantidad = 1 .

-- c) Vendemos otro ejemplar de El Alep de Borges.
-- - Disminuimos en una unidad el libro en la tabla LIBROS.

update libros set cantidad = cantidad -1 where codigo = 1;
-- - Sumamos una unidad al campo cantidad del registro en libros_vendidos ,
-- d) Vendemos todos los ejemplares de Alicia en el pais de las maravillas.

update libros set cantidad = 0 where codigo = 2;

-- 6) ELIMINACIÓN.
-- a) Como hemos vendido todos los ejemplares de Alicia en el pais de las maravillas, y no vamos a
-- encargarlo más a la editorial. ELIMINAMOS EL REGISTRO EN LA TABLA LIBROS.

delete from libros where titulo='Alicia en el pais de las maravillas';

-- b) Qué ocurre si elimino la editorial ANAYA.
--  1) Comprueba que la integridad referencial de la clave foránea es NO ACTION.
--  2) Cambia a CASCADE.
-- * Haz comprobaciones y redacta los resultados.
