/*
* Inserção da tabela dimenção: culture
*/
INSERT INTO dataWareHouse.dbo.culture SELECT culture FROM poolCorrentistas.dbo.correntistas_banco_bravos 
	WHERE culture != ''
	AND NOT EXISTS (SELECT culture FROM  dataWareHouse.dbo.culture WHERE culture != '')
	GROUP BY culture
GO

SELECT * FROM dataWareHouse.dbo.culture
GO
