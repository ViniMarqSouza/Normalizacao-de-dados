-- Cria um banco de dados chamado 'Atividade'
create database Atividade;

-- Seleciona o banco de dados para uso
use atividade;

-- Desativa o modo seguro de atualizações (permite UPDATE/DELETE sem WHERE)
SET SQL_SAFE_UPDATES=0;

-- Caso fosse necessário recriar o banco, poderíamos usar a linha abaixo (comentada)
#drop database atividade;

-- Cria a tabela principal 'pedidos' com informações de pedido, cliente e produto
CREATE TABLE `pedidos` (
  `pedido_numero` INT NOT NULL,
  `data_pedido` DATE DEFAULT NULL,
  `valor_total_pedido` DECIMAL(10,2) DEFAULT NULL,
  `forma_pagamento` VARCHAR(30) DEFAULT NULL,
  `cliente_id` INT DEFAULT NULL,
  `cliente_nome` VARCHAR(100) DEFAULT NULL,
  `cliente_endereco` VARCHAR(255) DEFAULT NULL,
  `cliente_telefone` VARCHAR(30) DEFAULT NULL,
  `cliente_email` VARCHAR(100) DEFAULT NULL,
  `produto_id` INT NOT NULL,
  `produto_descricao` VARCHAR(150) DEFAULT NULL,
  `produto_categoria` VARCHAR(50) DEFAULT NULL,
  `preco_unitario` DECIMAL(10,2) DEFAULT NULL,
  `quantidade` INT DEFAULT NULL,
  `valor_item` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`pedido_numero`,`produto_id`)
);

-- Insere vários registros de exemplo (pedidos com clientes e produtos)
INSERT INTO `pedidos` VALUES
(... todos os dados ...);

-- Cria uma nova tabela 'pedido' apenas com colunas principais dos pedidos
create table pedido as
select pedido_numero as 'ID', data_pedido as 'DataPedido', valor_total_pedido as 'Total', forma_pagamento from pedidos;

-- Adiciona uma coluna auto_increment como nova chave primária
alter table pedido
add column ID_NOVO int primary key auto_increment first;

-- Remove a antiga coluna 'ID' (pedido_numero)
alter table pedido
drop column ID;

-- Visualiza os dados da tabela 'pedido'
select * from pedido;

-- Cria uma tabela 'cliente' com informações únicas de clientes
create table cliente as
select distinct cliente_id as 'ID', cliente_nome as 'Nome', cliente_endereco as 'Endereco', cliente_telefone as 'Telefone', cliente_email as 'E-mail'
from pedidos;

-- Define a coluna ID como chave primária e auto_increment
alter table cliente
modify column ID int not null primary key auto_increment;

-- Mostra os clientes
select * from cliente;

-- Cria tabela 'produto' com dados dos produtos vendidos
create table produto as
select
produto_id as 'ID',
produto_descricao as 'Descricao',
produto_categoria as 'Categoria',
preco_unitario as 'Preco_Unit'
from pedidos;

-- Exibe estrutura da tabela
desc produto;

-- Adiciona uma nova chave primária auto_increment
alter table produto
add column ID_novo_produto int not null primary key auto_increment;

-- Mostra todos os produtos
select * from produto;

-- Cria a tabela 'itempedido' com a quantidade e valor dos itens vendidos
create table itempedido as
select quantidade as 'Quantidade', valor_item 'preco' from pedidos;

-- Adiciona chave primária auto_increment
alter table itempedido
add column ID int primary key auto_increment first;

-- Cria uma tabela 'endereco' separando as partes do endereço (rua, número, bairro, cidade, estado)
create table endereco as
select ID as fk_id_cliente,
    trim(substring_index(endereco, ',',1)) as "Endereco",
    trim(substring_index(substring_index(endereco, '-',1),',',-1)) as "Numero",
    trim(substring_index(substring_index(endereco, ',',2),'-',-1)) as "Bairro",
    trim(substring_index(substring_index(endereco, '-',2),',',-1)) as "Cidade",
    trim(substring_index(endereco, '-',-1)) as "Estado"
from cliente;

-- Mostra os endereços extraídos
select * from endereco;

-- Cria chave estrangeira ligando endereço ao cliente
alter table endereco
add constraint fk_cliente_endereco foreign key (fk_id_cliente) references cliente(ID);

-- Cria tabela 'categoria' com categorias distintas de produtos
create table categoria as
select distinct categoria from produto;

-- Adiciona chave primária auto_increment
alter table categoria
add column ID int primary key auto_increment first;

-- Mostra as categorias e produtos
select * from categoria;
select * from produto;

-- Cria tabela intermediária 'tbProd_novo' relacionando produtos e categorias
create table tbProd_novo
select produto.ID_novo_produto as ID_novo,
       produto.id as ID_antigo,
       descricao,
       preco_unit,
       categoria.id as ID_categoria
from produto
inner join categoria on categoria.categoria = produto.categoria;

-- Mostra os novos produtos
select * from tbProd_novo;

-- Define a chave primária
alter table tbProd_novo
modify column ID_novo int primary key;

-- Cria tabela de formas de pagamento
create table FormaPagamento as    
select distinct forma_pagamento from pedido;
   
-- Adiciona chave primária auto_increment
alter table FormaPagamento
add column ID int primary key auto_increment first;

-- Mostra as formas de pagamento
select * from formapagamento;  

-- Cria relacionamento produto -> categoria
alter table tbProd_novo
add constraint FK_produto_categoria foreign key (ID_categoria) references categoria(ID);

-- Cria nova tabela 'pedido_novo' juntando pedido e forma de pagamento
create table  pedido_novo
select pedido.*, formapagamento.Id as ID_pagamento
from pedido
inner join formapagamento on pedido.forma_pagamento = formapagamento.forma_pagamento;

-- Cria relacionamento pedido -> forma de pagamento
alter table pedido_novo
add constraint fk_pedido_pagamento foreign key (ID_pagamento) references formapagamento(ID);

-- Remove a coluna antiga 'forma_pagamento'
alter table pedido_novo
drop column forma_pagamento;

-- Visualiza pedidos novos
select * from pedido_novo;

-- Adiciona coluna de relacionamento com produtos em itempedido
alter table itempedido
add column id_produto int not null;

-- Mostra itens de pedido
SELECT * from itempedido;

-- Preenche a coluna id_produto com números aleatórios entre 1 e 64
UPDATE itempedido
SET id_produto = FLOOR(1 + RAND() * 64)
WHERE id_produto = 0;

-- Cria uma coluna calculada de valor total (quantidade * preço)
ALTER TABLE itempedido
ADD column valor_total  DECIMAL(10,2) as (quantidade * preco);

-- Cria relação itempedido -> produto
alter table itempedido
add constraint fk_itempedido_prod foreign key (id_produto) references tbProd_novo(ID_novo);

-- Exibe estrutura da tabela de produtos novos
desc tbprod_novo;

-- Adiciona coluna de relacionamento com itempedido em pedido_novo
alter table pedido_novo
add column id_itempedido int not null;

-- Preenche com valores aleatórios
UPDATE pedido_novo
SET id_itempedido = FLOOR(1 + RAND() * 64)
WHERE id_itempedido = 0;

-- Cria chave estrangeira pedido -> itempedido
alter table pedido_novo
add constraint fk_pedido_itempedido foreign key (id_itempedido) references itempedido(ID);

-- Adiciona coluna para relacionar pedido -> cliente
alter table pedido_novo
add column id_cliente int not null;

-- Preenche com valores aleatórios
UPDATE pedido_novo
SET id_cliente = FLOOR(1 + RAND() * 50)
WHERE id_cliente = 0;
 
-- Cria chave estrangeira pedido -> cliente
alter table pedido_novo
add constraint fk_pedido_cliente foreign key (id_cliente) references cliente(ID);

-- Remove a coluna 'total' da tabela pedido_novo (pois pode ser calculada)
alter table pedido_novo
drop column total;
