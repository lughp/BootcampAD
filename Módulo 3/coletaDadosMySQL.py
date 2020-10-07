#!/usr/bin/env python
# coding: utf-8

# # Coleta de Dados no MySQL utilizando o Python

# ### Para mais detalhes sobre o pacote mysql.connector consulte:

# * https://www.w3schools.com/python/python_mysql_getstarted.asp


#Importar pacote de conexão mysql
import mysql.connector


# Para instalação do pacote, execute o comando abaixo no prompt do Anaconda:
# 
# * conda install -c anaconda mysql-connector-python
# 

# #### Conectar ao MySQL Server sem selecionar um banco de dados

mydb = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'root'
)

print(mydb)

mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for db in mycursor:
    print(db)


# #### Para criar um banco de dados use o comando abaixo

mycursor.execute("CREATE DATABASE mydatabase")


# #### Conectar ao MySQL Server selecionando um banco de dados

mydb = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'root',
    database = 'bootcamp'
)

print(mydb)

mycursor = mydb.cursor()


# #### Exibir tabelas na base de dados

mycursor.execute("SHOW TABLES")

for db in mycursor:
    print(db)


# #### Criar uma tabela

mycursor.execute("CREATE TABLE caracteristicageralimovel (    idCaracteristicasImovel int NOT NULL AUTO_INCREMENT,     idcaracteriticasGerais int NOT NULL,     idImovel int NOT NULL,     PRIMARY KEY (idCaracteristicasImovel),     KEY fk_caracteriticasGerais_has_Imovel_Imovel1_idx (idImovel),     KEY fk_caracteriticasGerais_has_Imovel_caracteristicasGerais1_idx (idcaracteriticasGerais),     CONSTRAINT fk_caracteriticasGerais_has_Imovel_caracteristicasGerais1 FOREIGN KEY (idcaracteriticasGerais)                    REFERENCES caracteristicasgerais (idcaracteristicasGerais),    CONSTRAINT fk_caracteriticasGerais_has_Imovel_Imovel1_idx FOREIGN KEY (idImovel)                    REFERENCES imovel (idImovel))")


# #### Verificar tabela construída

mycursor.execute("SHOW TABLES")

for db in mycursor:
    print(db)


# #### Inserir registro em tabela

query = "INSERT INTO caracteristicasgerais (idcaracteristicasGerais, dsccaracteristicasGerais) VALUES (%s, %s)"
values = (1, "Portaria 24 horas")
mycursor.execute(query, values)

mydb.commit()

print(mycursor.rowcount, "registro(s) inserido(s).")


# #### Inserindo múltiplos valores

values = [(2, "Elevador"), (3, "Piscina")]
mycursor.executemany(query, values)

mydb.commit()

print(mycursor.rowcount, "registro(s) inserido(s).")


# #### Consultar toda a tabela

mycursor.execute("SELECT * FROM caracteristicasgerais")

myresult = mycursor.fetchall()

for mydata in myresult:
    print(mydata)


# #### Consultar um registro

mycursor.execute("SELECT idcaracteristicasGerais, dsccaracteristicasGerais FROM caracteristicasgerais")

myresult = mycursor.fetchone()

print(myresult)


# #### Importação de arquivo CSV

import csv

#Leitura de arquivo sem utilizar biblioteca Pandas

filename = 'C:/Users/luciano/IGTI/dados/cidades.csv'

with open (filename, 'r') as incsvfile:
    reader = csv.reader(incsvfile, delimiter = ',')
    next(reader, None) #skip the headers
    for line in reader:
        #print(line)
        #print(line[1])
        mycursor.execute ("INSERT INTO cidade (CodigoCompletoIBGE, CodigoCidadeIBGE, NomeCidade, CodEstadoIBGE)                     VALUES (%s, %s, %s, %s)", line)

mydb.commit()

print(mycursor.rowcount, "registro(s) inserido(s).")

incsvfile.close()


# #### Consultar quantidade de itens inseridos

mycursor.execute("SELECT count(*) FROM cidade")

myresult = mycursor.fetchone()

print(myresult)


# #### Importação de arquivo CSV (outra forma)

import csv

#Leitura de arquivo
csv_data = csv.reader('C:/Users/luciano/IGTI/dados/cidades.csv')
csv_data

for row in csv_data:
    i = 0
    print(row)
    if i > 3:
        break
        
#for row in csv_data:
#    mycursor.execute ("INSERT INTO cidade (CodigoCompletoIBGE, CodigoCidadeIBGE, NomeCidade, CodEstadoIBGE) \
#                    VALUES (%s, %s, %s, %s)", row)
