-- 1. obtener únicamente la inicial de los nombres de los usuarios.
select nombre, left(nombre, 1) as iniciales from Usuarios;

-- 2. Obtener el identificador del nombre de usuario. Ejem: BRE2271 , hay que obtener 2271
select nombre, usuario, right(usuario, 4) as id from Usuarios;

-- 3. Obtener los caracteres del nombre de usuario, . Ejem: BRE2271 , hay que obtener BRE. De aquellos usuarios varones. Realizar la consulta igual, pero para los que no son varones.

select nombre, usuario, substring(usuario, 1, 3) as caracteres from Usuarios where sexo like 'H';
select nombre, usuario, substring(usuario, 1, 3) as caracteres from Usuarios where sexo not like 'H';

-- 4. Realiza una consulta que Imprima los registros con el siguiente formato: Ejem: El usuario: HUG5441, se llama HUGO, tiene el correo: hugo@live.com y usa un MOTOROLA

select concat('El usuario: ',' ', usuario,' ', 'se llama ', ' ', nombre, 'su correo es: ', ' ', email, ' ', 'y usa un', ' ',marca) datos  from Usuarios;

-- 5. Devolver la letra inicial más la letra final y longitud del nombre de los usuarios

select nombre, concat(left(nombre, 1), ' ', right(nombre, 1), ' ', char_length(nombre)) as clave from Usuarios;


-- 6. Localizar la posición donde se encuentra la primera  letra r en el campo nombre

select nombre, instr(nombre, 'r') as posicion_r from Usuarios;

-- 7 Imprimir hombre o mujer según sea el caso, seguido del nombre del usuario

select
    case sexo 
        when 'H' then 'hombre' 
        when 'M' then 'mujer' 
    end as sexo, 
    nombre 
from Usuarios;


select concat(if(sexo = 'H', 'Señor', 'Señora'), ' ', nombre) as nombreFormal from Usuarios;

-- 8- Aumenta el saldo de los usuarios de la compañía MOVISTAR en un 25%. Redondea el resultado. Realiza la actualización en la base de datos.

select nombre,saldo, round(saldo + saldo * 0.25, 2) as saldo2 from Usuarios; -- Comprobar el aumento del saldo
update Usuarios set saldo = round(saldo + saldo * 0.25, 2); -- Establecemos el aumento 
select nombre, saldo from Usuarios;

-- 9 Muestra el nombre del usuario y el dominio en el que tienen el correo electrónico.

select nombre, substring_index(email, '@', 1) as nombre_usuario, substring_index(email, '@', -1) as dominio from Usuarios;

-- 10. Indica quiénes son los usuarios activos e inactivos en nuestra web, indicándolo con un texto identificador, muestra además los campos que nos servirían para ponernos en contacto con ellos.

select concat('El usuario ', nombre, ' está ', if(activo = 1, ' activo. ', ' inactivo. '), ' Puedes contactar en el telefono ', telefono, ' o en el correo electronico ', email) as estado from Usuarios;

-- 11. Muestra los datos de los usuarios con saldo cero e indica si están activos o inactivos.

select nombre, saldo , activo, if(activo = 1, 'Activo', 'No Activo') as 'Estado de actividad' from Usuarios where saldo = 0;
