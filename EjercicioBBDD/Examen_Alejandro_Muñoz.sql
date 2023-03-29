-- Ejercicio 1
drop database automoviles;

CREATE DATABASE IF NOT EXISTS automoviles DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
USE automoviles;

CREATE TABLE clientes (
	nif CHAR(9) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	direccion VARCHAR(50) NULL,
    telefono VARCHAR(20) NULL,
	PRIMARY KEY (nif)
) ;

CREATE TABLE coches (
	matricula CHAR(8) NOT NULL,
	marca VARCHAR(20) NULL,
	modelo VARCHAR(20) NULL,
    color VARCHAR(20) NULL,
    precio DECIMAL(10,2) NOT NULL Check (precio > 0),
    nif_cliente CHAR(9) NOT NULL,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_coches_clientes FOREIGN KEY (nif_cliente) REFERENCES clientes (nif) ON UPDATE CASCADE ON DELETE CASCADE
	
) ;


CREATE TABLE revisiones (
	codigo INT NOT NULL  Check (codigo > 0),
	matricula_coche CHAR(8)  NOT NULL,
    fecha date NULL,
	filtro TINYINT(1) NULL default 0,
    aceite TINYINT(1) NULL default 0,
    frenos TINYINT(1) NULL default 0,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_coches_revisiones FOREIGN KEY (matricula_coche) REFERENCES coches (matricula) ON UPDATE CASCADE ON DELETE CASCADE
	
) ;

INSERT INTO clientes VALUES
  ('111A', 'Ignacio Munda', 'Murcia', '555-11-22-33'),
  ('222B', 'Julia Otero', 'Burgos', '555-00-33-44'),
  ('333C', 'Pedro Almodóvar', 'Cádiz', '555-99-88-00'),
  ('444D', 'David Egea', 'Vizcaya', '555-00-88-77');
INSERT INTO clientes VALUES
  ('555E', 'Pepe Ruiz', 'Córdoba', '957-11-22-33'),
  ('666F', 'Carmen Romero', 'Córdoba', '957-00-33-44'),
  ('777G', 'Julio Romero', 'Sevilla', '955-00-33-44');



INSERT INTO coches VALUES
  ('2222-BBB', 'seat', 'ibiza', 'blanco', 12000, '111A'),
  ('3333-CCC', 'seat', 'toledo', 'gris', 18000, '222B'),
  ('4444-DDD', 'renault', 'clio', 'rojo', 15000, '222B'),
  ('6666-FFF', 'renault', 'megane', 'blanco', 19000, '444D');

INSERT INTO revisiones VALUES
  (1, '2222-BBB', '2022-01-01', 1, 0, 1),
  (2, '3333-CCC', '2022-02-15', 1, 1, 1),
  (3, '4444-DDD', '2021-12-15', 0, 0, 1),
  (4, '2222-BBB', '2021-11-05',1, 0, 1),
  (5, '3333-CCC', '2021-10-25', 1, 1, 0);
-- Ejercicio 2

-- 1)
update coches set matricula = '2000-BBB' where matricula= '2222-BBB';

SELECT * FROM coches;

-- 2) 
INSERT INTO coches VALUE('1212-ABC','Seat', 'Malaga', 'rojo',10000,'777G');

SELECT c.nombre, coches.matricula, coches.marca, coches.modelo, coches.color FROM coches
inner join clientes as c on coches.nif_cliente = c.nif
where matricula = '1212-ABC';

-- 3)
delete from clientes where nombre = 'Julio Romero';

-- 4)
CREATE INDEX idx_coches
ON coches (marca);

CREATE INDEX idx_coches_modelo ON coches(modelo);

CREATE INDEX idx_clientes ON clientes(nombre(12));

-- Ejercicio 3

-- 1)

SELECT c.nif, c.nombre, coches.matricula, coches.marca, coches.modelo, r.filtro, r.aceite, r.frenos  FROM clientes as c
inner join coches on c.nif = coches.nif_cliente
inner join revisiones  as r on coches.matricula = r.matricula_coche;


-- 2)

SELECT c.nif, c.nombre, coches.matricula, coches.marca, coches.modelo, r.filtro, r.aceite, r.frenos  FROM clientes as c
inner join coches on c.nif = coches.nif_cliente
inner join revisiones  as r on coches.matricula = r.matricula_coche;


-- 3)


-- 4)

SELECT  coches.*, r.codigo as numRevisiones FROM coches
inner join revisiones as r on coches.matricula = r.matricula_coche;

-- 5 y 6)

create table revisiones_2021 select * from revisiones
where fecha like '%2021%';

create table revisiones_2022 select * from revisiones
where fecha like '%2022%';

-- 7)

create temporary table cliente like clientes;

drop temporary table cliente;

