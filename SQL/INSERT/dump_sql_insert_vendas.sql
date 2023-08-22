
/*

    Criando uma entrega e depois que a entrega foi realizada

*/

INSERT INTO `entrega`(idEntrega, idPacote, idEntregador) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Entrega"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Venda"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")

);


UPDATE `entrega`
    SET
        foiEntregue = 1,
        quemRecebeu = "Fulano da Silva"
    WHERE
        idEntrega = (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Entrega");




/*

    Cliente adicionando Itens ao carrinho

*/

INSERT INTO `carrinho`(idCarrinho, idCliente, idProduto,dataHora) VALUES
(
    GetSequenceVal("Carrinho"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    NOW()

);

/*

    Cliente finalizando a venda

*/

INSERT INTO `venda`(idVenda,idCarrinho,dataHora) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Carrinho"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Carrinho"),
    NOW()

);

/*

    Carrinho virando venda

*/

INSERT INTO `venda`(idVenda,idCarrinho,dataHora) VALUES
(
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Carrinho"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Carrinho"),
    NOW()

);

/*

    Venda virando pacote

*/

INSERT INTO `pacote`(idPacote,idEntrega,Venda_idVenda,idEmpacotador) VALUES
(
    GetSequenceVal("Pacote"),
    GetSequenceVal("Entrega"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Carrinho"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Pessoa")

);




INSERT INTO `pacote`(idPacote,idEntrega,Venda_idVenda,idEmpacotador) VALUES \n\
(\n\
    {entrega},\n\
    {entrega},\n\
    {carrinho},\n\
    (SELECT COALESCE((SELECT MAX(idEntregador) FROM empacotador), 1))\n\
)