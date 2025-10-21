create database Damiao;
use Damiao;

create table tbProduto(
 IdProp int primary key,
 NomeProd varchar(50) not null,
 Qtd int,
 DataValidade date not null,
 Preco decimal not null
);

create table tbcliente(
Codigo int primary key,
NomeCli varchar(50) not null,
DataNascimento date 
);

-- Mostrando a tabela tbProduto
describe tbProduto;

-- Alteração da tabela tbProduto
alter table tbProduto modify Preco decimal(10,6);