--Gabriela Pereira do Prado--
create database lista_03;
go
use lista_03;
select * from funcionario;

--1--
select primeiro_nome, ultimo_nome, salario from funcionario where salario>2500;

--2--
select primeiro_nome, ultimo_nome, cod_setor from funcionario where nr_matricula =7;

--3--
select primeiro_nome, ultimo_nome, salario from funcionario where salario not between 1500 and 3000;

--4--
select primeiro_nome, ultimo_nome, cod_setor, data_admissao 
from funcionario
where data_admissao >= '01-01-2009'
order by data_admissao;

--5--
select * from funcionario where cod_setor=1 or cod_setor=4
order by NR_matricula ASC;

--6--
select primeiro_nome from funcionario where primeiro_nome like '_a%';

--7--
select primeiro_nome from funcionario where primeiro_nome like '%a%' and primeiro_nome like '%e%';

--8--
select * from Funcionario where Cod_setor=2 
order by primeiro_nome ASC;

--9--
select * from Funcionario where Cod_setor in (2,5)

--10--
select * from Funcionario where salario>2300 and Cod_setor=3;

--11.a--
select distinct cod_setor from Funcionario;

--11.b--
select ultimo_nome + ', ' + CONVERT(VARCHAR, Cod_setor) as [Empregado e Setor]
from Funcionario;
