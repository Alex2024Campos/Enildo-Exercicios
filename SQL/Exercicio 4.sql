create database Margarida;
use Margarida;

-- Criando a tabela tbProduto.
create table tbProduto(
 IdProp int primary key, 
 NomeProd varchar(50) not null,
 Qtd int, -- Modificar
 DataValidade date not null,
 Preco decimal (10,6) not null
);

-- Alterando as tabelas para adicionar novos dados.
alter table tbProduto add Peso decimal(10,6) not null;
alter table tbProduto add Cor varchar(50);
alter table tbProduto add Marca varchar(50) not null;

-- Mostrando todas as tabelas da database e os dados da tbProduto.
show tables;
describe tbProduto;

-- Excluindo a coluna Cor.
-- alter table tbProduto drop Cor; --> Está dando erro porque a coluna cor não existe mais na tabela tbProduto.

-- Modificando a coluna peso para que seja obrigatória
-- alter table tbProduto modify Cor varchar(50) not null; -> O erro ocorre porque a coluna co foi deletada da tabela.
describe tbProduto;

