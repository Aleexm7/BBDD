create database if not exists PRUEBA_PROCEDIMIENTOS;
use PRUEBA_PROCEDIMIENTOS;

-- Ejemplo 1)
drop procedure if exists nuevo_proc; -- Solo se pone el nombre del procedimiento sin paréntesis

-- Ponemos el delimitador, se puede poner // o **

delimiter // 
create procedure nuevo_proc()
begin
	
    select "Hola mundo" as saludo;
    
end //
-- Aqui se cambia el delimitador para seguir usando las sentencia de SQL
delimiter ; 

-- Llamamada al procedimiento
call nuevo_proc();

-- ¿Cómo se puede llamar este metodo desde otra BBDD? 
use usuarios_telefono;

call PRUEBA_PROCEDIMIENTOS.nuevo_proc();

-- SENTENCIAS DE VISUALIZACION DE PROCEDIMIENTOS
show create procedure nuevo_proc;

-- Listar los procedimientos de una base de datos

show procedure status where DB = 'PRUEBAS_PROCEDIMIENTOS';

-- Ejemplo 2)
drop procedure if exists listaProductos;

delimiter //

create procedure listaProductos()
begin
		select id, nombre, estado from productos;
end //

delimiter ;

call listaProductos;

-- Ejemplo 3) con un parametro de entrada
drop procedure if exists productosEstados;


delimiter //

create procedure productosEstados(in nom_estado varchar(20))
begin

	select * from productos where estado = nom_estado;

end //
delimiter ;

call productosEstados('disponible');
call productosEstados('agotado');

-- Usando una variable
set @estado='disponible';
call productosEstados(@estado);


-- Ejemplo 4) un parametro de entrada y otro de salida. Recibe el nombre del estado y devuelve el numero de productos de ese estado
drop procedure if exists contarProductoEstado;

delimiter //

create procedure  contarProductoEstado(in nom_Estado varchar(20), out num int)
begin
	select count(id) into num from productos where estado = nom_Estado;

end //

delimiter ;

set @estado='agotado';
call contarProductoEstado(@estado, @numero);

select @estado, @numero;


-- Ejemplo 5) Con tres parametros- mostramos superficie y poblacion de un pais enviado como parametro
-- Recibe un parámetro y devuelve dos
use world;

drop procedure if exists poblacion_superf_pais;

delimiter //

create procedure poblacion_superf_pais(out poblacion int, out superficie decimal(10,2), in codigoPais char(3))
begin

	select population, surfaceArea into poblacion, superficie from country where code = codigoPais;
    
end //
delimiter ;

set @pais='ESP';

call poblacion_superf_pais(@poblacion,@superficie,@pais);

select @pais as pais, @poblacion as poblacion, @superficie as superficie;





