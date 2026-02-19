 show databases; -- exibe os bancos de dados já criados --
 use e_commerce; -- seleciona o banco de dados  --
 
 -- inserção de dados --
-- ⚠️ ALERTA: Os dados utilizados neste ambiente foram gerados por inteligência artificial.
-- Eles são totalmente fictícios, não representam pessoas reais e foram criados apenas para fins de teste, estudo ou demonstração.

 INSERT INTO Cliente (PrNome, MNome, Sobrenome, CPF, Endereco) VALUES
('Lucas',    'A.', 'Ferreira',     '12345678901', 'Rua das Palmeiras, 123 - São Paulo'),
('Mariana',  'B.', 'Oliveira',     '23456789012', 'Av. Brasil, 456 - Rio de Janeiro'),
('Thiago',   'C.', 'Souza',        '34567890123', 'Rua do Sol, 789 - Belo Horizonte'),
('Ana',      'D.', 'Costa',        '45678901234', 'Travessa das Flores, 321 - Curitiba'),
('Rafael',   'E.', 'Lima',         '56789012345', 'Rua das Acácias, 654 - Porto Alegre'),
('Beatriz',  'F.', 'Martins',      '67890123456', 'Av. das Nações, 987 - Recife'),
('Pedro',    'G.', 'Rocha',        '78901234567', 'Rua do Comércio, 159 - Salvador'),
('Camila',   'H.', 'Almeida',      '89012345678', 'Alameda dos Ipês, 753 - Florianópolis'),
('Bruno',    'I.', 'Ribeiro',      '90123456789', 'Rua da Harmonia, 852 - Goiânia'),
('Juliana',  'J.', 'Cardoso',      '01234567890', 'Estrada do Campo, 951 - Fortaleza');

select * from  Cliente; -- verificando como os dados estão na tabela  --

INSERT INTO Pagamento (idCliente, idPagamento, FormaDePagamento, LimiteLiberado) VALUES
(1, 101, 'Cartão', 500.00),
(2, 102, 'Boleto', 300.00),
(3, 103, 'Credito', 1000.00),
(4, 104, 'Debito', 250.00),
(5, 105, 'Cartão', 600.00),
(6, 106, 'Boleto', 400.00),
(7, 107, 'Credito', 800.00),
(8, 108, 'Debito', 350.00),
(9, 109, 'Cartão', 900.00),
(10,110, 'Boleto', 200.00);

INSERT INTO Produto (PNome, PCategoria, PDescricao, PValor, PAvaliacao) VALUES
('Caneca',    'Utilidades',   'Caneca de cerâmica branca com alça reforçada',           19.90, 4.5),
('Fone',      'Eletrônicos',  'Fone de ouvido bluetooth com cancelamento de ruído',     129.99, 4.7),
('Camiseta',  'Vestuário',    'Camiseta 100% algodão com estampa minimalista',          49.90, 4.2),
('Mochila',   'Acessórios',   'Mochila impermeável com compartimento para laptop',      159.00, 4.6),
('Livro',     'Livros',       'Romance contemporâneo com capa dura',                    39.90, 4.8),
('Teclado',   'Informática',  'Teclado mecânico com iluminação RGB',                    229.90, 4.4),
('Sabonete',  'Higiene',      'Sabonete vegetal com aroma de lavanda',                  7.50, 4.3),
('Luminária', 'Decoração',    'Luminária de mesa com ajuste de intensidade',            89.90, 4.6),
('Caderno',   'Papelaria',    'Caderno espiral com 200 folhas pautadas',                15.90, 4.1),
('Mouse',     'Informática',  'Mouse óptico sem fio com alta precisão',                 79.90, 4.5);
select * from Produto; 



INSERT INTO Ordem (
  idOrdemCliente, idPagamento, OrdemStatus, OrdemDescricao, ValorFrete, PagamentoBoleto
) VALUES
(1, 101, 'Confirmado',      'Pedido de 2 camisetas e 1 caneca',                     10.00, false),
(2, 102, 'Em processamento','Pedido de 1 fone bluetooth e 1 mochila',               10.00, true),
(3, 103, 'Cancelado',       'Pedido de 1 livro e 1 luminária',                      10.00, false),
(4, 104, 'Confirmado',      'Pedido de 3 sabonetes e 2 cadernos',                   10.00, true),
(5, 105, 'Em processamento','Pedido de 1 teclado mecânico e 1 mouse óptico',        10.00, false),
(6, 106, 'Confirmado',      'Pedido de 1 camiseta e 1 mochila impermeável',         10.00, true),
(7, 107, 'Cancelado',       'Pedido de 2 livros capa dura',                         10.00, false),
(8, 108, 'Confirmado',      'Pedido de 1 luminária e 1 fone bluetooth',             10.00, true),
(9, 109, 'Em processamento','Pedido de 1 caneca e 1 sabonete lavanda',              10.00, false),
(10,110,'Confirmado',       'Pedido de 1 teclado RGB e 1 caderno espiral',          10.00, true);
select * from Ordem; 

INSERT INTO produtoOrdem (idPOproduto, idPOordem, poQuantidade, poStatus) VALUES
(3, 1, 2, 'Disponivel'), 
(1, 1, 1, 'Disponivel'), 
(2, 2, 1, 'Disponivel'), 
(4, 2, 1, 'Disponivel'),
(5, 3, 1, 'Disponivel'),
(8, 3, 1, 'Disponivel'), 
(7, 4, 3, 'Disponivel'), 
(9, 4, 2, 'Disponivel'), 
(6, 5, 1, 'Disponivel'),
(10,5, 1, 'Disponivel'), 
(3, 6, 1, 'Disponivel'), 
(4, 6, 1, 'Disponivel'), 
(5, 7, 2, 'Disponivel'),
(8, 8, 1, 'Disponivel'), 
(2, 8, 1, 'Disponivel'), 
(1, 9, 1, 'Disponivel'), 
(7, 9, 1, 'Disponivel'), 
(6,10, 1, 'Disponivel'), 
(9,10, 1, 'Disponivel'); 

INSERT INTO Estoque (ELocal, EQuantitade) VALUES
('Centro de Distribuição SP', 500),
('Armazém RJ', 300),
('Depósito SC', 400);


INSERT INTO estoqueLocalizacao (idLProduto, idLEstoque, Elocalizacao) VALUES
(1, 1, 'Prateleira A1'),
(2, 2, 'Prateleira B3'),
(3, 1, 'Prateleira C2'),
(4, 3, 'Prateleira D4'),
(5, 2, 'Prateleira E5'),
(6, 1, 'Prateleira F6'),
(7, 3, 'Prateleira G7'),
(8, 2, 'Prateleira H8'),
(9, 1, 'Prateleira I9'),
(10,3, 'Prateleira J10');


INSERT INTO Fornecedor (RazaoSocial, CNPJ, Contato) VALUES
('Alpha Distribuidora Ltda',     '12345678000199', '1198765432'),
('Delta Importações ME',          '23456789000188', '2198765432'),
('Gama Suprimentos EPP',         '34567890000177', '3198765432');

INSERT INTO Vendedor (NomeSocial, CNPJ, CPF, VLocalizacao, VContato) VALUES
('Loja Tck Brasil',     '45678901000166', '123456789', 'São Paulo - SP', '11999998888'),
('Moda Urb',          '56789012000155', '234567890', 'Rio de Janeiro - RJ', '21999997777'),
('Papelaria Cryva',   '67890123000144', '345678901', 'Curitiba - PR', '41999996666');


INSERT INTO produtoFornecedor (idpfFornecedor, idpfProduto, PFQuantidade) VALUES
(1, 2, 100), 
(1, 6, 50),  
(2, 3, 200), 
(2, 4, 80),  
(3, 9, 300), 
(3, 1, 150); 

INSERT INTO produtoVendedor (idVendedor, idProduto, ProdutoQuantidade) VALUES
(1, 2, 20), 
(1, 6, 15),  
(2, 3, 40),  
(2, 4, 25),  
(3, 9, 60), 
(3, 1, 30);  



										-- querys pesquisas -- 
                                        

select concat(PrNome,' ',Sobrenome) as Compradores from Cliente; -- gera o nome completo e salva temporáriamente no alias Compradores--


							-- seleciona  conta quantos clientes fizeram pedidos --

select count(*) from Cliente as c , Ordem as o
	where  c.idCliente = idOrdemCliente;

-- pesquisa de produtos por status (cancelados,Em processamento,Confirmado) --


SELECT Produto.PNome,produtoOrdem.poQuantidade,Ordem.OrdemDescricao,Ordem.OrdemStatus -- seleciona as tabelas e seus atributos (sem alias)-- 
	FROM produtoOrdem -- tabela de inicio --
	JOIN Produto ON produtoOrdem.idPOproduto = Produto.idProduto -- cruza os dados dos 2 id dos produtos /para identifica los --
	JOIN Ordem ON produtoOrdem.idPOordem = Ordem.idOrdem   -- cruza os dados dos 2 id das ordens /para identificar a descrição e status --
	WHERE Ordem.OrdemStatus = 'Cancelado'; -- exibe os pedidos por status (cancelado) --
 -- (alterar para 'Em processamento','Confirmado'  caso queira ver apenas os demais--
 

 
 -- pesquisa lojas que venderam mais -- 
	desc Vendedor;

 SELECT v.NomeSocial, v.VLocalizacao, pv.ProdutoQuantidadeb -- seleciona as tabelas e seus atributos (com alias)-- 
	 from Vendedor as v -- tabela de inicio esquerda do join--
	 Join produtoVendedor as pv on  v.idVendedor = pv.idVendedor -- 2 tabela declarada direita do join / junção 1 esquerda  = 2 direita ; --
	 ORDER BY v.NomeSocial,pv.ProdutoQuantidade desc;

-- total gasto na compra --
--  seleciona o cliente / sum calcula o valor (quantidade do pedido * o valor do produto) round 2 retorna 2 casas depois da virgula/ status da compra

select concat(Cliente.PrNome,' ',Cliente.Sobrenome) as Compradores, round( sum(produtoOrdem.poQuantidade * Produto.PValor),2) as GastoTotal,Ordem.OrdemStatus as Situação
from produtoOrdem 
join Produto on produtoOrdem.idPOproduto = Produto.idProduto -- cruza os dados do pedido X produto para identificar o produto foi pedido
join Ordem on produtoOrdem.idPOordem = Ordem.idOrdem -- identifica quantos itens foram pedidos
join Cliente on Ordem.idOrdemCliente = Cliente.idCliente -- conecta o pedido ao cliente que o fez
group by Cliente.idCliente, Ordem.OrdemStatus;
