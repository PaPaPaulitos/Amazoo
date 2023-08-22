import random

tipoFuncionario  = ('Entregador','Empacotador')


class Funcionario:
    def __init__(self):
        self.tipoFuncionario = tipoFuncionario[random.randint(0,len(tipoFuncionario)-1)]

    def __del__(self):
        print("Funcionario desalocado \n")