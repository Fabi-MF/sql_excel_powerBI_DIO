-- querys oficina_mecanica2
use desafio_oficina_mecanica;

-- inserção de dados
-- ⚠️ ALERTA: Os dados utilizados neste ambiente foram gerados por inteligência artificial.
-- Eles são totalmente fictícios, não representam pessoas reais e foram criados apenas para fins de teste, estudo ou demonstração.


INSERT INTO oficina_mecanica VALUES
(1, '12345678000199', 'Oficina Ctrl Ltda', 'AutoFix Brasil', 'Rua das Engrenagens, 123 - Centro, São Paulo - SP');

INSERT INTO clientes (pr_nome, sobrenome, CPF, CNH, NoContato) VALUES
('Carlos', 'Silva', '12345678901', '98765432100', '(11)91234-5678'),
('Fernanda', 'Oliveira', '23456789012', '87654321099', '(21)99876-5432'),
('João', 'Martins', '34567890123', '76543210988', '(31)98765-4321');

INSERT INTO peca_tabeladeprecos (peca_nome, modelo_marca, preco_custo, preco_venda, desconto) VALUES
('Filtro de Óleo', 'Fiat Uno', 20.00, 35.00, 5.00),
('Pastilha de Freio', 'Volkswagen Gol', 50.00, 80.00, 10.00),
('Correia Dentada', 'Chevrolet Corsa', 45.00, 70.00, 0.00);

INSERT INTO custo_servicos (unidade_cobraca, preco_especialidade, preco_hora, preco_serviço) VALUES
('hora', 120.00, 80.00, 0.00),
('Servico', 0.00, 0.00, 250.00);

INSERT INTO veiculos (idcliente_veiculo, modelo_marca, placav) VALUES
(1, 'Fiat Uno 2010', 'ABC1234'),
(2, 'Volkswagen Gol 2015', 'XYZ5678'),
(3, 'Chevrolet Corsa 2012', 'JKL9012');

INSERT INTO mecanicos (idoficina_mecanica_mec, cpf, mecanico_nome, mecanico_sobrenome, mec_endereço, mec_especialidade) VALUES
(1, '11122233344', 'Roberto', 'Ferreira', 'Rua das Ferramentas, 45 - São Paulo', 'mecanica geral'),
(1, '55566677788', 'Luciana', 'Costa', 'Av. dos Motores, 78 - São Paulo', 'eletrica'),
(1, '99988877766', 'Eduardo', 'Pereira', 'Rua dos Pistões, 12 - São Paulo', 'suspensao direcao');

INSERT INTO avaliacao__veiculo (idveiculo, idmecanico, identificacao_servico, observacoes) VALUES
(1, 1, 'Troca de filtro e revisão geral', 'Filtro saturado'),
(2, 2, 'Verificação elétrica e troca de bateria', 'Bateria descarregada'),
(3, 3, 'Revisão da suspensão dianteira', 'Amortecedores gastos');

INSERT INTO ordem_servicos (atribuicao_mecanico, data_emissao, resultado_avaliacao, tipo_servico, data_entrega) VALUES
(1, '2025-09-10', 1, 'Troca de filtro e revisão geral', '2025-09-12'),
(2, '2025-09-11', 2, 'Verificação elétrica e troca de bateria', '2025-09-13'),
(3, '2025-09-12', 3, 'Revisão da suspensão dianteira', '2025-09-14');

INSERT INTO ordem_pagamentos_os (idordem_servico, idcusto_servico, idpeca_tabela_preco, opg_data_emissao, descricao_servico_op, pagamento_tipo) VALUES
(1, 1, 1, '2025-09-10', 'Troca de filtro de óleo e revisão básica', 'Pix'),
(2, 2, 2, '2025-09-11', 'Troca de pastilha de freio e revisão elétrica', 'Credito'),
(3, 2, 3, '2025-09-12', 'Revisão completa da suspensão e troca de correia', 'Debito');

-- requisições


select*from  clientes;

select placav from veiculos where idveiculo = '3';

select peca_nome ,desconto from peca_tabeladeprecos order by desconto desc;

select modelo_marca  from veiculos group by idveiculo having count(*) <2;

select concat(cl.pr_nome, ' ', cl.sobrenome) as Clientes,vcl.modelo_marca as Veiculo, mec.mecanico_nome as Mecanico_Responsavel
from ordem_servicos as ordem_S -- seleciona a tabela ordem de serviço
join avaliacao__veiculo as avlv on ordem_S.resultado_avaliacao = avlv.idavaliacao_veiculo -- cruza e conecta com a tabela avaliacao__veiculo
join veiculos as vcl on avlv.idveiculo = vcl.idveiculo -- cruza tabela avaliacao com a veiculos retira (identificacão do veiculo/modelo placa)
join clientes as cl on vcl.idcliente_veiculo = cl.idcliente -- veiculos x clientes (recupera o nome do cliente)
join mecanicos as mec on ordem_S.atribuicao_mecanico = mec.idmecanico;  -- ordem servico x mecanicos (pega o nome do mecanico)
