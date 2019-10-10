
DECLARE @name NVARCHAR(50), @title NVARCHAR(50),
	@male NVARCHAR(50), @culture NVARCHAR(50),
	@mother NVARCHAR(50), @father NVARCHAR(50),
	@heir NVARCHAR(50), @house NVARCHAR(50),
    @isAliveMother NVARCHAR(50), @isAliveFather NVARCHAR(50),
	@isAliveHeir NVARCHAR(50), @isAliveSpouse NVARCHAR(50),
	@isMarried NVARCHAR(50), @isNoble NVARCHAR(50),
	@isPopular NVARCHAR(50), @popularity NVARCHAR(50),
	@divida NVARCHAR(50), @numDeadReations NVARCHAR(50),
	@annualPaymentCapacity NVARCHAR(50), @isDeath BIT,
	@idHouse INT, @idTitle INT,
	@idCulture INT
  
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
	[Dívida],[numDeadRelations],
	[Capacidade de pagamento anual]
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
	@divida, @numDeadReations,
	@annualPaymentCapacity 
  
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
				idTitle, idCulture
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
				@idTitle, @idCulture
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
		@divida, @numDeadReations,
		@annualPaymentCapacity 
END   
CLOSE fact;  
DEALLOCATE fact;  

SELECT * FROM dataWareHouse.dbo.correntistas
GO
