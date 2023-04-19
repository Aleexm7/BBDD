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



