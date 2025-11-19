create database dbdesenvolvimento;
use dbdesenvolvimento;

create table tbproduto(
IdProp int primary key,
NomeProd varchar(50) not null,
Qtd int,
DataValidade date not null,
Preco decimal(8,4) not null
);

alter table tbProduto add Peso decimal(8,4);
alter table tbProduto add Cor varchar(50);
alter table tbProduto add Marca varchar(50) not null;


alter table tbProduto drop Cor;

alter table tbProduto modify Peso decimal(8,4) not null;

-- alter table tbProduto drop Cor; -- Não é possível apagar a coluna Cor, pois ela já foi apagada anteriormente, logo, não existe mais.

create database dbLojaGrande;

alter table tbProduto add Cor varchar(50);

create database dblojica;
use dblojica;

create table tbcliente(
CodigoFunc int primary key,
NomeCli char(50) not null,
DataCadastro datetime not null
);

drop database dbLojaGrande; -- Talvez arrumar isso

alter table tbCliente add nomecpf bigint not null unique;