USE dataWareHouse
GO

CREATE PROCEDURE createTables
AS
BEGIN
/* Tabela: correntistas */
CREATE TABLE dataWareHouse.dbo.correntistas (
    idCorrentistas Integer not null IDENTITY(1,1),
    name NVARCHAR(50),
    debt MONEY,
    annualPaymentCapacity MONEY,
	diference MONEY,
    isAliveMother NVARCHAR(1),
    isAliveFather NVARCHAR(1),
    isAliveHeir NVARCHAR(1),
    isAliveSpouse NVARCHAR(1),
    isMarried NVARCHAR(1),
    isNoble NVARCHAR(1),
    isPopular NVARCHAR(1),
    isDeath BIT,
	isMale NVARCHAR(1),
    popularity NVARCHAR(25),
    idHouse Integer,
    idTitle Integer,
    idCulture Integer
)

/* Tabela: title */
CREATE TABLE dataWareHouse.dbo.title (
    idTitle Integer not null  IDENTITY(1,1),
    title Char(100),
   PRIMARY KEY (idTitle)
)

/* Tabela: culture */
CREATE TABLE dataWareHouse.dbo.culture (
    idCulture Integer not null  IDENTITY(1,1),
    culture Char(100),
   PRIMARY KEY (idCulture)
)

/* Tabela: house */
CREATE TABLE dataWareHouse.dbo.house (
    idHouse Integer not null  IDENTITY(1,1),
    house Char(100),
   PRIMARY KEY (idHouse)
)

/* Relacionamentos */
ALTER TABLE dataWareHouse.dbo.correntistas ADD CONSTRAINT FK_correntistas_4 FOREIGN KEY (idTitle) REFERENCES title(idTitle);
ALTER TABLE dataWareHouse.dbo.correntistas ADD CONSTRAINT FK_correntistas_5 FOREIGN KEY (idCulture) REFERENCES culture(idCulture);
ALTER TABLE dataWareHouse.dbo.correntistas ADD CONSTRAINT FK_correntistas_7 FOREIGN KEY (idHouse) REFERENCES house(idHouse);
END