EXECUTE InserDimCulture
EXECUTE InserDimHouse
EXECUTE InserDimTitle
EXECUTE InserFact

SELECT * FROM dataWareHouse.dbo.correntistas
GO

SELECT * FROM dataWareHouse.dbo.culture
GO

SELECT * FROM dataWareHouse.dbo.title
GO

SELECT * FROM dataWareHouse.dbo.house
GO