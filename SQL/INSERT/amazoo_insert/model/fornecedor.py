import random

tipoProduto = ('Higiene','Acessorio','Comida','Remedio')

fornecedores = ("PetVet Distribuidora",
                "MaxiPets Comércio de Produtos Veterinários",
                "AnimalLife Atacadista",
                "VetCenter Distribuição",
                "Paws&Claws Distribuidora de Produtos para Animais",
                "VetShop Comércio e Distribuição",
                "PetStar Atacado e Varejo de Produtos Veterinários",
                "AmigoFiel Distribuidora de Produtos para Animais",
                "MundoPet Distribuidora",
                "PataFeliz Distribuidora de Alimentos e Acessórios para Animais")



class Fornecedor:
    def __init__(self):

        self.idProduto = random.randint(0,len(tipoProduto)-1)
        self.quantidade = random.randint(10,1000)
        self.produto = tipoProduto[self.idProduto]
        self.nome = fornecedores[random.randint(0,len(fornecedores)-1)]
        

    def __del__(self):
        print("Fornecedor desalocado \n")