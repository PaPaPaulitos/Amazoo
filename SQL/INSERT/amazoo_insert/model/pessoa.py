import random
import time
import random

clienteoufuncionario = ("Cliente","Funcionario")

resposta_cliente_ou_funcionario = clienteoufuncionario[random.randint(0,len(clienteoufuncionario)-1)]

nomes = ('Joao',
        'Jose',
        'Antonio',
        'Enzo',
        'Tiago',
        'Marcos',
        'Bernado',
        'Adriano',
        'Davi',
        'Leandro',
        'Guilherme',
        'Andre',
        'Jonas',
        'Paulo'
)


dia = ('01','02','03','04','05','06','07','08','09','10','11',
        '12','13','14','15','16','17','18','19','20','21','22',
        '23','24','25','26','27','28')

mes = ('01','02','03','04','05','06','07','08','09','10','11',
        '12')


class Pessoa:
    def __init__(self):
        self.nome = nomes[random.randint(0,len(nomes)-1)]
        self.tipoPessoa = clienteoufuncionario[random.randint(0,len(clienteoufuncionario)-1)]
        self.dataNascimento = str(random.randint(1950,2023)) + "-" +mes[random.randint(0,len(mes)-1)] + "-" + dia[random.randint(0,len(dia)-1)]


    def __del__(self):
        print("Pessoa desalocada \n")