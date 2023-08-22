CREATE TABLE Fornecedor (
  idFornecedor INTEGER UNSIGNED  NOT NULL   ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  nome VARCHAR(20) NOT NULL ,
  dataDaUltimaReposicao DATE  NULL  ,
  quantidade INTEGER UNSIGNED  NOT NULL DEFAULT 0 ,
  tipoProduto ENUM("Higiene", "Remedio","Comida","Acessorio")  NOT NULL    ,
PRIMARY KEY(idFornecedor, idProduto));



CREATE TABLE Entrega (
  idEntrega INTEGER UNSIGNED  NOT NULL   ,
  idPacote INTEGER UNSIGNED  NOT NULL  ,
  idEntregador INTEGER UNSIGNED  NOT NULL  ,
  foiEntregue BOOL NOT NULL ,
  quemRecebeu VARCHAR(30)  NULL    ,
PRIMARY KEY(idEntrega, idPacote,idEntregador));



CREATE TABLE Endereco (
  idEndereco INTEGER UNSIGNED  NOT NULL   ,
  idPessoa INTEGER UNSIGNED  NOT NULL  ,
  rua VARCHAR(30)  NOT NULL  ,
  cep CHAR(9)  NOT NULL  ,
  numero SMALLINT UNSIGNED  NOT NULL  ,
  bairro VARCHAR(20)  NOT NULL  ,
  cidade VARCHAR(30)  NOT NULL    ,
PRIMARY KEY(idEndereco, idPessoa));



CREATE TABLE Venda (
  idVenda INTEGER UNSIGNED  NOT NULL   ,
  idCarrinho INTEGER UNSIGNED  NOT NULL   ,
  dataHora DATE  NULL    ,
PRIMARY KEY(idVenda,idCarrinho));



CREATE TABLE Banco_de_Horas (
  idBancoDeHoras INTEGER UNSIGNED  NOT NULL   ,
  idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  dataDoDia DATE  NULL  ,
  tempoTrabalhado TIME  NOT NULL DEFAULT 0   ,
PRIMARY KEY(idBancoDeHoras, idFuncionario));



CREATE TABLE Pessoa (
  idPessoa INTEGER UNSIGNED  NOT NULL   ,
  idCliente INTEGER UNSIGNED  NOT NULL  ,
  idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Endereco_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Endereco_idEndereco INTEGER UNSIGNED  NOT NULL  ,
  nome  VARCHAR(50)  NOT NULL  ,
  cpf CHAR(11)  NOT NULL  ,
  dataDeNascimento DATE  NOT NULL  ,
  telefone CHAR(11)  NOT NULL  ,
  tipoPessoa ENUM("Cliente","Funcionario")  NOT NULL    ,
PRIMARY KEY(idPessoa, idCliente, idFuncionario)  ,
INDEX Pessoa_FKIndex1(Endereco_idEndereco, Endereco_idPessoa),
  FOREIGN KEY(Endereco_idEndereco, Endereco_idPessoa)
    REFERENCES Endereco(idEndereco, idPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Carrinho (
  idCarrinho INTEGER UNSIGNED  NOT NULL   ,
  idCliente INTEGER UNSIGNED  NOT NULL  ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  Venda_idVenda INTEGER UNSIGNED  NOT NULL  ,
  dataHora DATE  NOT NULL    ,
PRIMARY KEY(idCarrinho, idCliente, idProduto)  ,
INDEX Carrinho_FKIndex1(Venda_idVenda),
  FOREIGN KEY(Venda_idVenda)
    REFERENCES Venda(idVenda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Produto (
  idProduto INTEGER UNSIGNED  NOT NULL   ,
  idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  idAcesorio INTEGER UNSIGNED  NOT NULL  ,
  idComida INTEGER UNSIGNED  NOT NULL  ,
  idRemedio INTEGER UNSIGNED  NOT NULL  ,
  idHigiene INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idProduto INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idCarrinho INTEGER UNSIGNED  NOT NULL  ,
  Fornecedor_idProduto INTEGER UNSIGNED  NOT NULL  ,
  Fornecedor_idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  nome VARCHAR(20)  NOT NULL  ,
  preco DOUBLE PRECISION  NOT NULL  ,
  quantidade INTEGER UNSIGNED  NOT NULL  ,
  descricao TEXT  NOT NULL  ,
  tipoProduto ENUM("Higiene","Remedio","Comida","Acessorio")  NOT NULL  ,
  codigoDeBarras INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idProduto, idFornecedor, idAcesorio, idComida, idRemedio, idHigiene)  ,
INDEX Produto_FKIndex2(Fornecedor_idFornecedor, Fornecedor_idProduto)  ,
INDEX Produto_FKIndex(Carrinho_idCarrinho, Carrinho_idCliente, Carrinho_idProduto),
  FOREIGN KEY(Fornecedor_idFornecedor, Fornecedor_idProduto)
    REFERENCES Fornecedor(idFornecedor, idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Carrinho_idCarrinho, Carrinho_idCliente, Carrinho_idProduto)
    REFERENCES Carrinho(idCarrinho, idCliente, idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Pacote (
  idPacote INTEGER UNSIGNED  NOT NULL   ,
  Entrega_idPacote INTEGER UNSIGNED  NOT NULL  ,
  Entrega_idEntrega INTEGER UNSIGNED  NOT NULL  ,
  Venda_idVenda INTEGER UNSIGNED  NOT NULL  ,
  idEntrega INTEGER UNSIGNED NOT NULL    ,
  idEmpacotador INTEGER UNSIGNED NOT NULL    ,
PRIMARY KEY(idPacote,idEntrega,idEmpacotador)  ,
INDEX Pacote_FKIndex3(Venda_idVenda)  ,
INDEX Pacote_FKIndex2(Entrega_idEntrega, Entrega_idPacote),
  FOREIGN KEY(Venda_idVenda)
    REFERENCES Venda(idVenda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Entrega_idEntrega, Entrega_idPacote)
    REFERENCES Entrega(idEntrega, idPacote)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED  NOT NULL   ,
  idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idProduto INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Carrinho_idCarrinho INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idCliente, idPessoa, Pessoa_idFuncionario, Pessoa_idCliente, Pessoa_idPessoa)  ,
INDEX Cliente_FKIndex1(Pessoa_idPessoa, Pessoa_idCliente, Pessoa_idFuncionario)  ,
INDEX Cliente_FKIndex2(Carrinho_idCarrinho, Carrinho_idCliente, Carrinho_idProduto),
  FOREIGN KEY(Pessoa_idPessoa, Pessoa_idCliente, Pessoa_idFuncionario)
    REFERENCES Pessoa(idPessoa, idCliente, idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Carrinho_idCarrinho, Carrinho_idCliente, Carrinho_idProduto)
    REFERENCES Carrinho(idCarrinho, idCliente, idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Funcionario (
  idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Pessoa_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  idEntregador INTEGER UNSIGNED  NOT NULL  ,
  idEmpacotador INTEGER UNSIGNED  NOT NULL  ,
  Banco_de_Horas_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Banco_de_Horas_idBancoDeHoras INTEGER UNSIGNED  NOT NULL  ,
  tipoFuncionario ENUM("Entregador","Empacotador")  NOT NULL,
  ctps CHAR(11)  NOT NULL    ,
PRIMARY KEY(idFuncionario, idPessoa, Pessoa_idFuncionario, Pessoa_idCliente, Pessoa_idPessoa, idEntregador, idEmpacotador)  ,
INDEX Funcionario_FKIndex1(Pessoa_idPessoa, Pessoa_idCliente, Pessoa_idFuncionario)  ,
INDEX Funcionario_FKIndex2(Banco_de_Horas_idBancoDeHoras, Banco_de_Horas_idFuncionario),
  FOREIGN KEY(Pessoa_idPessoa, Pessoa_idCliente, Pessoa_idFuncionario)
    REFERENCES Pessoa(idPessoa, idCliente, idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Banco_de_Horas_idBancoDeHoras, Banco_de_Horas_idFuncionario)
    REFERENCES Banco_de_Horas(idBancoDeHoras, idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Entregador (
  idEntregador INTEGER UNSIGNED  NOT NULL   ,
  Funcionario_Pessoa_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_Pessoa_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_Pessoa_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idEmpacotador INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idEntregador INTEGER UNSIGNED  NOT NULL  ,
  Entrega_idPacote INTEGER UNSIGNED  NOT NULL  ,
  Entrega_idEntrega INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idEntregador, Funcionario_Pessoa_idPessoa, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idFuncionario, Funcionario_idPessoa, Funcionario_idFuncionario, Funcionario_idEmpacotador, Funcionario_idEntregador)  ,
INDEX Entregador_FKIndex1(Funcionario_idFuncionario, Funcionario_idPessoa, Funcionario_Pessoa_idFuncionario, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idPessoa, Funcionario_idEntregador, Funcionario_idEmpacotador)  ,
INDEX Entregador_FKIndex2(Entrega_idEntrega, Entrega_idPacote),
  FOREIGN KEY(Funcionario_idFuncionario, Funcionario_idPessoa, Funcionario_Pessoa_idFuncionario, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idPessoa, Funcionario_idEntregador, Funcionario_idEmpacotador)
    REFERENCES Funcionario(idFuncionario, idPessoa, Pessoa_idFuncionario, Pessoa_idCliente, Pessoa_idPessoa, idEntregador, idEmpacotador)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Entrega_idEntrega, Entrega_idPacote)
    REFERENCES Entrega(idEntrega, idPacote)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Higiene (
  idHigiene INTEGER UNSIGNED  NOT NULL   ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  Produto_idHigiene INTEGER UNSIGNED  NOT NULL  ,
  Produto_idRemedio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idComida INTEGER UNSIGNED  NOT NULL  ,
  Produto_idAcesorio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  Produto_idProduto INTEGER UNSIGNED  NOT NULL  ,
  tipoHigiene ENUM("Necessidades","Banho")  NOT NULL    ,
PRIMARY KEY(idHigiene, idProduto, Produto_idHigiene, Produto_idRemedio, Produto_idComida, Produto_idAcesorio, Produto_idFornecedor, Produto_idProduto)  ,
INDEX Higiene_FKIndex1(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene),
  FOREIGN KEY(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene)
    REFERENCES Produto(idProduto, idFornecedor, idAcesorio, idComida, idRemedio, idHigiene)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Acessorio (
  idAcessorio INTEGER UNSIGNED  NOT NULL   ,
  Produto_idHigiene INTEGER UNSIGNED  NOT NULL  ,
  Produto_idRemedio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idComida INTEGER UNSIGNED  NOT NULL  ,
  Produto_idAcesorio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  Produto_idProduto INTEGER UNSIGNED  NOT NULL  ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  tipoAcessorio ENUM("Roupa","Coleira","Briquedo","Cama","Bebedouro","Comedouro")  NOT NULL    ,
PRIMARY KEY(idAcessorio,idProduto, Produto_idHigiene, Produto_idRemedio, Produto_idComida, Produto_idAcesorio, Produto_idFornecedor, Produto_idProduto)  ,
INDEX Acessorio_FKIndex1(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene),
  FOREIGN KEY(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene)
    REFERENCES Produto(idProduto, idFornecedor, idAcesorio, idComida, idRemedio, idHigiene)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Comida (
  idComida INTEGER UNSIGNED  NOT NULL   ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  Produto_idHigiene INTEGER UNSIGNED  NOT NULL  ,
  Produto_idRemedio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idComida INTEGER UNSIGNED  NOT NULL  ,
  Produto_idAcesorio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  Produto_idProduto INTEGER UNSIGNED  NOT NULL  ,
  tipoComida ENUM("Racao","Petisco")  NOT NULL    ,
PRIMARY KEY(idComida, idProduto, Produto_idHigiene, Produto_idRemedio, Produto_idComida, Produto_idAcesorio, Produto_idFornecedor, Produto_idProduto)  ,
INDEX Comida_FKIndex1(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene),
  FOREIGN KEY(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene)
    REFERENCES Produto(idProduto, idFornecedor, idAcesorio, idComida, idRemedio, idHigiene)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Remedio (
  idRemedio INTEGER UNSIGNED  NOT NULL   ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  Produto_idHigiene INTEGER UNSIGNED  NOT NULL  ,
  Produto_idRemedio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idComida INTEGER UNSIGNED  NOT NULL  ,
  Produto_idAcesorio INTEGER UNSIGNED  NOT NULL  ,
  Produto_idFornecedor INTEGER UNSIGNED  NOT NULL  ,
  Produto_idProduto INTEGER UNSIGNED  NOT NULL  ,
  tipoRemedio ENUM("Anti-bacteriano","Anti-inflamatorio","Analgesico","Anti-coaguante","Anti-histaminico")  NOT NULL    ,
PRIMARY KEY(idRemedio, idProduto, Produto_idHigiene, Produto_idRemedio, Produto_idComida, Produto_idAcesorio, Produto_idFornecedor, Produto_idProduto)  ,
INDEX Remedio_FKIndex1(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene),
  FOREIGN KEY(Produto_idProduto, Produto_idFornecedor, Produto_idAcesorio, Produto_idComida, Produto_idRemedio, Produto_idHigiene)
    REFERENCES Produto(idProduto, idFornecedor, idAcesorio, idComida, idRemedio, idHigiene)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Empacotador (
  idEmpacotador INTEGER UNSIGNED  NOT NULL   ,
  Funcionario_Pessoa_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_Pessoa_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_Pessoa_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idPessoa INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idFuncionario INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idEmpacotador INTEGER UNSIGNED  NOT NULL  ,
  Funcionario_idEntregador INTEGER UNSIGNED  NOT NULL  ,
  Pacote_idPacote INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idEmpacotador, Funcionario_Pessoa_idPessoa, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idFuncionario, Funcionario_idPessoa, Funcionario_idFuncionario, Funcionario_idEmpacotador, Funcionario_idEntregador)  ,
INDEX Empacotador_FKIndex1(Funcionario_idFuncionario, Funcionario_idPessoa, Funcionario_Pessoa_idFuncionario, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idPessoa, Funcionario_idEntregador, Funcionario_idEmpacotador)  ,
INDEX Empacotador_FKIndex2(Pacote_idPacote),
  FOREIGN KEY(Funcionario_idFuncionario, Funcionario_idPessoa, Funcionario_Pessoa_idFuncionario, Funcionario_Pessoa_idCliente, Funcionario_Pessoa_idPessoa, Funcionario_idEntregador, Funcionario_idEmpacotador)
    REFERENCES Funcionario(idFuncionario, idPessoa, Pessoa_idFuncionario, Pessoa_idCliente, Pessoa_idPessoa, idEntregador, idEmpacotador)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pacote_idPacote)
    REFERENCES Pacote(idPacote)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);






