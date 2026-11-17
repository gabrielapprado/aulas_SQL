/*1*/
CREATE TABLE professores (
	id int not null,
	nome varchar(50) not null, 
	disciplina varchar (15) not null,

	constraint pk_id primary key (id)
);

/*2*/

insert into professores 
	values ('1', 'Ana Oliveira', 'Português');

/*3*/
update professores set nome = 'Ana Silva' where id = '1';

/*4*/

insert into professores
	values ('2', 'Lucas Rodrigues', 'Matemática'),
	('3', 'Jones Artur', 'Banco de Dados'),
	('4', 'Angelina Malaré', 'Desenvolvimento'),
	('5', 'Helder Pestana', 'Estrutura Dados'),
	('6', 'Rodrigo Silva', 'Java'),
	('7', 'Daniela Santos', 'Inglês'),
	('8', 'Bruno Prado', 'História'),
	('9', 'Giovanna Stefani', 'Ciência'),
	('10', 'Juliana Santos', 'Geografia')


select * from professores;

--5--
delete from professores where id = '2';

--6--
CREATE TABLE turmas(
	id_turmas int not null,
	nome_turmas varchar(50),
	ProfessorResponsavel int not null,


	constraint pk_id_turma primary key (id_turmas),
	constraint ProfessorResponsavel Foreign Key (ProfessorResponsavel)  references professores (Id)
);

--7--
insert into turmas 
	values ('1','9A','1')

select * from turmas
--8--
insert into turmas 
	values ('2','9B','4'),
	('3','9C','4'),
	('4','9D','6'),
	('5','1A','3'),
	('6','1B','5'),
	('7','1C','7'),
	('8','1D','10'),
	('9','2A','9'),
	('10','2B','8')

--9--
CREATE TABLE alunos(
	id_alunos int not null,
	nome_alunos varchar(50) not null,
	DataNascimento date not null,
	TurmaId int not null,

	constraint pk_id_alunos primary key (id_alunos),
	constraint TurmaId Foreign Key (TurmaId) references turmas(id_turmas)
);

--10--
insert into alunos
	values ('1','Maria Souza', '2005-10-15','1');

--11--
insert into alunos
	values ('2','Gabriela', '2007-06-13','1'),
	('3','Vitor', '2008-10-20','1'),
	('4','Ana Luisa', '2007-09-20','2'),
	('5','Luis', '2004-04-23','2'),
	('6','João', '2003-11-25','3'),
	('7','Giovanna', '1999-08-11','4'),
	('8','Luciano', '1997-11-15','3'),
	('9','Daniela', '1989-03-24','5'),
	('10','Vinicius', '2009-06-22','6'),
	('11','Jonathan', '2007-07-07','8')
