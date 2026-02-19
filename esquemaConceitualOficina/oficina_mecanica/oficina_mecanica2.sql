create database desafio_oficina_mecanica;
use desafio_oficina_mecanica;

create table oficina_mecanica(
idoficina_mecanica int primary key,
CNPJ varchar(14) not null,
razao_social varchar(50)not null,
nome_fantasia varchar(100),
om_endereco varchar(300)

);


create table clientes(
idcliente int auto_increment primary key,
pr_nome varchar(20),
sobrenome varchar (50),
CPF varchar(11) not null,
CNH varchar(11) not null,
NoContato varchar(18)

);

create table peca_tabeladeprecos(
idpeca_tabela_preco int auto_increment primary key,
peca_nome varchar(50) not null,
modelo_marca varchar(50) not null,
preco_custo float,
preco_venda float,
desconto float

);

create table custo_servicos(
idcusto_servico int auto_increment  primary key,
unidade_cobraca enum('hora','Servico') not null ,
preco_especialidade float,
preco_hora float,
preco_serviço float

);
-- . --

create table veiculos(
idveiculo int auto_increment primary key,
idcliente_veiculo int,
modelo_marca varchar(50) not null,
placav varchar(7) not null,
constraint fk_cliente_viculo foreign key(idcliente_veiculo) references clientes(idcliente)

);

create table mecanicos(
idmecanico int auto_increment primary key,
idoficina_mecanica_mec int,
cpf varchar(11) not null,
mecanico_nome varchar(20),
mecanico_sobrenome varchar(60),
mec_endereço varchar(300),
mec_especialidade enum('mecanica geral','suspensao direcao','eletrica') not null,
mesc_salario float default 1800,
constraint fk_oficina_mecanica_mec foreign key(idoficina_mecanica_mec) references oficina_mecanica(idoficina_mecanica)

);
       -- . --
       
create table avaliacao__veiculo(
idavaliacao_veiculo int auto_increment primary key,
idveiculo int,
idmecanico int,
identificacao_servico varchar(200) not null , 
observacoes varchar(100),
constraint fk_avaliacao_idveiculo foreign key(idveiculo) references veiculos(idveiculo),
constraint fk_avaliacao_idmecanico foreign key(idmecanico) references mecanicos(idmecanico)

);

create table ordem_servicos(
idordem_servico int auto_increment primary key,
atribuicao_mecanico int,
data_emissao date not null,
cliente int,
resultado_avaliacao int,
tipo_servico varchar(400) not null,
data_entrega date,
constraint fk_mecanico_ordem_servico foreign key (atribuicao_mecanico) references mecanicos(idmecanico),
constraint fk_ordem_servico_cliente foreign key (cliente) references clientes(idcliente),
constraint fk_ordem_servico_avaliacao foreign key(resultado_avaliacao) references avaliacao__veiculo(idavaliacao_veiculo)

);

create table ordem_pagamentos_os(
idordem_pagamento int auto_increment primary key,
idordem_servico int,
idcusto_servico int,
idpeca_tabela_preco int,
opg_data_emissao date not null, 
descricao_servico_op varchar(400),
pagamento_tipo ENUM('Dinheiro', 'Debito', 'Credito', 'Pix'),
constraint fk_ordem_pagamento_ordem_servico foreign key(idordem_servico) references ordem_servicos(idordem_servico),
constraint fk_ordem_pagamento_custo_servico foreign key(idcusto_servico) references custo_servicos(idcusto_servico),
constraint fk_ordem_pagamento_peca_tbprecos foreign key(idpeca_tabela_preco) references peca_tabeladeprecos(idpeca_tabela_preco)

);