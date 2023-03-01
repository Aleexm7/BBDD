DROP DATABASE IF EXISTS COMERCIO;
CREATE DATABASE COMERCIO CHARACTER SET utf8mb4;
USE COMERCIO;

CREATE TABLE cliente (
  id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100)
);

CREATE TABLE vendedor (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id_cliente INT UNSIGNED NOT NULL,
  id_vendedor INT UNSIGNED NOT NULL,
  fecha DATE,
  nombre varchar(40) not null,
  total DOUBLE NOT NULL,

  primary key (id_cliente, id_vendedor),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_vendedor) REFERENCES vendedor(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería');
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada');
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla');
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén');
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería');
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz');
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla');
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva');
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada');
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla');

INSERT INTO vendedor VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO vendedor VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO vendedor VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO vendedor VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO vendedor VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO vendedor VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO vendedor VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO vendedor VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES( 5, 2,  '2017-10-05', 'A', 150.5);
INSERT INTO pedido VALUES(1, 5, '2016-09-10','A',270.65 );
INSERT INTO pedido VALUES(2, 1, '2017-10-05','A',65.26 );
INSERT INTO pedido VALUES( 8, 3, '2016-08-17','B',110.5);
INSERT INTO pedido VALUES(1, 2, '2017-09-10','B',948.5 );
INSERT INTO pedido VALUES(7, 1 , '2016-07-27', 'A',2400.6);
INSERT INTO pedido VALUES( 2, 2, '2015-09-10', 'C',5760);
INSERT INTO pedido VALUES(4, 6,  '2017-10-10', 'C',1983.43 );
INSERT INTO pedido VALUES(8, 1, '2016-10-10', 'B',2480.4);
INSERT INTO pedido VALUES(8, 2, '2015-06-27','C',250.45);
INSERT INTO pedido VALUES(3, 7, '2016-08-17', 'A', 75.29);
INSERT INTO pedido VALUES( 3, 1, '2017-04-25','C',3045.6);
INSERT INTO pedido VALUES(6, 1,  '2019-01-25','A',545.75 );
INSERT INTO pedido VALUES(5, 5,  '2019-03-11','B', 370.85);