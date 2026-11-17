CREATE PROC consulta_produto
AS 
SELECT* FROM Produto
WHERE NomeProduto like '%a%';

ALTER PROC consulta_produto
AS
SELECT nomeproduto, preco FROM produto;

CREATE PROCEDURE InserirNovoProduto
	@IDProd INT,
	@Nome NVARCHAR(50),
	@CategoriaID INT,
	@Preco DECIMAL(10,2)
AS
BEGIN
	INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
	VALUES (@IDProd, @Nome, @CategoriaID, @Preco)
END;

EXEC InserirNovoProduto 14, 'SmartWatch',1, 200;

SELECT * FROM Produto;

CREATE PROCEDURE AtualizarPrecoProduto
	@ProdutoID INT,
	@NovoPreco DECIMAL (10,2)
AS
BEGIN
	UPDATE Produto
	SET Preco = @NovoPreco
	WHERE ProdutoID = @ProdutoID
END

EXEC AtualizarPrecoProduto 14, 2500;

SELECT * FROM Produto;

CREATE PROCEDURE CalcularValorTotalPedido
	@PedidoID INT
	AS
	BEGIN
		SELECT ValorTotal = SUM(PRECO)
		FROM Produto
		WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido
								WHERE PedidoID= @PedidoID)
	END;

EXEC CalcularValorTotalPedido @PedidoId = 8;
