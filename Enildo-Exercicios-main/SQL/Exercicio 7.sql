create database dbescola;

use dbescola;

create table tbcliente(
IdCli int primary key,
NomeCli char(50) not null,
NumEnd int,
DataCadastro datetime

);

alter table tbCliente add cpf bigint unique not null;

alter table tbCliente add cep smallint;

create database dbempresa;

create table tbendereco(
cep smallint primary key,
Logradouro varchar(250) not null,
IdUf smallint
);

alter table tbCliente add foreign key (cep) references tbendereco(Cep);

describe tbCliente;

/*
 Acredito que minha principal dificuldade vem sendo como escrever os comandos/posiciona-los. Ou seja, ando com dificuldade nas sintaxes, mas nem tanto.
*/

show databases;

drop database dbEmpresa;