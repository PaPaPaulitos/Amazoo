import random

produtos_petshop = (
    # Higiene
    [
        "Shampoo para cães de pelo longo",
        "Escova de dentes para gatos",
        "Condicionador para cães de pelo curto",
        "Sabonete líquido para animais de estimação",
        "Lenços umedecidos para limpeza de patas"
    ],
    # Acessórios
    [
        "Coleira de couro para cães",
        "Casinha para coelhos",
        "Arranhador para gatos",
        "Brinquedo para cães em formato de bola",
        "Comedouro automático para gatos"
    ],
    # Comida
    [
        "Ração para cães filhotes",
        "Alimento para tartarugas aquáticas",
        "Petisco para hamsters",
        "Suplemento alimentar para cães idosos",
        "Ração para gatos castrados"
    ],
    # Remédios
    [
        "Anti-inflamatório para cães",
        "Vermífugo para gatos",
        "Pomada cicatrizante para feridas de animais",
        "Xarope para tosse de cachorro",
        "Suplemento vitamínico para aves"
    ]
)

descricao_produtos = (
    # Higiene
    [
    "Shampoo para cães de pelo longo",
    "Escova de dentes para gatos",
    "Condicionador para cães de pelo curto",
    "Sabonete líquido para animais de estimação",
    "Lenços umedecidos para limpeza de patas"
    ],
    # Acessórios
    [
    "Coleira de couro para cães",
    "Casinha para coelhos",
    "Arranhador para gatos",
    "Brinquedo para cães em formato de bola",
    "Comedouro automático para gatos"
    ],
    # Comida
    [
    "Ração para cães filhotes",
    "Alimento para tartarugas aquáticas",
    "Petisco para hamsters",
    "Suplemento alimentar para cães idosos",
    "Ração para gatos castrados"
    ],
    
    # Remédios
    [
    "Anti-inflamatório para cães",
    "Vermífugo para gatos",
    "Pomada cicatrizante para feridas de animais",
    "Xarope para tosse de cachorro",
    "Suplemento vitamínico para aves"
    ]
 
)

tipoProduto = ('Higiene','Acessorio','Comida','Remedio')


class Produto:
    def __init__(self,produto):
        self.nome = produtos_petshop[produto][random.randint(0,len(produtos_petshop[produto])-1)]
        self.quantidade = random.randint(10,1000)
        self.descricao = descricao_produtos[produto][random.randint(0,len(descricao_produtos[produto])-1)]
        self.tipoProduto = tipoProduto[produto]
        self.codigoDeBarras = random.randint(44,5050)

    def __del__(self):
        print("Produto desalocado \n")


tipoHigiene = ('Necessidades','Banho')

class Higiene:
    def __init__(self):
        self.tipoHiene = tipoHigiene[random.randint(0,len(tipoHigiene)-1)]
    
    def __del__(self):
        print("Higiene desalocada \n")

tipoRemedio = ('Anti-bacteriano','Anti-inflamatorio','Analgesico','Anti-coaguante','Anti-histaminico')

class Remedio:
    def __init__(self):
        self.tipoRemedio = tipoRemedio[random.randint(0,len(tipoRemedio)-1)]
    
    def __del__(self):
        print("Remedio desalocado \n")

tipoComida = ('Racao','Petisco')

class Comida:
    def __init__(self):
        self.tipoComida = tipoComida[random.randint(0,len(tipoComida)-1)]
    
    def __del__(self):
        print("Comida desalocada \n")

tipoAcessorio = ('Roupa','Coleira','Briquedo','Cama','Bebedouro','Comedouro')

class Acessorio:
    def __init__(self):
        self.tipoAcessorio = tipoAcessorio[random.randint(0,len(tipoAcessorio)-1)]
    
    def __del__(self):
        print("Acessorio desalocado \n")