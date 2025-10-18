create database Atividade;
use atividade;

SET SQL_SAFE_UPDATES=0;

#drop database atividade;
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

INSERT INTO `pedidos` VALUES
(1,'2025-01-05',180.00,'Cartão de crédito',1,'João Silva','Rua das Flores, 123 - Centro, São Paulo - SP','(11) 99999-0001','joao.silva@email.com',101,'Camiseta básica','Vestuário',60.00,2,120.00),
(1,'2025-01-05',180.00,'Cartão de crédito',1,'João Silva','Rua das Flores, 123 - Centro, São Paulo - SP','(11) 99999-0001','joao.silva@email.com',202,'Boné esportivo','Vestuário',60.00,1,60.00),
(2,'2025-01-07',150.00,'PIX',2,'Maria Souza','Avenida Brasil, 456 - Vila Mariana, São Paulo - SP','(11) 98888-0002','maria.souza@email.com',301,'Liquidificador 900W','Eletrodomésticos',150.00,1,150.00),
(3,'2025-01-10',320.00,'Boleto',3,'Pedro Alves','Rua Oscar Freire, 789 - Jardins, São Paulo - SP','(11) 97777-0003','pedro.alves@email.com',401,'Livro: Inteligência Artificial','Livros',80.00,2,160.00),
(3,'2025-01-10',320.00,'Boleto',3,'Pedro Alves','Rua Oscar Freire, 789 - Jardins, São Paulo - SP','(11) 97777-0003','pedro.alves@email.com',402,'Teclado mecânico','Eletrônicos',160.00,1,160.00),
(4,'2025-01-12',2200.00,'Cartão de crédito',4,'Ana Pereira','Rua da Paz, 12 - Pinheiros, São Paulo - SP','(11) 97777-1234','ana.pereira@email.com',501,'Notebook 15\" Dell','Eletrônicos',2200.00,1,2200.00),
(5,'2025-01-15',920.00,'PIX',5,'Carlos Lima','Avenida Paulista, 1000 - Bela Vista, São Paulo - SP','(11) 96666-0005','carlos.lima@email.com',601,'Tablet 10\" Samsung','Eletrônicos',800.00,1,800.00),
(5,'2025-01-15',920.00,'PIX',5,'Carlos Lima','Avenida Paulista, 1000 - Bela Vista, São Paulo - SP','(11) 96666-0005','carlos.lima@email.com',602,'Caneta Stylus','Acessórios',120.00,1,120.00),
(6,'2025-01-18',200.00,'Boleto',6,'Luiza Martins','Praça da Sé, 45 - Sé, São Paulo - SP','(11) 95555-0006','luiza.martins@email.com',701,'Livro: Programação em Java','Livros',40.00,5,200.00),
(7,'2025-01-20',500.00,'Cartão de débito',7,'Marcos Souza','Rua do Comércio, 210 - Centro, Rio de Janeiro - RJ','(21) 94444-0007','marcos.souza@email.com',801,'Fone de ouvido Bluetooth','Eletrônicos',250.00,2,500.00),
(8,'2025-01-22',2500.00,'Boleto',8,'Beatriz Rocha','Rua XV de Novembro, 333 - Centro, Curitiba - PR','(41) 93333-0008','beatriz.rocha@email.com',901,'Geladeira 2 portas Brastemp','Eletrodomésticos',2500.00,1,2500.00),
(9,'2025-01-25',450.00,'PIX',9,'Felipe Costa','Avenida Afonso Pena, 1500 - Centro, Belo Horizonte - MG','(31) 92222-0009','felipe.costa@email.com',1001,'Cafeteira elétrica','Eletrodomésticos',150.00,1,150.00),
(9,'2025-01-25',450.00,'PIX',9,'Felipe Costa','Avenida Afonso Pena, 1500 - Centro, Belo Horizonte - MG','(31) 92222-0009','felipe.costa@email.com',1002,'Conjunto de xícaras','Casa & Decoração',75.00,4,300.00),
(10,'2025-01-28',700.00,'Cartão de crédito',10,'Mariana Gomes','Rua da República, 78 - Centro, Porto Alegre - RS','(51) 91111-0010','mariana.gomes@email.com',1101,'Tênis esportivo','Calçados',350.00,2,700.00),
(11,'2025-02-01',1800.00,'Boleto',11,'Bruno Fernandes','Rua Sete de Setembro, 890 - Centro, Recife - PE','(81) 98888-0011','bruno.fernandes@email.com',1201,'TV 55\" LG 4K','Eletrônicos',1800.00,1,1800.00),
(12,'2025-02-03',540.00,'PIX',12,'Carla Nunes','Rua Goiás, 456 - Centro, Goiânia - GO','(62) 97777-0012','carla.nunes@email.com',1301,'Vestido floral','Vestuário',180.00,2,360.00),
(12,'2025-02-03',540.00,'PIX',12,'Carla Nunes','Rua Goiás, 456 - Centro, Goiânia - GO','(62) 97777-0012','carla.nunes@email.com',1302,'Bolsa feminina','Acessórios',180.00,1,180.00),
(13,'2025-02-05',120.00,'Cartão de crédito',13,'Diego Oliveira','Rua Amazonas, 321 - Centro, Manaus - AM','(92) 96666-0013','diego.oliveira@email.com',1401,'Mouse gamer','Eletrônicos',120.00,1,120.00),
(14,'2025-02-07',880.00,'Boleto',14,'Fernanda Castro','Rua Padre Cícero, 101 - Centro, Fortaleza - CE','(85) 95555-0014','fernanda.castro@email.com',1501,'Máquina de lavar 12kg','Eletrodomésticos',800.00,1,800.00),
(14,'2025-02-07',880.00,'Boleto',14,'Fernanda Castro','Rua Padre Cícero, 101 - Centro, Fortaleza - CE','(85) 95555-0014','fernanda.castro@email.com',1502,'Sabão líquido 2L','Limpeza',40.00,2,80.00),
(15,'2025-02-10',99.90,'PIX',15,'Guilherme Mendes','Rua Dom Pedro II, 555 - Centro, Florianópolis - SC','(48) 94444-0015','guilherme.mendes@email.com',1601,'Jogo de panelas','Casa & Decoração',99.90,1,99.90),
(16,'2025-02-12',400.00,'Cartão de débito',16,'Helena Duarte','Rua Independência, 88 - Centro, Salvador - BA','(71) 98888-0016','helena.duarte@email.com',1701,'Sapato social','Calçados',200.00,1,200.00),
(16,'2025-02-12',400.00,'Cartão de débito',16,'Helena Duarte','Rua Independência, 88 - Centro, Salvador - BA','(71) 98888-0016','helena.duarte@email.com',1702,'Bolsa de couro','Acessórios',200.00,1,200.00),
(17,'2025-02-14',350.00,'PIX',17,'Igor Ramos','Rua Tiradentes, 77 - Centro, Vitória - ES','(27) 97777-0017','igor.ramos@email.com',1801,'Smartwatch','Eletrônicos',350.00,1,350.00),
(18,'2025-02-16',780.00,'Cartão de crédito',18,'Juliana Silva','Rua Bahia, 500 - Centro, Campo Grande - MS','(67) 96666-0018','juliana.silva@email.com',1901,'Calça jeans','Vestuário',120.00,2,240.00),
(18,'2025-02-16',780.00,'Cartão de crédito',18,'Juliana Silva','Rua Bahia, 500 - Centro, Campo Grande - MS','(67) 96666-0018','juliana.silva@email.com',1902,'Jaqueta de couro','Vestuário',400.00,1,400.00),
(18,'2025-02-16',780.00,'Cartão de crédito',18,'Juliana Silva','Rua Bahia, 500 - Centro, Campo Grande - MS','(67) 96666-0018','juliana.silva@email.com',1903,'Cachecol','Acessórios',70.00,2,140.00),
(19,'2025-02-18',1300.00,'Boleto',19,'Leonardo Alves','Rua das Palmeiras, 99 - Centro, Natal - RN','(84) 95555-0019','leonardo.alves@email.com',2001,'Notebook Acer Aspire','Eletrônicos',1100.00,1,1100.00),
(19,'2025-02-18',1300.00,'Boleto',19,'Leonardo Alves','Rua das Palmeiras, 99 - Centro, Natal - RN','(84) 95555-0019','leonardo.alves@email.com',2002,'Mouse sem fio','Eletrônicos',200.00,1,200.00),
(20,'2025-02-20',75.00,'PIX',20,'Marcela Tavares','Rua das Acácias, 22 - Centro, Teresina - PI','(86) 94444-0020','marcela.tavares@email.com',2101,'Almofada decorativa','Casa & Decoração',75.00,1,75.00),
(21,'2025-02-22',420.00,'Cartão de crédito',21,'Rafael Pinto','Rua Goiás, 333 - Centro, Goiânia - GO','(62) 97777-0021','rafael.pinto@email.com',2201,'Tênis de corrida','Calçados',300.00,1,300.00),
(21,'2025-02-22',420.00,'Cartão de crédito',21,'Rafael Pinto','Rua Goiás, 333 - Centro, Goiânia - GO','(62) 97777-0021','rafael.pinto@email.com',2202,'Camiseta dri-fit','Vestuário',120.00,1,120.00),
(22,'2025-02-24',250.00,'PIX',22,'Sofia Andrade','Rua Ceará, 44 - Centro, Fortaleza - CE','(85) 96666-0022','sofia.andrade@email.com',2301,'Mixer 3 velocidades','Eletrodomésticos',250.00,1,250.00),
(23,'2025-02-26',1460.00,'Boleto',23,'Thiago Barros','Rua Pará, 10 - Centro, Belém - PA','(91) 95555-0023','thiago.barros@email.com',2401,'Cadeira gamer','Móveis',900.00,1,900.00),
(23,'2025-02-26',1460.00,'Boleto',23,'Thiago Barros','Rua Pará, 10 - Centro, Belém - PA','(91) 95555-0023','thiago.barros@email.com',2402,'Mouse pad XL','Acessórios',80.00,2,160.00),
(23,'2025-02-26',1460.00,'Boleto',23,'Thiago Barros','Rua Pará, 10 - Centro, Belém - PA','(91) 95555-0023','thiago.barros@email.com',2403,'Fone gamer','Eletrônicos',200.00,2,400.00),
(24,'2025-02-28',60.00,'Cartão de débito',24,'Vanessa Costa','Rua Acre, 66 - Centro, São Luís - MA','(98) 94444-0024','vanessa.costa@email.com',2501,'Agenda 2025','Papelaria',60.00,1,60.00),
(25,'2025-03-02',750.00,'PIX',25,'William Santos','Rua Piauí, 55 - Centro, Aracaju - SE','(79) 97777-0025','william.santos@email.com',2601,'Tênis Nike Air','Calçados',600.00,1,600.00),
(25,'2025-03-02',750.00,'PIX',25,'William Santos','Rua Piauí, 55 - Centro, Aracaju - SE','(79) 97777-0025','william.santos@email.com',2602,'Meia esportiva','Vestuário',75.00,2,150.00),
(26,'2023-05-01',450.00,'Cartão de crédito',26,'Eduardo Nascimento','Rua Goiás, 125','99912-4587','eduardo.nasc@example.com',601,'Bicicleta Aro 29','Esporte',150.00,3,450.00),
(27,'2023-05-02',200.00,'PIX',27,'Juliana Prado','Rua Acre, 321','99987-6654','juliana.prado@example.com',701,'Forno Micro-ondas','Eletrodomésticos',200.00,1,200.00),
(28,'2023-05-02',350.00,'Boleto',28,'Fernando Cardoso','Rua Pernambuco, 178','98888-1111','fernando.cardoso@example.com',801,'Monitor 24 polegadas','Informática',350.00,1,350.00),
(29,'2023-05-03',600.00,'Cartão de crédito',29,'Patrícia Ribeiro','Rua Amazonas, 555','97777-2222','patricia.ribeiro@example.com',901,'Câmera Digital','Eletrônicos',300.00,2,600.00),
(30,'2023-05-03',75.00,'Dinheiro',30,'Rafael Martins','Rua Bahia, 99','96666-3333','rafael.martins@example.com',1001,'Fone Bluetooth','Eletrônicos',75.00,1,75.00),
(31,'2023-05-04',220.00,'PIX',31,'Cláudia Lima','Rua Sergipe, 222','95555-4444','claudia.lima@example.com',1101,'Liquidificador','Eletrodomésticos',110.00,2,220.00),
(32,'2023-05-04',180.00,'Cartão de crédito',32,'Roberto Duarte','Rua Espírito Santo, 87','94444-5555','roberto.duarte@example.com',1201,'Tênis Corrida','Vestuário',90.00,2,180.00),
(33,'2023-05-05',90.00,'Dinheiro',33,'Larissa Melo','Rua Maranhão, 64','93333-6666','larissa.melo@example.com',1301,'Mochila Escolar','Acessórios',90.00,1,90.00),
(34,'2023-05-05',480.00,'Boleto',34,'Sérgio Oliveira','Rua Alagoas, 300','92222-7777','sergio.oliveira@example.com',1401,'Tablet 10 polegadas','Eletrônicos',240.00,2,480.00),
(35,'2023-05-06',60.00,'PIX',35,'Camila Barbosa','Rua Rondônia, 150','91111-8888','camila.barbosa@example.com',1501,'Chinelo Havaianas','Vestuário',30.00,2,60.00),
(36,'2023-05-06',900.00,'Cartão de crédito',36,'André Castro','Rua Tocantins, 412','90000-9999','andre.castro@example.com',1601,'Smart TV 50"','Eletrônicos',900.00,1,900.00),
(37,'2023-05-07',350.00,'PIX',37,'Beatriz Fonseca','Rua Pará, 789','98888-1122','beatriz.fonseca@example.com',1701,'Console de Videogame','Eletrônicos',350.00,1,350.00),
(38,'2023-05-07',120.00,'Dinheiro',38,'Marcelo Gomes','Rua Piauí, 432','97777-2211','marcelo.gomes@example.com',1801,'Camisa Social','Vestuário',60.00,2,120.00),
(39,'2023-05-08',55.00,'Cartão de crédito',39,'Fernanda Teixeira','Rua Ceará, 275','96666-3311','fernanda.teixeira@example.com',1901,'Boné Esportivo','Acessórios',55.00,1,55.00),
(40,'2023-05-08',300.00,'Boleto',40,'Rodrigo Alves','Rua Santa Catarina, 88','95555-4411','rodrigo.alves@example.com',2001,'Ventilador de Coluna','Eletrodomésticos',150.00,2,300.00),
(41,'2023-05-09',130.00,'PIX',41,'Tatiane Moraes','Rua Mato Grosso, 101','94444-5511','tatiane.moraes@example.com',2101,'Sandália Feminina','Vestuário',65.00,2,130.00),
(42,'2023-05-09',85.00,'Dinheiro',42,'Hugo Rocha','Rua Rio Grande do Norte, 214','93333-6611','hugo.rocha@example.com',2201,'Cinto Couro','Acessórios',85.00,1,85.00),
(43,'2023-05-10',160.00,'Cartão de crédito',43,'Isabela Pires','Rua Rio Grande do Sul, 315','92222-7711','isabela.pires@example.com',2301,'Calça Legging','Vestuário',80.00,2,160.00),
(44,'2023-05-10',500.00,'PIX',44,'Vinícius Carvalho','Rua Paraná, 510','91111-8811','vinicius.carvalho@example.com',2401,'Smartphone 64GB','Eletrônicos',500.00,1,500.00),
(45,'2023-05-11',45.00,'Dinheiro',45,'Elaine Freitas','Rua Amapá, 112','90000-9911','elaine.freitas@example.com',2501,'Garrafa Térmica','Utilidades',45.00,1,45.00),
(46,'2023-05-11',270.00,'Cartão de crédito',46,'Lucas Menezes','Rua Bahia, 720','98888-1133','lucas.menezes@example.com',2601,'Kit Panelas','Eletrodomésticos',270.00,1,270.00),
(47,'2023-05-12',320.00,'Boleto',47,'Márcia Fernandes','Rua Goiás, 345','97777-2233','marcia.fernandes@example.com',2701,'Impressora Multifuncional','Informática',320.00,1,320.00),
(48,'2023-05-12',60.00,'Dinheiro',48,'Thiago Lopes','Rua Pernambuco, 900','96666-3333','thiago.lopes@example.com',2801,'Mouse Gamer','Informática',60.00,1,60.00),
(49,'2023-05-13',110.00,'PIX',49,'Renata Azevedo','Rua Amazonas, 555','95555-4444','renata.azevedo@example.com',2901,'Tênis Casual','Vestuário',110.00,1,110.00),
(50,'2023-05-13',75.00,'Cartão de crédito',50,'Carlos Eduardo','Rua Acre, 321','94444-5555','carlos.edu@example.com',3001,'Carteira Couro','Acessórios',75.00,1,75.00);

create table pedido as

select pedido_numero as 'ID', data_pedido as 'DataPedido', valor_total_pedido as 'Total', forma_pagamento from pedidos;

alter table pedido
add column ID_NOVO int primary key auto_increment first;

alter table pedido
drop column ID;

select * from pedido;

create table cliente as
select distinct cliente_id as 'ID', cliente_nome as 'Nome', cliente_endereco as 'Endereco', cliente_telefone as 'Telefone', cliente_email as 'E-mail' from pedidos;

alter table cliente
modify column ID int not null primary key auto_increment;
select * from cliente;

create table produto as
select
produto_id as 'ID',
produto_descricao as 'Descricao',
produto_categoria as 'Categoria',
preco_unitario as 'Preco_Unit'

from pedidos;

desc produto;
alter table produto
add column ID_novo_produto int not null primary key auto_increment;

select * from produto;

create table itempedido as
select quantidade as 'Quantidade', valor_item 'preco' from pedidos;

alter table itempedido
add column ID int primary key auto_increment first;

create table endereco as
select ID as fk_id_cliente, trim(substring_index(endereco, ',',1)) as "Endereco",
    trim(substring_index(substring_index(endereco, '-',1),',',-1)) as "Numero",
    trim(substring_index(substring_index(endereco, ',',2),'-',-1)) as "Bairro",
    trim(substring_index(substring_index(endereco, '-',2),',',-1)) as "Cidade",
    trim(substring_index(endereco, '-',-1)) as "Estado" from cliente;

select * from endereco;

alter table endereco
add constraint fk_cliente_endereco foreign key (fk_id_cliente) references cliente(ID);

create table categoria as
select distinct categoria from produto;

alter table categoria
add column ID int primary key auto_increment first;

select * from categoria;
select * from produto;


create table tbProd_novo

select produto.ID_novo_produto as ID_novo, produto.id as ID_antigo, descricao, preco_unit, categoria.id as ID_categoria from produto
inner join categoria on categoria.categoria = produto.categoria;

select * from tbProd_novo;

alter table tbProd_novo
modify column ID_novo int primary key;

create table FormaPagamento as    
select
distinct forma_pagamento from pedido;
   
alter table FormaPagamento
add column ID int primary key auto_increment first;

 select * from formapagamento;  
 
 alter table tbProd_novo
 add constraint FK_produto_categoria foreign key (ID_categoria) references categoria(ID);
 
create table  pedido_novo
select pedido.*, formapagamento.Id as ID_pagamento from pedido
inner join formapagamento on pedido.forma_pagamento = formapagamento.forma_pagamento;

alter table pedido_novo
add constraint fk_pedido_pagamento foreign key (ID_pagamento) references formapagamento(ID);

alter table pedido_novo
drop column forma_pagamento;
select * from pedido_novo;

alter table itempedido
add column id_produto int not null;

SELECT * from itempedido;

UPDATE itempedido
SET id_produto = FLOOR(1 + RAND() * 64)
WHERE id_produto = 0;

ALTER TABLE itempedido
ADD column valor_total  DECIMAL(10,2) as (quantidade * preco);

alter table itempedido
add constraint fk_itempedido_prod foreign key (id_produto) references tbProd_novo(ID_novo);

desc tbprod_novo;

alter table pedido_novo
add column id_itempedido int not null;

UPDATE pedido_novo
SET id_itempedido = FLOOR(1 + RAND() * 64)
WHERE id_itempedido = 0;

alter table pedido_novo
add constraint fk_pedido_itempedido foreign key (id_itempedido) references itempedido(ID);

alter table pedido_novo
add column id_cliente int not null;

UPDATE pedido_novo
SET id_cliente = FLOOR(1 + RAND() * 50)
WHERE id_cliente = 0;
 
 alter table pedido_novo
add constraint fk_pedido_cliente foreign key (id_cliente) references cliente(ID);

alter table pedido_novo
drop column total;