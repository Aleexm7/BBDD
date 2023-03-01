-- Mostramos los clientes y los pedidos realizados

-- 1 Forma de hacer join usando Join o Inner Join
select * from cliente
inner join pedido on cliente.id_cliente = pedido.id_cliente;


-- 2 Forma de hacer join usando using
select * from cliente
inner join pedido using (id_cliente);

-- 3 Forma de hacer join sin usar join

select * from cliente, pedido
where cliente.id_cliente = pedido.id_cliente;

-- LEFT JOIN
-- MOSTRAMOS TODOS LOS CLIENTES Y LOS PEDIDOS REALIZADO

select * from cliente 
left join pedido on cliente.id_cliente = pedido.id_cliente;

select * from cliente
left join pedido using (id_cliente);

-- RIGHT JOIN

select * from pedido
right join cliente on pedido.id_cliente = cliente.id_cliente;

select * from pedido
right join cliente using(id_cliente);