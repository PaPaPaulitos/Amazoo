import random
from model.pessoa import Pessoa
from model.endereco import Endereco
from model.funcionario import Funcionario
from controller.insert_vendas import introduzir_vendas
from controller.connection_factory import cursor,conexao

def introduzir_pessoas(number):
    for c in range(number):
            pessoa = Pessoa()

            pessoa_sql = f'INSERT INTO `pessoa`(idPessoa,id{pessoa.tipoPessoa},nome,cpf,dataDeNascimento,telefone,tipoPessoa) VALUES \n \
                    (GetSequenceVal("Pessoa"),\n \
                    GetSequenceVal("{pessoa.tipoPessoa}"), \n\
                    "{pessoa.nome}","xxxxxxxxxxx", \n\
                    Date("{pessoa.dataNascimento}"), \n\
                    "21965409149","{pessoa.tipoPessoa}" \n\
                    )'
            
            print(pessoa_sql)
            cursor.execute(pessoa_sql)
            conexao.commit()

            if pessoa.tipoPessoa == "Cliente":
                    cliente_sql = f'INSERT INTO `cliente`(idCliente,idPessoa) VALUES \n\
                            ((SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa") \n\
                            ,(SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"))'
                    
                    print(cliente_sql)
                    cursor.execute(cliente_sql)
                    conexao.commit()
                    introduzir_vendas()
                    
            else:
                    funcionario = Funcionario()
                    funcionario_sql = f'INSERT INTO `funcionario`(idFuncionario,idPessoa,idEntregador,tipoFuncionario,ctps) VALUES \n\
                            (\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                            "{funcionario.tipoFuncionario}","xxxxxxxxxxx"\n\
                            )'
                    
                    print(funcionario_sql)
                    cursor.execute(funcionario_sql)
                    conexao.commit()
                    if funcionario.tipoFuncionario == "Entregador":
                            entregador_sql = f'INSERT INTO `entregador`(idEntregador,Funcionario_Pessoa_idFuncionario) VALUES \n\
                                            (\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")\n\
                                            )'
                            
                            print(entregador_sql)
                            cursor.execute(entregador_sql)
                            conexao.commit()

                    else:
                            empacotador_sql = f'INSERT INTO `empacotador`(idEmpacotador,Funcionario_Pessoa_idFuncionario) VALUES \n\
                                            (\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                                            (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")\n\
                                            )'
                            
                            print(empacotador_sql)
                            cursor.execute(empacotador_sql)
                            conexao.commit()

                    banco_de_dados_sql = f'INSERT INTO `banco_de_horas`(idBancoDeHoras,idFuncionario,dataDoDia,tempoTrabalhado) VALUES \n\
                            (\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                                    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                                    NOW(),\n\
                            {random.randint(0,8)})'
                            
                    print(banco_de_dados_sql)
                    cursor.execute(banco_de_dados_sql)
                    conexao.commit()

                    del funcionario

            del pessoa
            endereco = Endereco()

            endereco_sql = f'INSERT INTO `endereco`(idEndereco,idPessoa,rua,cep,numero,bairro,cidade) VALUES \n\
                    ((SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa") \n\
                    ,(SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),\n\
                    "{endereco.rua}","xxxxxxxx",{endereco.numero},"{endereco.bairro}","Rio de Janeiro")'

            print(endereco_sql)
            del endereco

            cursor.execute(endereco_sql)
            conexao.commit()