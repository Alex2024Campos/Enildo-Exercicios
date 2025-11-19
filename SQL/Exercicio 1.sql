/*Exercício 1*/

create database alex;
use alex;

create table tbUsuario (
 IdUsuario int primary key,
 DataNascimento date,
 NomeUsuario varchar(45)
);



create table tbCliente (
CodigoCli bigint primary key,
Nome varchar(50),
Endereco varchar(60)
);

create table tbEstado (
Id int primary key,
Uf char(2)
);

create table tbProduto(
Barras int(13) primary key,
Valor decimal(6,4),
Descricao text
);

/*Modificando as tabelas criadas*/
alter table tbProduto modify Descricao text;
alter table tbCliente modify Nome varchar(58);
alter table tbProduto add Qtd int;
alter table tbUsuario drop DataNascimento;

/*Deletando a tabela tbEstado*/
drop table tbEstado;

/*Apresentação das bases de dados*/
show databases;

/*Apresentação de todas as tabelas*/
show tables;

/*Apresentação da tabela*/
describe tbUsuario;
describe tbCliente;
describe tbEstado;
describe tbProduto;