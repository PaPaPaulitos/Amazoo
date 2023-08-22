import random

ruas = ('Dois',
        'Três',
        'Um',
        'B',
        'Quatro',
        'Principal',
        'A',
        'C'
    )


bairros = ('Santa Teresa',
            'Ipanema',
            'Centro do Rio de Janeiro',
            'Barra da Tijuca',
            'Copacabana',
            'Lapa',
            'Leblon',
            'Botafogo',
            'Grajau',
            'Vila Isabel',
            'Tijuca'
)


class Endereco:
    def __init__(self):
        self.rua = ruas[random.randint(0,len(ruas)-1)]
        self.numero = random.randint(0,65535)
        self.bairro = bairros[random.randint(0,len(bairros)-1)]

    def __del__(self):
        print("Endereco desalocado \n")