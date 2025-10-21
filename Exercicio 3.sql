create database dbcomercio;

use dbcomercio;

create table tbCliente(
Id int primary key,
NomeCli varchar(200) not null,
NumEnd int(6) not null, -- Modificar
CompEnd varchar(50)
);

create table tbClientePF(
CPF int(11) unique primary key, -- Modificar
RG int(9), -- Modificar
Rgdig char(1),
Nascimento date not null
);