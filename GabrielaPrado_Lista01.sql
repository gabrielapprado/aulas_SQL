/*Gabriela Pereira do Prado*/
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
	('10', 'Juliana Santos', 'Geografia'),
    ('11', 'Antonio Humberto', 'Filosofia');




/*5*/
delete from professores where id = '2';

/*6*/
CREATE TABLE turmas(
	id_turmas int not null,
	nome_turmas varchar(50),
	ProfessorResponsavel int not null,


	constraint pk_id_turma primary key (id_turmas),
	constraint ProfessorResponsavel Foreign Key (ProfessorResponsavel)  references professores (Id)
);

/*7*/
insert into turmas 
	values ('1','9A','1');


/*8*/
insert into turmas 
	values ('2','9B','4'),
	('3','9C','4'),
	('4','9D','6'),
	('5','1A','3'),
	('6','1B','5'),
	('7','1C','7'),
	('8','1D','10'),
	('9','2A','9'),
	('10','2B','8'),
    ('11','2C','11');

/*9*/
CREATE TABLE alunos(
	id_alunos int not null,
	nome_alunos varchar(50) not null,
	DataNascimento date not null,
	TurmaId int not null,

	constraint pk_id_alunos primary key (id_alunos),
	constraint TurmaId Foreign Key (TurmaId) references turmas(id_turmas)
);

/*10*/
insert into alunos
	values ('1','Maria Souza', '2005-10-15','1');

/*11*/
update alunos set nome_alunos='Maria da Silva' where id_alunos = 1;


/*12*/
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
	('11','Jonathan', '2007-07-07','8');
    
/*13*/
delete from alunos where id_alunos = 2;

/*14*/
create table notas(
	id_notas int not null,
    AlunoId int not null,
    disciplina varchar(15),
    notas decimal(5,2),
    
    constraint pk_id_notas primary key (id_notas),
    constraint AlunoId foreign key (AlunoId) references alunos (id_alunos)
);

/*15*/
insert into notas
	values (1, 1, 'Matemática', 8.5);

/*16*/
update notas set notas = 9.0 
	where AlunoId = 1 and disciplina = 'Matemática';

/*17*/
insert into notas
	values (2, 1, 'História', 8.5),
    (3, 3, 'Matemática', 7.5),
    (4, 3, 'História', 6.5),
    (5, 7, 'Ciências', 10.0),
    (6, 7, 'Matemática', 10.0),
    (7, 10, 'Desenvolvimento', 8.5),
    (8, 10, 'Banco de Dados', 8.75),
    (9, 11, 'História', 5.0),
    (10, 11, 'Matemática', 9.0),
    (11, 4, 'Java', 8.5);
    

/*18*/
delete from notas
where AlunoID= 1 and
disciplina = 'Matemática';

/*19*/
create table matriculas(
	id_matriculas int not null,
    AlunoId int not null,
    TurmaId int not null,
    DataMatricula date,
    
    constraint pk_id_matriculas primary key (id_matriculas),
    constraint AlunoId_matriculas foreign key (AlunoId) references alunos (id_alunos),
    constraint TurmaId_matriculas foreign key (TurmaId) references turmas (id_turmas)
    
);


/*20*/
insert into matriculas
values (1,1,1, '2022-02-15');

/*21*/
insert into alunos 
values (12, 'Maria Eugênia', '2007-07-07', 9);
insert into matriculas
values (2,3,1, '2022-02-17'),
(3,4,2, '2022-02-20'),
(4,5,2, '2022-02-21'),
(5,6,3, '2022-02-23'),
(6,7,4, '2022-02-24'),
(7,8,3, '2022-03-01'),
(8,9,5, '2022-03-05'),
(9,10,6, '2022-03-14'),
(10,11,8, '2022-03-23'),
(11,12,9, '2022-03-25');