USE dataWareHouse
GO
/*
* Inserção da tabela dimenção: titulo
*/
CREATE PROCEDURE inserDimTitle
AS
BEGIN
INSERT INTO dataWareHouse.dbo.title SELECT title FROM poolCorrentistas.dbo.correntistas_banco_bravos 
	WHERE title != '' 
	AND title != '[1]' 
	AND NOT EXISTS (SELECT title FROM dataWareHouse.dbo.title WHERE title != '' AND title != '[1]') 
	GROUP BY title
END
/*
SELECT * FROM dataWareHouse.dbo.title
GO
*/
