select min(salario_fixo) as 'MENOR SALARIO', max(salario_fixo) 
as 'MAIOR SALARIO' from vendedor;

select sum (quantidade) as 'TOTAL PRODUTO 3'
from item_pedido
where cod_produto=3; --soma os valores numericos de colunas com uma determinada condiçao--

select AVG(salario_fixo) as 'MEDIA SALARIO'
from vendedor;

select count(*) as 'QTD VENDEDOR' from vendedor 
where salario_fixo > 2500.00 --conta a quantidade de linhas com uma determinada condiçao--

select num_pedido, total_produtos = count (*)
from item_pedido
group by num_pedido


select * from item_pedido


select num_pedido, total_produtos = count (*)
from item_pedido
where quantidade > 5
group by num_pedido
having count(*)>1;

select getdate();

select DATENAME(yy, getdate());

select DATENAME (MONTH,GETDATE());

SELECT DATEPART(MM, GETDATE());

select day(getdate());

select month(getdate());

select year(getdate());

select datediff(yy, '13-06-2007', getdate());

select datediff(mm, '13-06-2007', getdate());

select datediff(dd, '13-06-2007', getdate());

select datediff(mm, '13-06-2007', getdate());

select datediff(hh, '13-06-2007', getdate());


select dateadd (yy,1,getdate());

select datename(month,(dateadd(month,3,getdate())))

select convert(char,getdate(),103);
select convert(char,getdate(),113);
--funcoes matematicas--
select round(123.3467,3)
select round(123.3467,2)
select round(123.3467,1)
select round(123.5467,1)
select round(123.3467,0)
select round(123.3467,-1)
select round(123.3467,-2)

select floor(123.45); --retira a parte decimal--

select power(4,2)
--FUNCOES DE SEQUENCIA DE CARACTERES--
select ASCII('A'), ASCII('AMANDA');
SELECT CHAR(65), CHAR(66);
SELECT CHARINDEX('Mundo','Ola Mundo Bonito'); --pesquisa a expressao 2 pela expressao 1 e retorna sua posição inicial se for localizada--
SELECT CHARINDEX ('Mundo', 'Ola Mundo Bonito',3); --conta a partir da terceira posiçao--
SELECT CHARINDEX ('Mundo', 'Ola Mundo Bonito',6); --conta a partir da sexta posição, nesse caso vai devolver 0--


--REPLACE SUBSTITUI UM CARACTERE OU CARACTERES DE UMA CADEIA--
select replace('abcdefghicde', 'cde','xxx');
select replace(primeiro_nome,'C','Z') FROM Funcionario;

--STUFF insere uma cadeia de caracteres em outra cadeia --

select stuff('abcdef',2,3, '_ijklmn_'); -- a partir da segunda opção remove tres caracteres e adiciona a outra expressao--
select left('abcdefgh',5);
select right('abcdefgh',5);

select replicate('ABC',3);

SELECT SUBSTRING('ABCDEFGHIJ',2,3);
SELECT LEN('ABCD');
select len('ABCD   ');

select lower('AbCD');
SELECT LOWER(PRIMEIRO_NOME) FROM Funcionario;

select upper('abCd');
SELECT UPPER(PRIMEIRO_NOME) FROM Funcionario;

SELECT '_' + LTRIM ('  AbCD   ')+ '_';
SELECT '_' + RTRIM ('  AbCD   ')+ '_';

