USE dataWareHouse
GO
/*
* Inserção da tabela dimenção: culture
*/
CREATE PROCEDURE inserDimCulture
AS
BEGIN
INSERT INTO dataWareHouse.dbo.culture SELECT culture FROM poolCorrentistas.dbo.correntistas_banco_bravos 
	WHERE culture != ''
	AND NOT EXISTS (SELECT culture FROM  dataWareHouse.dbo.culture WHERE culture != '')
	GROUP BY culture
END
/*
SELECT * FROM dataWareHouse.dbo.culture
GO
*/

