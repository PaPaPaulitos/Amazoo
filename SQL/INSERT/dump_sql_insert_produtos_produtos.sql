/*

    Inserindo um Fornecedor de Higiene, Remedio, Comida e Acessorio


*/

INSERT INTO `fornecedor`(idFornecedor,idProduto,dataUlimaReposicao,quantidade,tipoProduto,nome) VALUES (
    GetSequenceVal("Fornecedor"),
    GetSequenceVal("Produto"),
    NOW(),
    8,
    'Higiene',
    "Osvaldo Produtos"

);

INSERT INTO `fornecedor`(idFornecedor,idProduto,dataUlimaReposicao,quantidade,tipoProduto,nome) VALUES (

    GetSequenceVal("Fornecedor"),
    GetSequenceVal("Produto"),
    NOW(),
    8,
    'Remedio',
    "Osvaldo Produtos"

);

INSERT INTO `fornecedor`(idFornecedor,idProduto,dataUlimaReposicao,quantidade,tipoProduto,nome) VALUES (

    GetSequenceVal("Fornecedor"),
    GetSequenceVal("Produto"),
    NOW(),
    8,
    'Comida',
    "Osvaldo Produtos"

);

INSERT INTO `fornecedor`(idFornecedor,idProduto,dataUlimaReposicao,quantidade,tipoProduto,nome) VALUES (

    GetSequenceVal("Fornecedor"),
    GetSequenceVal("Produto"),
    NOW(),
    8,
    'Acessorio',
    "Osvaldo Produtos"

);

/*

    Inserindo Produtos de Higiene, Remedio, Comida e Acessorio

*/


INSERT INTO `produto`(idProduto,dFornecedor,idHigiene,nome,preco,quantidade,descricao,tipoProduto,codigoDeBarras) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Fornecedor"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    "Tapete Higiênico",
    50.50,
    8,
    "Tapete para cachorros fazerem as necessidades",
    'Higiene',
    143

);

INSERT INTO `produto`(idProduto,dFornecedor,idRemedio,nome,preco,quantidade,descricao,tipoProduto,codigoDeBarras) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Fornecedor"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    "Anti-pulgas",
    50.00,
    10,
    "Para tirar as pulgas do seu bichinho",
    'Remedio',
    42
    
);

INSERT INTO `produto`(idProduto,dFornecedor,idComida,nome,preco,quantidade,descricao,tipoProduto,codigoDeBarras) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Fornecedor"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    "Ração Premiere",
    50.00,
    10,
    "Alimentar os seus cachorrinhos",
    'Comida',
    84
    
);

INSERT INTO `produto`(idProduto,dFornecedor,idAcessorio,nome,preco,quantidade,descricao,tipoProduto,codigoDeBarras) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Fornecedor"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    "Casaco preto",
    50.00,
    10,
    "Casaco preto tamanha P para cachorros",
    'Comida',
    192
    
);

/*

    Terminando de inserir o produto de Higiene

*/

INSERT INTO `higiene`(idHigiene,idProduto,tipoHigiene) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    'Necessidades'

);

/*

    Terminando de inserir o produto de Remedio

*/

INSERT INTO `remedio`(idRemedio,idProduto,tipoRemedio) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    'Anti-bacteriano'

);

/*

    Terminando de inserir o produto de Comida

*/

INSERT INTO `comida`(idHigiene,idProduto,tipoComida) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    'Racao'

);

/*

    Terminando de inserir o produto de Acessorio

*/

INSERT INTO `acessorio`(idAcessorio,idProduto,tipoAcessorio) VALUES (

    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    (SELECT vl_sequencia FROM sequencias WHERE nm_sequencia="Produto"),
    'Roupa'

);