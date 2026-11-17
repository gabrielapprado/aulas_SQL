CREATE DATABASE FBD;
go
use FBD;

create table cliente (
Cod_cliente int Primary Key,
Nome_cliente varchar(50) not null,
Endereco varchar (50),
Cidade varchar(20),
Cep char(8),
UF char(2),
CPF char(14),
IE char(12));

create table vendedor (
cod_vendedor int,
nome_vendedor varchar (50) not null,
faixa_comissao char(1),
salario_fixo decimal(10,2),
CONSTRAINT PK_VENDEDOR PRIMARY KEY (COD_VENDEDOR));


create table produto (
cod_produto int Primary Key,
descricao varchar(20),
Unidade char(2),
Valor_unitario decimal(10,2));


create table pedido (
Num_pedido int,
data_compra datetime,
data_entrega datetime,
cod_cliente int not null,
cod_vendedor int not null ,
FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(Cod_cliente),
FOREIGN KEY(cod_vendedor) REFERENCES VENDEDOR(Cod_vendedor),
PRIMARY KEY(Num_pedido)
);


create table item_pedido (
num_pedido int references pedido,
cod_produto int references produto,
quantidade int,
primary key(num_pedido, cod_produto) )


create table cidade(
	codcidade int identity(1,1) not null primary key,
	nomecidade varchar(40),
	cdestado varchar(2)
);

create table empregado(
	nrmatricula int identity(1,1) primary key,
	nome varchar(50),
	data_admissao datetime,
	salario float
);

insert into cidade (nomecidade, cdestado) 
values ('Votorantim','SP'),
('Palmas','TO'),
('Paraty','RJ'),
('Belo Horizonte','MG'),
('Curitiba','PR');

insert into empregado (nome,data_admissao,salario)
values ('Jones Artur', '2005-07-07','50000'),
('Gabriela Prado', '2009-10-08','30000'),
('Daniela Silva', '2010-12-02','30000'),
('Antônio Rodrigues', '1999-02-09','10000'),
('Alberto Junior', '2010-10-08','30000');

select distinct cdestado from cidade;

select distinct unidade from produto;

select cdestado, nomecidade from cidade;

select 'Código do Cliente', cod_cliente, 'Nome do Cliente', nome_cliente from cliente;
select cod_cliente as 'Código do Cliente', nome_cliente as 'Nome do Cliente' from cliente;

select nome,salario,salario+500 aumento_salario from empregado;

select 'Funcionario: ' +nome + ' Salário: ' + CONVERT(VARCHAR,salario),salario,nome from empregado;

select num_pedido, cod_produto, quantidade from item_pedido where quantidade = 45;

select num_pedido, cod_produto, quantidade from item_pedido where quantidade < 45;

select nome, salario from empregado where salario between 20000 and 50000;
select nome, salario from empregado where salario not between 20000 and 50000;

select cod_produto, descricao from produto where Valor_unitario between 0.32 and 2.00;

select cod_produto, descricao, unidade from produto where unidade like 'K%'; --unidade começa com K--

select nome_vendedor, faixa_comissao from vendedor where faixa_comissao in ('A','B');
select nome_vendedor, faixa_comissao from vendedor where faixa_comissao not in ('A','B');

select * from cliente where ie is not null;

select nrmatricula, salario from empregado where salario > 10000 and nrmatricula >=3;

select * from empregado where salario > 10000 or nrmatricula >=3;

select descricao from produto where Unidade = 'M' and Valor_unitario = 1.05;

select descricao from produto where unidade = 'UN' and Valor_unitario =4;

select nome_vendedor, salario_fixo from vendedor order by nome_vendedor; /* ordem asc */
select nome_vendedor, salario_fixo from vendedor order by nome_vendedor desc;

create table pessoa(
	id_pessoa integer primary key,
	nome varchar(20),
	cpf varchar (14)
);

create table pessoa_fisica(
	id_pessoa integer primary key,
	nome varchar(20),
	cpf varchar (14)
);

insert into pessoa values (1, 'Pedro Cabral', '12345678991');

insert into pessoa_fisica select id_pessoa, nome, cpf from pessoa;

