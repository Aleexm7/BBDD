/* 1) El departamento de ventas de Valencia contrata a un nuevo vendedor, con
un salario base de 6000 y una comisión de 1000
- Se llama Pepe Ruiz, dni = 30.123.123 y nació el 20 de abril de 1998 .*/
-- A) INSERTA EL REGISTRO EN LA TABLA EMPLEADOS.
INSERT INTO `bd_oficina`.`empleados` (`nDIEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('30.123.123', 'Pepe Ruiz', 'M','1998-04-20', '2023-02-19', '6000', '1000', 'Vendedor', '31.178.144', '2200');

-- B) COMPRUEBA EL RESULTADO.
select * from empleados where nDIEmp = '30.123.123';




/* 2) El departamento de investigación de Ciudad Real contrata un nuevo
empleado, con un salario base de 12000 y 0 comisión.
- Se llama Ana García, dni = 30.111.123 y nació el 14 de mayo de 1995 .*/ 
-- A) INSERTA EL REGISTRO EN LA TABLA EMPLEADOS.
INSERT INTO `bd_oficina`.`empleados` (`nDIEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('30.111.123', 'Ana García', 'F','1995-05-14', '2023-02-19', '12000', '0', 'Investigador', '16.759.060', '3000');

-- B) COMPRUEBA EL RESULTADO.
select * from empleados where nDIEmp = '30.123.123';


-- 3) MODIFICACIÓN. Ha habido un error, la fecha de nacimiento de Ana García es el 15 de mayo de 1995
UPDATE empleados
    SET fecNac = '1995-05-15'
    WHERE (nDIEmp = '30.111.123');

-- 4) MODIFICACIÓN. Disminuimos un 5% todas las comisiones
update empleados 
     set 
	 where 

-- 5) MODIFICACIÓN. volvemos a dejar las comisiones como estaban, subimos el 5%. Fórmula: cantidad / (1 - 0.05)


-- 6) ELIMINACIÓN. Despedimos a los últimos empleados, con lo que vamos a eliminar de la BD los dos empleados introducidos en los ejercicios 1 y 2.
DELETE FROM empleados WHERE nDIEmp = '30.123.123' and nDIEmp = '30.111.123';