/*
    Inserindo Cliente 
*/

INSERT INTO `pessoa`(idPessoa,idCliente,nome,cpf,dataDeNascimento,telefone,tipoPessoa) VALUES 
(GetSequenceVal("Pessoa"),GetSequenceVal("Cliente"),"Paulo Ricardo","xxxxxxxxxxx",Date("2002-09-10"),"21965409149","Cliente");


/* 
    Inserindo Funcionario
*/

INSERT INTO `pessoa`(idPessoa,idFuncionario,nome,cpf,dataDeNascimento,telefone,tipoPessoa) VALUES 
(GetSequenceVal("Pessoa"),GetSequenceVal("Funcionario"),"Paulo Ricardo","xxxxxxxxxxx",Date("2002-09-10"),"21965409149","Funcionario");

/*

    Inserindo o Endereço da pessoa

*/


INSERT INTO `endereco`(idEndereco,idPessoa,rua,cep,numero,bairro,cidade) VALUES 
((SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
(SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
"Itabaiana","20561050",57,"Grajau","Rio de Janeiro");


UPDATE `pessoa`
    SET
        Endereco_idEndereco = (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
        Endereco_idPessoa =(SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")
    WHERE
        idPessoa = Endereco_idPessoa =(SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa");


/*

    Criando o Cliente

*/

INSERT INTO `cliente`(idCliente,idPessoa) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")
);

/*

    Criando o Funcionario Entregador

*/

INSERT INTO `funcionario`(idFuncionario,idPessoa,idEntregador,tipoFuncionario,ctps) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    "Entregador",
    "xxxxxxxxxxx"
);

/*

    Criando o Funcionario Empacotador

*/

INSERT INTO `funcionario`(idFuncionario,idPessoa,idEmpacotador,tipoFuncionario,ctps) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    "Empacotador",
    "xxxxxxxxxxx"
);

/*
    Inserindo empacotador

*/

INSERT INTO `empacotador`(idEmpacotador,Funcionario_Pessoa_idFuncionario) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")

);

/*

    Inserindo Entregador

*/


INSERT INTO `entregador`(idEntregador,Funcionario_Pessoa_idFuncionario) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")

);

/*

    Banco de Horas do Funcionario

*/


INSERT INTO `banco_de_horas`(idBancoDeHoras,idFuncionario,dataDoDia,tempoTrabalhado) VALUES (

    GetSequenceVal("Banco"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    NOW(),
    8

);
