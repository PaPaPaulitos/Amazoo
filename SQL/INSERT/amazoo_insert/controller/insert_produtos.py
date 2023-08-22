from model.fornecedor import Fornecedor
from model.produto import *
from controller.connection_factory import cursor,conexao

def introduzir_produtos(number):
    for c in range(number):
            fornecedor = Fornecedor()

            fornecedor_sql = f'INSERT INTO `fornecedor`(idFornecedor,idProduto,dataDaUltimaReposicao,quantidade,tipoProduto,nome) VALUES \n\
                    (GetSequenceVal("Fornecedor"),\n\
                    GetSequenceVal("Produto"),\n\
                    NOW(),{fornecedor.quantidade},"{fornecedor.produto}", "{fornecedor.nome}")'
            
            print(fornecedor_sql)
            cursor.execute(fornecedor_sql)
            conexao.commit()

            produto = Produto(fornecedor.idProduto)

            produto_sql = f'INSERT INTO `produto`(idProduto,idFornecedor,idHigiene,nome,preco,quantidade,descricao,tipoProduto,codigoDeBarras) VALUES \n\
                            (\n\
                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Fornecedor"),\n\
                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                            "{produto.nome}",50.50,{produto.quantidade},"{produto.descricao}","{produto.tipoProduto}",{produto.codigoDeBarras})'
            
            print(produto_sql)
            cursor.execute(produto_sql)
            conexao.commit()


            if produto.tipoProduto == "Higiene":
                    higiene = Higiene()
                    hiegene_sql = f'INSERT INTO `higiene`(idHigiene,idProduto,tipoHigiene) VALUES \n\
                                    ((SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                    "{higiene.tipoHiene}")'
            
                    print(hiegene_sql)
                    cursor.execute(hiegene_sql)
                    conexao.commit()

                    del higiene

            elif produto.tipoProduto == "Acessorio":
                    acessorio = Acessorio()

                    acessorio_sql = f'INSERT INTO `acessorio`(idAcessorio,idProduto,tipoAcessorio) VALUES \n\
                                    (\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                            "{acessorio.tipoAcessorio}"\n\
                                    )'
            
                    print(acessorio_sql)
                    cursor.execute(acessorio_sql)
                    conexao.commit()

                    del acessorio

            elif produto.tipoProduto == "Comida":
                    comida = Comida()

                    comida_sql = f'INSERT INTO `comida`(idComida,idProduto,tipoComida) VALUES \n\
                            (\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                    "{comida.tipoComida}"\n\
                            )'
            
                    print(comida_sql)
                    cursor.execute(comida_sql)
                    conexao.commit()

                    del comida
            else:
                    remedio = Remedio()

                    remedio_sql = f'INSERT INTO `remedio`(idRemedio,idProduto,tipoRemedio) VALUES \n\
                                    (\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                            "{remedio.tipoRemedio}"\n\
                                    )'
            
                    print(remedio_sql)
                    cursor.execute(remedio_sql)
                    conexao.commit()
                    
                    del remedio

            del fornecedor
            del produto


