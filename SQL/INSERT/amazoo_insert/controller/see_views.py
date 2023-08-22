from design import *
from controller.connection_factory import cursor
import os
import time


def menu():
    os.system('cls')
    print(cores['verde'])
    print('9)Executar a view "primeiraCoisaQueCadaUmEmbalou" ')
    print('10)Executar a view "tudoQueFoiEmbalado" ')
    print('11)Executar a view "ondeMoraPessoaComP" ')
    print("\n \n Digite qualquer coisa para sair \n")
    print(cores['corOriginal'])

def ver_views():
    while(1):
        time.sleep(5)
        menu()
        print(cores['magenta'])
        print("Digite qual é a opcao desejada")
        print(cores['ciano'])
        opcao = str(input(amazoo))
        print(cores['amarelo'])

        if opcao == "1":
            pass
        elif opcao == "2":
            pass
        elif opcao == "3":
            pass
        elif opcao == "4":
            pass
        elif opcao == "5":
            pass
        elif opcao == "6":
            pass
        elif opcao == "7":
            pass
        elif opcao == "8":
            pass
        elif opcao == "9":
            query = ("SELECT * FROM primeiraCoisaQueCadaUmEmbalou;")
            cursor.execute(query)

            print("(Quem empacotou, produto)")
            for linha in cursor:
                print(linha)
            print(cores['ciano'])
            print(amazoo, end='')
            print(cores['corOriginal'], end='')
            print(" A view apresentada qual foi a primeira coisa embalada por cada empacotador \n")
        elif opcao == "10":
            query = ("SELECT * FROM tudoQueFoiEmbalado;")
            cursor.execute(query)

            print("(Quem empacotou, produto)")
            for linha in cursor:
                print(linha)
            print(cores['ciano'])
            print(amazoo, end='')
            print(cores['corOriginal'], end='')
            print(" A view apresentada mostra quais produtos foram embalados e por quem foi embalado \n")
        elif opcao == "11":
            query = ("SELECT * FROM ondeMoraPessoaComP;")
            cursor.execute(query)

            print("(nome , rua, numero, bairro)")
            for linha in cursor:
                print(linha)
            print(cores['ciano'])
            print(amazoo, end='')
            print(cores['corOriginal'], end='')
            print(" A view apresentada mostra onde mora as pessoas que começam com a letra P o nome \n")
        else:
            print(cores['ciano'])
            print("Obrigado por usar o Amazoo Insert Generator \n", end='')
            print(cores['corOriginal'], end='')

            break