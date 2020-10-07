install.packages('jsonlite')
library(jsonlite)

# Leitura de arquivo Json
jsondata1 <- read_json(file.choose(), simplifyVector = FALSE)
print(jsondata1)

jsondata2 <- read_json(file.choose(), simplifyVector = TRUE)
print(jsondata2)

jsonlist <- list(jsondata1, jsondata2)

write_json(jsonlist, 'C:/Users/luciano/IGTI/dados/arquivoJson.json')

jsondata3 <- read_json('C:/Users/luciano/IGTI/dados/arquivoJson.json', simplifyVector = TRUE)
print(jsondata3)