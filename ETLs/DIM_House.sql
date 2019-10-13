/*
* Inserção da tabela dimenção: house
*/
CREATE PROCEDURE InserDimHouse
AS
BEGIN
INSERT INTO dataWareHouse.dbo.house SELECT house FROM poolCorrentistas.dbo.correntistas_banco_bravos 
	WHERE house != ''
	AND NOT EXISTS (SELECT house FROM dataWareHouse.dbo.house WHERE house != '')
	GROUP BY house
END
/*
SELECT * FROM dataWareHouse.dbo.house
GO
*/