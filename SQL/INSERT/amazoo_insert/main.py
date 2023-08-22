from model.produto import *
from controller.connection_factory import conexao
from controller.insert_produtos import introduzir_produtos
from controller.insert_pessoas import introduzir_pessoas
import climage
from controller.see_views import *
from design import *

output = climage.convert("./dog.webp")
print(output)

print(cores['vermelho'])
print(amazoo_texto)
print(cores['verde'])
print(quantos_produtos)
print(cores['ciano'])
produtos =  int(input(amazoo))
print(cores['verde'])
print(quantas_pessoas)
print(cores['ciano'])
pessoas =  int(input(amazoo))
print(cores['amarelo'])
introduzir_produtos(produtos)
introduzir_pessoas(pessoas)
print(cores['magenta'])
print(conclusao)
ver_views()
print(cores['corOriginal'])

conexao.close()
