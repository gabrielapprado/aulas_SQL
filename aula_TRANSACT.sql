CREATE VIEW ProdutosCaros AS 
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco > 1000;

SELECT * FROM ProdutosCaros

CREATE VIEW ProdutosMaisCarosPorCategoria AS
SELECT Categoria.NomeCategoria, Produto.NomeProduto, Produto.Preco
FROM Categoria
INNER JOIN Produto ON Categoria.CategoriaID = Produto.CategoriaID
WHERE Produto.Preco = (SELECT MAX(Preco) FROM Produto AS P
WHERE P.CategoriaID = Categoria.CategoriaID);

SELECT * FROM ProdutosMaisCarosPorCategoria;

DECLARE @MinPreco DECIMAL(10,2);
SET @MinPreco = 50;
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco >= @MinPreco;

DECLARE @TotalPedidos INT;
SELECT @TotalPedidos = COUNT(*)
FROM Pedido;

PRINT 'O total de pedidos é:' + CAST(@TotalPedidos AS NVARCHAR(10));



DECLARE @MediaPreco DECIMAL(10,2);

SET @MediaPreco =(
	SELECT AVG(Preco)
	FROM Produto
	WHERE CategoriaID=1
);

PRINT 'A média de preço na categoria de Eletrônicas é:' + CAST (@MediaPreco AS 
NVARCHAR(10));

DECLARE @ProdutoMaisCaro NVARCHAR(50);

SELECT TOP 1 @ProdutoMaisCaro = NomeProduto
FROM Produto
ORDER BY Preco DESC;

PRINT 'O produto mais caro é: ' + @ProdutoMaisCaro;