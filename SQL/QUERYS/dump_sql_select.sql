/*
  1)  Vendo o que tem no carrinho do Cliente, mas o nome não é Adriano

*/

SELECT pessoa.nome as Cliente, produto.nome as Produto
FROM produto 
INNER JOIN carrinho as c ON produto.idProduto = c.idProduto 
INNER JOIN cliente ON c.idCliente = cliente.idCliente
INNER JOIN pessoa ON pessoa.idPessoa = cliente.idPessoa
WHERE EXISTS (
  SELECT 1
  FROM cliente c2
  INNER JOIN pessoa p2 ON p2.idPessoa = c2.idPessoa
  WHERE c2.idCliente = cliente.idCliente AND p2.nome LIKE "A%" AND p2.nome NOT IN ("Adriano")
);



/*
  2)  Vendo o que pessoas que começam com J compraram em 2023

*/

SELECT pessoa.nome as Cliente, produto.nome as Produto
FROM produto 
INNER JOIN carrinho as c ON produto.idProduto = c.idProduto 
INNER JOIN cliente ON c.idCliente = cliente.idCliente
INNER JOIN (
  SELECT idCarrinho
  FROM venda
  WHERE dataHora BETWEEN '2023-01-01' AND '2023-12-31'
) as v ON v.idCarrinho = c.idCarrinho
INNER JOIN pessoa ON pessoa.idPessoa = cliente.idPessoa;



/*

  3)  Vendo se o produto do cliente já foi entregue

*/

SELECT
  p.nome, 
  CASE 
    WHEN NOT EXISTS (
      SELECT 
        1
      FROM 
        produto as p2
        INNER JOIN carrinho ON carrinho.idProduto = p2.idProduto
        INNER JOIN cliente ON cliente.idCliente = carrinho.idCliente
        INNER JOIN venda ON venda.idCarrinho = carrinho.idCarrinho
        INNER JOIN pacote ON pacote.Venda_idVenda = venda.idVenda
        INNER JOIN entrega as e ON e.idEntrega = pacote.idEntrega
      WHERE 
        p2.idProduto = p.idProduto
        AND e.foiEntregue = 0
    ) THEN 'Sim'
    ELSE 'Não'
  END AS foiEntregue
FROM
  produto as p;


/*

  4)  Vendo quantas horas um funcionario trabalhou naquele dia

*/

SELECT
  p.nome, 
  b.tempoTrabalhado,
  (
    SELECT 
      sum(b2.tempoTrabalhado) 
    FROM 
      banco_de_horas as b2 
    WHERE 
      b2.idFuncionario = f.idFuncionario 
      AND DATE(b2.dataDoDia) = '2023-04-09'
  ) as tempoTrabalhado
FROM
  pessoa as p
INNER JOIN
  funcionario as f
ON
  p.idPessoa = f.idPessoa
INNER JOIN
  banco_de_horas as b
ON
  b.idFuncionario = f.idFuncionario;


/*

  5)  Vendo qual produto o fornecedor vende que tem P no meio do nome

*/

SELECT
    f.nome as Fornecedor, 
    p.nome as Produto
FROM
    fornecedor f
INNER JOIN
    produto p
ON
    p.idFornecedor = f.idFornecedor
WHERE
    p.nome LIKE 
        (SELECT CONCAT('%', 'P' , '%') FROM fornecedor WHERE idFornecedor = f.idFornecedor);

  /*

  6)  Essa query retorna o nome do fornecedor, nome do produto, data da última reposição e quantidade do produto em estoque para os produtos cuja quantidade em estoque do fornecedor é maior ou igual a qualquer outra quantidade em estoque de outros fornecedores.

Para isso, ela usa uma sub-query que compara a quantidade em estoque do fornecedor atual com a quantidade em estoque de todos os outros fornecedores, retornando apenas o maior valor. Esse valor é comparado com a quantidade em estoque do fornecedor atual usando o operador ALL. Dessa forma, a query retorna apenas os produtos que são fornecidos pelo fornecedor com a maior quantidade em estoque.

  */

SELECT
    f.nome,
    p.nome,
    f.dataDaUltimaReposicao,
    f.quantidade
FROM
    fornecedor f
INNER JOIN
    produto p
ON
    p.idFornecedor = f.idFornecedor
WHERE
    f.quantidade >= ALL
        (SELECT quantidade FROM fornecedor WHERE idFornecedor != f.idFornecedor);

/*

  7)  Aonde tem que entregar o pacote

*/


SELECT
  p.nome, pessoa.nome, endereco.rua
FROM
  produto as p
INNER JOIN
    carrinho as c
ON
  p.idProduto = c.idProduto 
INNER JOIN
  cliente
ON
   c.idCliente = cliente.idCliente
INNER JOIN
    venda as v
ON
    v.idCarrinho = c.idCarrinho
INNER JOIN  
    pacote
ON 
    pacote.Venda_idVenda = v.idVenda
INNER JOIN
    entrega
ON
    pacote.idEntrega = entrega.idEntrega
INNER JOIN
    pessoa
ON
    cliente.idPessoa = Pessoa.idPessoa
INNER JOIN
    endereco 
ON
    endereco.idPessoa = pessoa.idPessoa;


/* 

  8)  Quem entregou o pacote

*/


SELECT pessoa.nome AS "Quem entregou", produto.nome AS "Produto"
FROM pessoa
INNER JOIN funcionario AS f ON f.idPessoa = pessoa.idPessoa
INNER JOIN entregador AS e ON e.idEntregador = f.idEntregador
INNER JOIN entrega AS en ON en.idEntregador = e.idEntregador
INNER JOIN pacote AS pa ON pa.idEntrega = en.idEntrega
INNER JOIN venda AS v ON v.idVenda = pa.Venda_idVenda
INNER JOIN carrinho AS c ON c.idCarrinho = v.idCarrinho
INNER JOIN cliente AS cli ON cli.idCliente = c.idCliente
INNER JOIN produto ON produto.idProduto = c.idProduto
WHERE EXISTS (
    SELECT 1
    FROM pacote AS pa2
    INNER JOIN entrega AS en2 ON en2.idEntrega = pa2.idEntrega
    INNER JOIN entregador AS e2 ON e2.idEntregador = en2.idEntregador
    INNER JOIN funcionario AS f2 ON f2.idEntregador = e2.idEntregador
    WHERE f2.idPessoa = pessoa.idPessoa AND pa2.Venda_idVenda = v.idVenda
)
ORDER BY pessoa.nome;


/*

  9)  Quem empacotou o pacote


*/

/* Mostrando o primeiro que cada um embalou */

CREATE VIEW primeiraCoisaQueCadaUmEmbalou AS 
SELECT 
    sub1.`Quem empacotou`, 
    sub2.`Produto`
FROM 
    (SELECT empacotador.idEmpacotador, pessoa.nome as "Quem empacotou" 
     FROM empacotador 
     INNER JOIN funcionario as f ON empacotador.Funcionario_Pessoa_idFuncionario = f.idFuncionario 
     INNER JOIN pessoa ON f.idPessoa = pessoa.idPessoa) as sub1 
INNER JOIN 
    (SELECT pacote.idPacote, produto.nome as "Produto" 
     FROM pacote 
     INNER JOIN venda as v ON pacote.Venda_idVenda = v.idVenda 
     INNER JOIN carrinho as c ON v.idCarrinho = c.idCarrinho 
     INNER JOIN produto ON produto.idProduto = c.idProduto) as sub2 
ON 
    sub1.idEmpacotador = sub2.idPacote;

SELECT * FROM primeiraCoisaQueCadaUmEmbalou;

/* Mostrando tudo que cada um embalou */    

CREATE VIEW tudoQueFoiEmbalado AS 
SELECT pessoa.nome as "Quem empacotou", produto.nome as "Produto"
FROM produto
INNER JOIN carrinho as c ON produto.idProduto = c.idProduto 
INNER JOIN cliente ON c.idCliente = cliente.idCliente
INNER JOIN venda as v ON v.idCarrinho = c.idCarrinho
INNER JOIN pacote ON pacote.Venda_idVenda = v.idVenda
INNER JOIN empacotador ON pacote.idEmpacotador = empacotador.idEmpacotador
INNER JOIN funcionario as f ON f.idFuncionario = empacotador.Funcionario_Pessoa_idFuncionario
INNER JOIN pessoa ON f.idPessoa = pessoa.idPessoa
WHERE pessoa.nome IN (
  SELECT DISTINCT pessoa.nome
  FROM produto
  INNER JOIN carrinho as c ON produto.idProduto = c.idProduto 
  INNER JOIN cliente ON c.idCliente = cliente.idCliente
  INNER JOIN venda as v ON v.idCarrinho = c.idCarrinho
  INNER JOIN pacote ON pacote.Venda_idVenda = v.idVenda
  INNER JOIN empacotador ON pacote.idEmpacotador = empacotador.idEmpacotador
  INNER JOIN funcionario as f ON f.idFuncionario = empacotador.Funcionario_Pessoa_idFuncionario
  INNER JOIN pessoa ON f.idPessoa = pessoa.idPessoa
  GROUP BY pessoa.nome
);

SELECT * FROM tudoQueFoiEmbalado;


/*

  10)  Endereço das Pessoas

*/

CREATE VIEW ondeMoraPessoaComP AS 
SELECT
  p.nome, e.rua, e.numero, e.bairro
FROM
  pessoa AS p
INNER JOIN
  endereco AS e
ON
  p.idPessoa = e.idPessoa
WHERE
  p.nome LIKE "P%";

SELECT * FROM ondeMoraPessoaComP;
