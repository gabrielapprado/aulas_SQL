CREATE TRIGGER trg_PreventCategoriaDeletion
ON Categoria
INSTEAD OF DELETE
AS 
BEGIN
	IF EXISTS (SELECT 1 FROM Produto WHERE Produto.CategoriaID IN (SELECT
	deleted.CategoriaID FROM deleted))
	BEGIN
		RAISERROR('Não é possível excluir categorias associadas a produtos.', 16,1)
		rollback transaction
	end
	else
		delete from Categoria where Categoria.CategoriaID in (select
	deleted.CategoriaID from deleted)
END;

delete Categoria where CategoriaID = 1;

insert into Categoria (CategoriaID, NomeCategoria) values (13, 'Games');

delete Categoria where CategoriaID = 13;

CREATE TRIGGER trg_LogPrecoAlterado
ON Produto
AFTER UPDATE 
AS 
BEGIN
	INSERT INTO LogPreco (ProdutoID, NovoPreco, DataAlteracao)
	select ProdutoID, Preco, GETDATE()
	FROM inserted
END

CREATE TABLE LogPreco(
	ProdutoID INT,
	NovoPreco decimal (10,2),
	DataAlteracao DATE);

UPDATE Produto set Preco = 4100 where ProdutoID = 1;

select * from LogPreco;

CREATE TRIGGER trg_LimitePreco
ON Produto
Instead of insert
as
begin
	if exists (select 1 from inserted where Preco > 1000)
	begin 
		raiserror ( 'O preço do produto não pode exceder $10.000.', 16,1)
		rollback transaction
	end
	else
		insert into Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
		select ProdutoID, NomeProduto, CategoriaID, Preco
		from inserted
end;

insert into Produto values ( 14, 'Ultrabook', 15800);