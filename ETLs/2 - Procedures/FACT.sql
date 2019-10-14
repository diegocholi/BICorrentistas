USE dataWareHouse
GO

CREATE PROCEDURE inserFact
AS
BEGIN
DECLARE @name VARCHAR(50), @title VARCHAR(50),
	@male VARCHAR(50), @culture VARCHAR(50),
	@mother VARCHAR(50), @father VARCHAR(50),
	@heir VARCHAR(50), @house VARCHAR(50),
    @isAliveMother VARCHAR(50), @isAliveFather VARCHAR(50),
	@isAliveHeir NVARCHAR(50), @isAliveSpouse VARCHAR(50),
	@isMarried VARCHAR(50), @isNoble VARCHAR(50),
	@isPopular VARCHAR(50), @popularity VARCHAR(50),
	@divida MONEY, @numDeadReations VARCHAR(50),
	@annualPaymentCapacity MONEY, @isDeath BIT,
	@idHouse INT, @idTitle INT,
	@idCulture INT, @diference MONEY 
PRINT '-------- Carregando Fato (...) --------';  
  
DECLARE fact CURSOR FOR   
SELECT 
	[name], [title], 
	[male], [culture], 
	[mother], [father], 
	[heir], [house], 
	[isAliveMother],	[isAliveFather],
	[isAliveHeir], [isAliveSpouse],
	[isMarried], [isNoble],
	[isPopular], [popularity],
	[numDeadRelations],
	CAST(REPLACE(REPLACE(REPLACE(poolCorrentistas.dbo.correntistas_banco_bravos.[Dívida], '.', ''),',','.'), 'R$', '') AS DECIMAL(12,2)),
	CAST(REPLACE(REPLACE(REPLACE(REPLACE(poolCorrentistas.dbo.correntistas_banco_bravos.[Capacidade de pagamento anual],' ;', ''), '.', ''),',','.'), 'R$', '') AS DECIMAL(12,2)),
	-- Subtração
	CAST(REPLACE(REPLACE(REPLACE(REPLACE(poolCorrentistas.dbo.correntistas_banco_bravos.[Capacidade de pagamento anual],' ;', ''), '.', ''),',','.'), 'R$', '') AS DECIMAL(12,2)) -
	CAST(REPLACE(REPLACE(REPLACE(poolCorrentistas.dbo.correntistas_banco_bravos.[Dívida], '.', ''),',','.'), 'R$', '') AS DECIMAL(12,2))
FROM poolCorrentistas.dbo.correntistas_banco_bravos 
  
OPEN fact  
  
FETCH NEXT FROM fact   
INTO @name, @title ,
	@male, @culture,
	@mother, @father,
	@heir, @house,
    @isAliveMother, @isAliveFather,
	@isAliveHeir, @isAliveSpouse,
	@isMarried, @isNoble,
	@isPopular, @popularity,
	@numDeadReations,
	@divida, @annualPaymentCapacity, 
	@diference
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
	SET @isDeath = 0
	SET @idHouse = NULL
	SET @idTitle = NULL
	SET @idCulture = NULL

	IF EXISTS (SELECT * FROM poolCorrentistas.dbo.correntistas_banco_bravos WHERE house = @house)
		SET @idHouse = (SELECT idHouse FROM dataWareHouse.dbo.house WHERE house = @house)

	IF EXISTS (SELECT * FROM poolCorrentistas.dbo.correntistas_banco_bravos WHERE title = @title)
		SET @idTitle = (SELECT idTitle FROM dataWareHouse.dbo.title WHERE title = @title)

	IF EXISTS (SELECT * FROM poolCorrentistas.dbo.correntistas_banco_bravos WHERE culture = @culture)
		SET @idCulture = (SELECT idCulture FROM dataWareHouse.dbo.culture WHERE culture = @culture)


	IF EXISTS (SELECT * FROM poolCorrentistas.dbo.correntistas_obito WHERE name = @name)
		SET @isDeath = 1

	IF NOT EXISTS (SELECT * FROM dataWareHouse.dbo.correntistas WHERE name = @name)
		INSERT INTO dataWareHouse.dbo.correntistas 
			(
				name, debt, 
				annualPaymentCapacity, isAliveMother,
				isAliveFather, isAliveHeir,
				isAliveSpouse, isMarried,
				isNoble, isPopular,
				isMale,	popularity, 
				isDeath, idHouse,
				idTitle, idCulture,
				diference
			) 
		VALUES 
			(
				@name, @divida, 
				@annualPaymentCapacity, @isAliveMother,
				@isAliveFather, @isAliveHeir,
				@isAliveSpouse, @isMarried,
				@isNoble, @isPopular,
				@male, @popularity,
				@isDeath, @idHouse,
				@idTitle, @idCulture,
				@diference
			)

    FETCH NEXT FROM fact   
    INTO @name, @title ,
		@male, @culture,
		@mother, @father,
		@heir, @house,
		@isAliveMother, @isAliveFather,
		@isAliveHeir, @isAliveSpouse,
		@isMarried, @isNoble,
		@isPopular, @popularity,
		@numDeadReations,
		@divida, @annualPaymentCapacity, 
		@diference
END   
CLOSE fact;  
DEALLOCATE fact;  
END