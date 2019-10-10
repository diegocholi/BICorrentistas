USE master
DROP DATABASE dataWareHouse;
GO

CREATE DATABASE dataWareHouse;
GO

USE dataWareHouse
GO

/* Tabela: (null) */
CREATE TABLE correntistas (
    idCorrentistas Integer not null IDENTITY(1,1),
    name NVARCHAR(50),
    debt NVARCHAR(50),
    annualPaymentCapacity NVARCHAR(25),
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
);

/* Tabela: (null) */
CREATE TABLE title (
    idTitle Integer not null  IDENTITY(1,1),
    title Char(100),
   PRIMARY KEY (idTitle)
);

/* Tabela: (null) */
CREATE TABLE culture (
    idCulture Integer not null  IDENTITY(1,1),
    culture Char(100),
   PRIMARY KEY (idCulture)
) ;

/* Tabela: (null) */
CREATE TABLE house (
    idHouse Integer not null  IDENTITY(1,1),
    house Char(100),
   PRIMARY KEY (idHouse)
);

/* Relacionamentos */
ALTER TABLE correntistas ADD CONSTRAINT FK_correntistas_4 FOREIGN KEY (idTitle) REFERENCES title(idTitle);
ALTER TABLE correntistas ADD CONSTRAINT FK_correntistas_5 FOREIGN KEY (idCulture) REFERENCES culture(idCulture);
ALTER TABLE correntistas ADD CONSTRAINT FK_correntistas_7 FOREIGN KEY (idHouse) REFERENCES house(idHouse);
GO
/* Triggers */

