select NomeProduto from Produto
where preco > ALL(SELECT Preco FROM Produto Where NomeProduto = 'Chapéu');


select NomeProduto 
From Produto
where Preco > ALL (SELECT Preco FROM Produto
						WHERE CategoriaID = (SELECT CategoriaID FROM Categoria
												WHERE NomeCategoria = 'Eletrônicos'));



SELECT NomeProduto
FROM Produto
WHERE Preco < ANY(SELECT Preco FROM Produto WHERE CategoriaID = 1);


select NomeProduto 
From Produto
Where EXISTS (SELECT * FROM Pedido
				WHERE Pedido.ProdutoID = Produto.ProdutoID); --o ponto serve para diferenciar as colunas produtoID que existe nas duas tabelas--

SELECT NomeProduto
FROM Produto
WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido WHERE PedidoID IN(1,3));

SELECT NomeCategoria
From Categoria
WHERE CategoriaID IN(SELECT CategoriaID FROM Produto WHERE Preco > 1000)
UNION 
SELECT NomeCategoria 
FROM Categoria
WHERE CategoriaID IN(SELECT Produto.CategoriaID FROM Produto JOIN Pedido ON
Produto.ProdutoID = Pedido.ProdutoID);


SELECT NomeProduto
FROM Produto
WHERE Preco < 100
UNION ALL
SELECT NomeProduto
FROM Produto
WHERE Preco > 1000;

SELECT NomeProduto
FROM Produto
WHERE Preco > 100
INTERSECT
SELECT NomeProduto
FROM Produto
WHERE Preco < 1000;

SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 1000)
INTERSECT 
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN(SELECT Produto.CategoriaID FROM Produto JOIN Pedido ON
Produto.ProdutoID =	Pedido.ProdutoID);

SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 100)
EXCEPT 
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN(SELECT Produto.CategoriaID FROM Produto JOIN Pedido ON
Produto.ProdutoID =	Pedido.ProdutoID);

