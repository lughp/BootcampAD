#Instalação do pacote
install.packages('RMariaDB')

#importação do pacote

#Importar pacote RMariaDB se ele ainda não foi carregado
if (!"RMariaDB" %in% (.packages())){require(RMariaDB)}

#Conectar ao SGDB MySQL --> Banco de Dados bootcamp
con <- dbConnect(MariaDB(), user = "root", password = "root",
                dbname = "bootcamp", host = "localhost", serverTimezone = 'UTC')

#Para listar quais tabelas existem no esquema .bootcamp execute:

#Ler a lista de tabelas no DB
tables <- dbListTables(con)
tables

#Para consultar os dados de uma tabela, execute:
#dbReadTable(nome-da-conexao, "nome-da-tabela")

#Consultar os dados da tabela *estado*
tabledata <- dbReadTable(con, "estado")
tabledata

#Consultar os dados da tabela *cidade*
tabledata <- dbReadTable(con, "cidade")
tabledata

#Consultar os dados da tabela *imovel*
tabledata <- dbReadTable(con, "imovel")
tabledata

#Consultar os dados da tabela *tipounidade*
tabledata <- dbReadTable(con, "tipounidade")
tabledata

#Para executar um comando SQL execute:
#dbSendQuery(nome-da-conexão, "comando")

#Vamos inserir uma nova linha na tabela tipounidade
#Criar o comando e salvar na variável query
query <- "INSERT INTO tipounidade(idTipoUnidade, dscTipoUnidade) VALUES (7, 'Loft');"

#Opcional
print(query)

results <- dbSendQuery(con, query)
results

#Limpar resultados
dbClearResult(results)

#Consultar os dados da tabela *tipounidade*
tabledata <- dbReadTable(con, "tipounidade")
tabledata

#Inserção por parâmetros
id <- 8
desc <- 'Chácara'

query <- paste("INSERT INTO tipounidade(idTipoUnidade, dscTipoUnidade) VALUES (",id,",'",desc,"');", sep = '')

#Opcional
print(query)

results <- dbSendQuery(con, query)
results

#Limpar resultados
dbClearResult(results)

#Consultar os dados da tabela *tipounidade*
tabledata <- dbReadTable(con, "tipounidade")
tabledata

#Instalação de pacote
install.packages('xlsx')

#importação do pacote

#Importar pacote xlsx se ele ainda não foi carregado
if (!"xlsx" %in% (.packages())){require(xlsx)}

datasetpath <- 'C:/Users/luciano/IGTI/dados'

filename <- paste(datasetpath, "/estados.xlsx", sep = '')
filename

insertdata <- read.xlsx(filename, sheetIndex = 1, header = TRUE, encoding = "UTF-8")
insertdata

dbWriteTable(con, 'estado', insertdata, append = TRUE)

#Consultar os dados da tabela *estado*
tabledata <- dbReadTable(con, "estado")
tabledata

#Importar pacote xlsx se ele ainda não foi carregado
if (!"xlsx" %in% (.packages())){require(xlsx)}

query <- "SELECT * FROM estado;"

results <- dbGetQuery(con, query)
results

#Salva o resultado da query no arquivo CSV
write.csv(results, "C:/Users/luciano/IGTI/dados/estadosDB.csv", row.names = FALSE, quote = FALSE)

#dbCommit(con)

#Criar uma tabela vazia
query <- "CREATE TABLE caracteristicasgerais(
                idcaracteristicasGerais int NOT NULL AUTO_INCREMENT,
                dsccaracteristicasGerais varchar(150) NOT NULL,
                PRIMARY KEY (idcaracteristicasGerais));"

results <- dbSendQuery(con, query)
results

tables <- dbListTables(con)
tables

#Desconectar o Banco de Dados
dbDisconnect(con)