import random
from controller.connection_factory import cursor,conexao
from model.venda import Venda

venda = Venda()

def introduzir_vendas():
    for c in range(random.randint(0,3)):

                                carrinho_sql = f'INSERT INTO `carrinho`(idCarrinho, idCliente, idProduto,dataHora) VALUES \n\
                                                (\n\
                                                {venda.carrinho},\n\
                                                (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                                                (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),\n\
                                                NOW()\n\
                                                )'
                                
                                print(carrinho_sql)
                                cursor.execute(carrinho_sql)
                                conexao.commit()

                                venda_sql = f'INSERT INTO `venda`(idVenda,idCarrinho,dataHora) VALUES\n\
                                                (\n\
                                                {venda.carrinho},\n\
                                                {venda.carrinho},\n\
                                                NOW())'
                                
                                print(venda_sql)
                                cursor.execute(venda_sql)
                                conexao.commit()

                                entrega_sql = f'INSERT INTO `entrega` (idEntrega, idPacote, idEntregador, foiEntregue, quemRecebeu)\n\
                                        VALUES ({venda.entrega}, {venda.carrinho}, (SELECT COALESCE((SELECT MAX(idEntregador) FROM entregador), 1)), 1, "Fulano da Silva");'
                                
                                print(entrega_sql)
                                cursor.execute(entrega_sql)
                                conexao.commit()

                                pacote_sql = f'INSERT INTO `pacote`(idPacote,idEntrega,Venda_idVenda,idEmpacotador) VALUES \n\
                                                (\n\
                                                {venda.entrega},\n\
                                                {venda.entrega},\n\
                                                {venda.carrinho},\n\
                                                (SELECT COALESCE((SELECT MAX(idEmpacotador) FROM empacotador), 1))\n\
                                                )'
                                
                                print(pacote_sql)
                                cursor.execute(pacote_sql)
                                conexao.commit()

                                venda.carrinho = 1 + venda.carrinho
                                venda.entrega = 1 + venda.entrega 