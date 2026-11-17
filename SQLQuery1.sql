CREATE DATABASE BD_AULA
go 
use BD_AULA

DROP DATABASE BD_TESTE

CREATE TABLE cliente(
	cod_cli int not null,
	nome_cli varchar(40) not null,
	end_cli varchar(30) not null,
	bairro_cli varchar(20) not null,
	cidade_cli varchar (20) not null,
	uf_cli char(3) not null, 
	tel_cli varchar(15) null,
	Constraint PK_Cliente Primary Key(cod_cli)

)

CREATE TABLE nota_fiscal(
	num_nota int not null,
	cod_cli int not null,
	serie_nota varchar(10) not null,
	emissao_nota smalldatetime null,
	vtot_nota smallmoney not null,

	Constraint PK_NotaFiscal Primary Key(num_nota),
	Constraint FK_Cliente Foreign Key(cod_cli) references cliente(cod_cli)

)
CREATE TABLE Cidade(
	cod_cidade varchar(2) not null,
	nomecidade varchar(40)
);

CREATE TABLE Empregado(
	Nrmatricula int, 
	Nome varchar(30),
	Data_demissao datetime,
	Salario float
);
CREATE TABLE Estado(
	cdestado varchar(2) not null,
	nomeestado varchar(30) not null
);

ALTER TABLE Cidade
add primary key(cod_cidade);

alter table cidade
add cdestado char(2) not null,
teste varchar(1) null;

alter table cidade
drop column teste;

alter table cidade
alter column cdestado varchar(2);

alter table cidade 
add constraint pk_codcidade primary key (cod_cidade);

alter table estado
add constraint pk_cdestado primary key (cdestado);

alter table cidade
add foreign key(cdestado) references estado (cdestado);

insert into estado values ('SP', 'São Paulo');

insert into cidade values ('1', 'Votorantim', 'SP');

insert into cidade (cod_cidade, nomecidade, cdestado) values ('2', 'Sorocaba', 'SP')



insert into cidade values ('3', 'Itu', 'NN');
insert into cidade values ('4', 'Itapira', 'NN');

insert into Estado values ('NN', 'Não Cadastrado')


SELECT * FROM Cidade
SELECT * FROM Estado

insert into Estado values ('RJ', 'Rio de Janeiro'), ('MG', 'Minas Gerais');
insert into cidade values ('5', 'Macaé', 'RJ'), ('6', 'Gotham', 'MG');

update Cidade set cdestado = 'SP' where cdestado = 'NN';

DELETE FROM Cidade where nomecidade = 'Itapira';

