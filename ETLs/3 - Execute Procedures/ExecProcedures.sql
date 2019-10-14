USE dataWareHouse
GO

-- Criar tabelas
EXECUTE createTables

-- Alimentando tabela com arquivo CSV
EXECUTE origin

-- Inserir dimensões
EXECUTE inserDimCulture

EXECUTE inserDimHouse

EXECUTE inserDimTitle

-- Inserir Fato
EXECUTE inserFact

-- SELECT * FROM dataWareHouse.dbo.correntistas

-- SELECT * FROM dataWareHouse.dbo.culture

-- SELECT * FROM dataWareHouse.dbo.title

-- SELECT * FROM dataWareHouse.dbo.house

-- EXECUTE dropTables