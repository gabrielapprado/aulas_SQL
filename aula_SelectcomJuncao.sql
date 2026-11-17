use FBD
select funcionario.primeiro_nome, funcionario.salario, setor.nome_setor from funcionario,setor; 
--mostra todas as combinaçoes da tabela funcionario com a tabela setor--

select funcionario.primeiro_nome, funcionario.salario, setor.nome_setor
from funcionario,setor
where funcionario.cod_setor = setor.cod_setor;

--com alias (abreviacao)--
select f.primeiro_nome, f.salario, s.nome_setor 
from funcionario f, setor s
where f.cod_setor = s.cod_setor;

--inner join = tras oq tem em comum entre as duas tabelas--
select f.primeiro_nome, f.salario, s.nome_setor
from funcionario f 
inner join setor s on f.cod_setor = s.cod_setor;

select c.nome_cliente,p.num_pedido 
from cliente c 
inner join pedido p on c.Cod_cliente = p.cod_cliente

--todas as informaçoes da tabela esquerda--
select c.nome_cliente, p.num_pedido 
from cliente c
left outer join pedido p on c.Cod_cliente = p.cod_cliente;

select c.nome_cliente, p.num_pedido
from cliente c
left outer join pedido p on c.Cod_cliente= p.cod_cliente
where p.cod_cliente is null;

--todas as informaçoes da tabela da direita--
select f.primeiro_nome, f.salario, s.nome_setor
from funcionario f
right outer join setor s on f.cod_setor = s.cod_setor;

insert into setor (nome_setor) values ('Marketing');

select f.primeiro_nome, f.salario, s.nome_setor
from funcionario f
right outer join setor s on f.cod_setor = s.cod_setor
where f.cod_setor is null;

select c.nome_cliente, p.num_pedido
from cliente c
full outer join pedido p on c.Cod_cliente = p.cod_cliente;

select f.primeiro_nome, f.salario, s.nome_setor
from funcionario f
full outer join setor s on f.cod_setor = s.cod_setor;

--assim como o primeiro comando, o cross join cruza todos os dados entre as tabelas--
select f.primeiro_nome, f.salario, s.nome_setor
from funcionario f
cross join setor s
order by f.primeiro_nome;

select c.nome_cliente, p.num_pedido
from cliente c
cross join pedido p
order by c.Nome_cliente