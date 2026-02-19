show databases;

create database e_commerce;
use e_commerce;

create table Cliente(
idCliente int auto_increment primary key,
PrNome varchar(10),
MNome char(3),
Sobrenome varchar(20),
CPF char(11) not null,
Endereco varchar(200),
constraint unique_cpf_Cliente unique (CPF)
);

alter table Cliente  auto_increment=1;

create table Produto(
idProduto int auto_increment primary key,
PNome varchar(10)not null,
PCategoria varchar(30),
PDescricao varchar(200) not null,
PValor float not null,
PAvaliacao float
);
alter table Produto  auto_increment=1;

create table Pagamento(
idCliente int,
idPagamento int,
FormaDePagamento enum('Boleto','Cartão','Debito','Credito'),
LimiteLiberado float,
primary key(idCliente, idPagamento)

);

create table Ordem(
idOrdem int auto_increment primary key,
idOrdemCliente int,
idPagamento int,
OrdemStatus enum('Em processamento','Confirmado','Cancelado') default 'Em processamento',
OrdemDescricao varchar(200),
ValorFrete float default 10,
PagamentoBoleto boolean default false,
constraint fk_ordem_cliente foreign key(idOrdemCliente) references Cliente(idCliente),
constraint fk_pagamento_cliente foreign key(idOrdemCliente,idPagamento) references Pagamento(idCliente, idPagamento)
);
alter table Ordem  auto_increment=1;

create table Estoque(
idEstoque int auto_increment primary key,
ELocal varchar(200),
EQuantitade int default 0
);

alter table Estoque  auto_increment=1;

create table Fornecedor(
idFornecedor int auto_increment primary key ,
RazaoSocial varchar(45),
CNPJ char(15),
Contato varchar(10) not null,
constraint unique_fornecedor unique(CNPJ)
);
alter table Fornecedor  auto_increment=1;

create table Vendedor(
idVendedor int auto_increment primary key ,
NomeSocial varchar(100) not null,
CNPJ char(15),
CPF char (9),
VLocalizacao varchar(200),
VContato char (15) not null,
constraint unique_cnpj_vendedor unique(CNPJ),
constraint unique_cpf_vendedor unique(Cpf)
);
alter table Vendedor  auto_increment=1;

-- (n:m) --

create table produtoVendedor(
idVendedor int,
idProduto  int, 
ProdutoQuantidade int default 1,
primary key(idVendedor,idProduto),
constraint fk_produto_vendedor foreign key(idVendedor) references Vendedor(idVendedor),
constraint fk_produto_produto foreign key (idProduto) references Produto(idProduto)
);

create table produtoOrdem(
idPOproduto  int,
idPOordem int,
poQuantidade int default 1,
poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
primary key(idPOordem,idPOproduto),
constraint fk_po_vendedor foreign key(idPOproduto) references Produto(idProduto),
constraint fk_po_produto foreign key (idPOordem) references Ordem (idOrdem)
);

create table estoqueLocalizacao(
idLProduto  int, 
idLEstoque int,
Elocalizacao varchar (300)not null,
primary key(idLProduto,idLEstoque) ,
constraint fk_estqlo_vendedor foreign key(idLProduto) references Produto(idProduto),
constraint fk_estqlo_produto foreign key (idLEstoque) references Estoque(idEstoque)
);

create table produtoFornecedor(
idpfFornecedor int,
idpfProduto int,
PFQuantidade int not null,
primary key (idpfFornecedor,idpfProduto),
constraint fk_produto_fornecedor_fornecedor foreign key(idpfFornecedor) references Fornecedor(idFornecedor),
constraint fk_produto_fornecedor_produto foreign key (idpfProduto) references Produto(idProduto)
);

