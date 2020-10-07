# -*- coding: utf-8 -*-
"""
Editor Spyder

Este é um arquivo de script temporário.
"""

# Importa biblioteca math
import math

# Definição do método chamado get_pi()
def get_pi():
    """Recupera o valor de Pi"""
    return math.pi

#Definição do método chamado hello()
def hello(msg):
    mensagem = "Alô Mundo, o valor de Pi é: " + msg
    print(mensagem)


# Início do programa principal
msg = str(get_pi())

hello(msg)
