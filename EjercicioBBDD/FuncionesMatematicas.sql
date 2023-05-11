-- FUNCIONES MATEMATICAS

-- Modulo
select mod(6,2) modulo; -- Resto 0

select mod(6,5) modulo; -- Resto 1

select 6/2 division; -- cociente 3

select 6 div 2; -- division entera 3

-- Raiz cuadrada

select sqrt(9) raiz; -- 3

-- PI

select pi();

-- REDONDEO

select round(12.3567), round(12.3567, 0), round(12.3567, 3), round(12.3567, 2), round(12.3567, 1);

select ceil(12.3567) , floor(12.3567);

-- Elevar un numero
select pow(2,3); -- 2 * 2 * 2 = 8

set @radio = 30;
select round((2 * PI() * @radio), 2) Area_Circulo; -- redondeamos a 2 decimales

/* FUNCIONES DE CADENAS */

select length('cañón'); -- Longitud en bytes

select char_length('cañón'); -- Longitud en caracteres

-- instr(cadena1, cadena2) -> Devuelve el indice de la primera ocurrencia de la subcadena

select instr('MySQL', 'SQL'); -- Devuelve 3

-- strcmp(cadena1, cadena2) -> Si las dos cadenas son iguales, devuelve 0. Si cadena1 es mayor que cadena2, devuelve -1. Si cadena2 es mayor que cadena1 devuelve 1

select strcmp('ALMA', 'alma'); -- Devuelve 0

set @clave = 'Pepe';
select nombre, @clave, if(strcmp(nombre, @clave) = 0, 'son iguales', 'son distintos') comparacion from alumnos;

-- concat() -> concatena cadenas

select concat(nombre, '---', apellidos) alum from alumnos;

-- right(cadena1, num_caracteres) -> Devolvera el numero de caracteres que le indiquemos empezando por la derecha de la cadena
select right('MySQL', 3);
-- left(cadena1, num_caracteres) -> Devolvera el numero de caracteres que le indiquemos empezando por la izquierda de la cadena
select left('MySQL', 2);

-- reverse(cadena) -> Devuelve la cadena invertida
select reverse('radar');
select reverse('viejo');

-- upper(cadena) y lower(cadena)
select upper('teclado');
select lower('TECLADO');

-- trim() ltrim() y rtrim()

select trim('     Vaya calor que hace      '); -- Solo quita los espacio en blanco tanto a la izquierda como derecha
select ltrim('     Vaya calor que hace'); -- Solo quita los espacio en blanco de  la izquierda
select rtrim('Vaya calor que hace     '); -- Solo quita los espacio en blanco de la derecha

-- substring(cadena, posicion, longitud) -> Devuelve subcadena con posición(inicio) y fin (longitud), si no se pone nada en el tercer parametro, nos devuelve hatsa el final

select substring('Bienvenidos', 2); -- Devuelve "ienvenidos"

select substring('Bienvenidos', 4, 3); -- Devuelve "nve"

select substring('Bienvenidos', 1, 4); -- Devuelve "Bien"

-- substring_index2(cadena, delimitador, izquierda/derecha) -> numero positivo izquierda, numero negativo a la derecha

select substring_index('gato-perro-pato', '-', 1); -- Devuelve gato
select substring_index('gato-perro-pato', '-', 2); -- Devuelve gato-perro
select substring_index('gato-perro-pato', '-', -1); -- Devuelve pato


-- replace(cadena, cadena_buscar, cadena_reemplaza)
select replace('MySQL.com', '.com', '.es')reemplaza;

-- Ejercicio 
set @clave = 'Ana';
select reverse(nombre), if(strcmp(nombre, @clave)=0,'son palindromo', ' no son palindromo') from alumnos;










