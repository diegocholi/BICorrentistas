USE dataWareHouse
GO

CREATE PROCEDURE origin
AS
BEGIN
-- Importar dados
CREATE TABLE poolCorrentistas.dbo.correntistas_banco_bravos(
	name VARCHAR(350),
	title VARCHAR(100),
	male CHAR(150),
	culture VARCHAR(50),
	mother VARCHAR(150),
	father VARCHAR(50),
	heir VARCHAR(150),
	house VARCHAR(100),
	spouse VARCHAR(150),
	book1 VARCHAR(100),
	book2 VARCHAR(150),
	book3 VARCHAR(100),
	book4 VARCHAR(150),
	book5 VARCHAR(100),
	isAliveMother VARCHAR(150),
	isAliveFather VARCHAR(100),
	isAliveHeir VARCHAR(200),
	isAliveSpouse VARCHAR(100),
	isMarried VARCHAR(150),
	isNoble VARCHAR(50),
	numDeadRelations VARCHAR(150),
	isPopular VARCHAR(50),
	popularity VARCHAR(200),
	[Dívida] VARCHAR(100),
	[Capacidade de pagamento anual] VARCHAR(100),
)

CREATE TABLE poolCorrentistas.dbo.correntistas_obito(
	Name VARCHAR(350),
	Allegiances VARCHAR(100),
	Gender VARCHAR(150),
	Nobility VARCHAR(50),
)

-- Ajustar caminho correntistas_banco_bravos
bulk insert poolCorrentistas.dbo.correntistas_banco_bravos from 'I:\WorkSpace\BICorrentistas\planilhas_origem\correntistas_banco_bravos (3).csv' with (fieldterminator = ';', rowterminator = '\n', firstrow = 2, codepage = 'acp')

-- Ajustar caminho correntistas_obito
bulk insert poolCorrentistas.dbo.correntistas_obito from 'I:\WorkSpace\BICorrentistas\planilhas_origem\correntistas_obito (2).csv' with (fieldterminator = ';', rowterminator = '\n', firstrow = 2, codepage = 'acp')
END