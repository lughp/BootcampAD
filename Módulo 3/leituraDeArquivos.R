setwd("C:/Users/luciano/IGTI")

install.packages('readr')
library("readr")

# Leitura de arquivo CSV
file1 <- paste('C:/Users/luciano/IGTI/dados', "/contabilidade.csv", sep = "")
data0 <- read.csv(file1)
data1 <- read.csv2(file1)
print(data0)
print(data1)

# Leitura de arquivo CSV
file2 <- paste('C:/Users/luciano/IGTI/dados', "/Iris.csv", sep = "")
data2 <- read.table(file2, header = T, sep = "")
head(data2)
summary(data2)

# Leitura de arquivo TXT não tabelado
file3 <- paste('C:/Users/luciano/IGTI/dados', "/arquivoTXT.txt", sep = "")
data3 <- read.delim(file3)
print(data3)

# Escolhendo o arquivo no momento da leitura
data4 <- read.delim(file.choose(), encoding = 'utf-8')
print(data4)

# Leitura de arquivo Excel
data5 <- read.xlsx(file.choose())
read.xlsx(file.choose(), sheetName = "Janela do arquivo Excel")

# Leitura de arquivo disponível na internet
URl <- 'http://diretorios.ifb.edu.br/diretorios/908/arquivos/download/certificados.txt'
data6 <- read.delim(URl)
print(data6)
head(data6)

# Gravar dados obtidos
#outfile <- file('C:/Users/luciano/IGTI/dados/ifb_data.txt')
outfile <- 'C:/Users/luciano/IGTI/dados/ifb_data.txt'
print(outfile)
write.table(data6, outfile, append = FALSE, sep = "", row.names = FALSE, col.names = TRUE)

data7 <- read.delim(outfile)
head(data7)

# Conferir se um determinado arquivo de dados existe no diretório
nameFile <- 'arquivoTXT.txt'
file.exists(nameFile)

nameFile <- 'C:/Users/luciano/IGTI/dados/arquivoTXT.txt'
file.exists(nameFile)