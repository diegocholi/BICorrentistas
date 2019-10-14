USE dataWareHouse
GO

CREATE PROCEDURE dropTables
AS
BEGIN
	DROP TABLE poolCorrentistas.dbo.correntistas_banco_bravos
	DROP TABLE poolCorrentistas.dbo.correntistas_obito
	DROP TABLE dataWareHouse.dbo.correntistas
	DROP TABLE dataWareHouse.dbo.culture
	DROP TABLE dataWareHouse.dbo.house
	DROP TABLE dataWareHouse.dbo.title
END