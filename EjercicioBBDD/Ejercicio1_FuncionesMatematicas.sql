-- FUNCIONES MATEMATICAS

-- Modulo
select mod(8,4) modulo;

select 4/2 division;

select 4 div 2 division_Entera;

-- Raiz cuadrada

select sqrt(9) raiz_Cuadrada;

-- REDONDEO

select round(21.05678); 
select round(21.05678, 0); 
select round(21.05678, 3);

select ceil(21.05678)redondeo_Alto , floor(21.05678) redondeo_Bajo;

-- Elevar un numero
select pow(5,6); 


/* FUNCIONES DE CADENAS */

select length('comprobar longitud');

select char_length('Arbol');

select instr('Almacen', 'Alma');

select strcmp('RAMA', 'rama');

use automoviles;
select concat(nombre, '---',direccion) datos_personales from clientes;


select right('Monarquia', 4);

select left('Monarquia', 4);

select reverse('Hola');

select upper('verano');
select lower('VERANO');


select trim('     Vaya calor que hace      '); 
select ltrim('     Vaya calor que hace');
select rtrim('Vaya calor que hace     '); 


select substring('Disfruta', 2); 

select substring('Disfruta', 4, 3);


select substring_index('frase-para-usar-substring', '-', 3);

select replace('Elegante', 'Eleg', 'Discrep')reemplaza;
