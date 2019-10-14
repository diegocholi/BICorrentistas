## Ferramentas Utilizadas
* SQLServer 2014 +
* Power BI

## Tuturial de ETL's
1. Dentro da pasta ETLs/1 - DataBase -> Executar o arquivo _createBases.sql que cria as data bases
2. Dentro da pasta ETLs/2 - Procedures -> Executar os arquivos que geram as rotinas do sistema. Criação de tabelas, alimentação da tabela de origin, fato e dimensão.
    OBS: Dentro da pasta ETLs/2 - Procedures, no arquivo _origin.sql deve-se ajustar o caminho do arquivo csv de origem.

3. Dentro da pasta ETLs/3 - Execute Procedures -> Executar as procedures correspondentes.

## Dashboard
Para visualizar o dashboard PowerBi entre na pasta dashboard e abra o arquivo Proposta.pbix