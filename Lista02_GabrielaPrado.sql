--Gabriela Pereira do Prado--
create database lista_02;
go
use lista_02;

--1--
create table tbl_clientes(
	id_cliente int primary key,
	nome varchar(50),
	email varchar(100),
	telefone varchar(15)
);

--2--
insert into tbl_clientes values (1,'João Silva','joao@email.com','(11)1234-5678');
--3--
insert into tbl_clientes values 
(2,'Maria Santos','maria@email.com','(11)2345-6789'),
(3,'Carlos Oliveira','carlos@email.com','(13)3456-7890'),
(4,'Ana Costa','ana@email.com','(15)4567-8901'),
(5,'Pedro Souza','pedro@email.com','(11)5678-9012'),
(6,'Juliana Lima','juliana@email.com','(66)6789-0123'),
(7,'Rafael Pereira','rafael@email.com','(14)7890-1234'),
(8,'Fernanda Alves','fernanda@email.com','(11)8901-2345'),
(9,'Lucas Rodrigues','lucas@email.com','(30)9012-3456'),
(10,'Camila Martins','camila@email.com','(11)0123-4567'),
(11,'João Pedroso','joaope@email.com','(11)1334-5998');

--4--
update tbl_clientes set telefone='(11) 8765-4321' where id_cliente=1;

select * from tbl_clientes


--5--
create table tbl_produtos(
	id_produtos int,
	nome varchar(50),
	preco decimal,
	estoque int
	constraint pk_id_produtos primary key (id_produtos)
);

--6--
insert into tbl_produtos values (1, 'Camiseta', '29.99', 100);

--7--
insert into tbl_produtos values 
(2, 'Calça Jeans', '89.90', 50),
(3, 'Tênis Esportivo', '149.99', 30),
(4, 'Boné', '24.50', 75),
(5, 'Mochila', '79.90', 40),
(6, 'Jaqueta', '129.99', 25),
(7, 'Bermuda', '49.90', 60),
(8, 'Meias', '12.99', 120),
(9, 'Cinto', '34.90', 45),
(10, 'Carteira', '39.99', 35),
(11, 'Óculos de Sol', '59.90', 20);

--8--
update tbl_produtos set preco='39.99' where id_produtos=1;

--9--
create table tbl_pedidos(
	id_pedidos int,
	ClienteId int,
	ProdutoId int,
	quantidade int,
	datapedido date,

	constraint pk_id_pedidos primary key (id_pedidos),
	constraint ClienteId Foreign key (ClienteId) references tbl_clientes (id_cliente),
	constraint ProdutoId Foreign key (ProdutoId) references tbl_produtos (id_produtos)
);

--10--
insert into tbl_pedidos values (1,1,1,2,'08-09-2026');

--11--
update tbl_pedidos set quantidade=3 where id_pedidos=1;

--12--
insert into tbl_pedidos values (2,2,1,5,'20-09-2026'),
(3,3,3,2,'22-08-2026'),
(4,2,5,1,'10-04-2026'),
(5,3,10,2,'13-06-2026'),
(6,5,11,1,'22-01-2026'),
(7,4,8,3,'20-08-2026'),
(8,8,9,4,'10-10-2026'),
(9,7,3,2,'22-05-2026'),
(10,6,4,3,'20-04-2026'),
(11,10,5,1,'23-06-2026');

--13--
create table tbl_funcionarios(
	id_funcionario int,
	nome varchar(50),
	cargo varchar(50),
	salario decimal,

	constraint pk_id_funcionario primary key (id_funcionario)
);

--14--
insert into tbl_funcionarios values (1,'Maria Santos','Gerente',5000);

--15--
update tbl_funcionarios set salario=6000 where id_funcionario=1;

--16--
insert into tbl_funcionarios values (2,'Lucas Roberto','Vendedor',16000),
(3,'Antonela Santos','Vendedor',16000),
(4,'Roberto Silva','Vice-Gerente',4000),
(5,'João Prado','Vendedor',16000),
(6,'Mateus Porciuncula','Vendedor',16000),
(7,'Jones Artur','Encarregado',3000),
(8,'Ana Maria','Chefe',10000),
(9,'Vitor Meira','Vendedor',16000),
(10,'Angelo Rodrigues','Vendedor',16000),
(11,'Amélia Santos','Vendedor',16000);

--17--
create table tbl_vendas(
	id_vendas int,
	ProdutoId int,
	Quantidade int,
	ValorTotal decimal,
	DataVenda date,

	constraint pk_id_vendas primary key (id_vendas),
	constraint fk_ProdutoId_vendas foreign key (ProdutoId) references tbl_produtos (id_produtos)
);

--18--
insert into tbl_vendas values (1,1,2,79.98,'08-09-2026');

--19--
insert into tbl_vendas values (2, 3, 1, 149.99, '15-01-2026'),
(3, 7, 2, 99.80, '03-02-2026'),
(4, 2, 4, 359.60, '21-02-2026'),
(5, 11, 1, 59.90, '10-03-2026'),
(6, 5, 3, 239.70, '28-03-2026'),
(7, 9, 2, 69.80, '12-04-2026'),
(8, 1, 5, 199.95, '07-05-2026'),
(9, 6, 1, 129.99, '19-06-2026'),
(10, 4, 2, 49.00, '23-07-2026'),
(11, 8, 3, 38.97, '14-08-2026');

--20--
delete from tbl_vendas where id_vendas=1;