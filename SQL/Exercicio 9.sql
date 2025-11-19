-- Exercício 9:

create database dbBANCO; -- Exercício 9

use dbBANCO;

create table tbagencia(
NumeroAgencia int primary key,
CodBanco int,
Endereco varchar(50) not null
);


create table tbconta(
NumeroConta int primary key,
Saldo decimal(7,2),
TipoConta smallint,
NumAgencia int,
foreign key (NumAgencia) references tbagencia(NumeroAgencia)
);

create table tbcliente(
Cpf bigint primary key,
Nome varchar(50) not null,
Sexo char(1) not null,
Endereco varchar(50) not null
);

create table tbhistorico(
DataInicio date,
Cpf bigint,
NumeroConta int,
foreign key (Cpf) references tbcliente(Cpf),
foreign key (NumeroConta) references tbconta(NumeroConta)
);


create table tbtelefone_cliente(
Telefone int primary key,
Cpf bigint
foreign key (Cpf) references tbcliente(Cpf)
);


create table tbbanco(
Codigo int primary key,
Nome varchar(50) not null
NumeroAgencia int,
foreign key (NumeroAgencia) referencess tbagencia(NumeroAgencia)
);
insert into tbbanco 
values
(1, "Banco do Brasil"),
(104, "Caixa Economica Federal"),
(801, "Banco Escola");

insert into tbagencia 
values
(123, 1, "Av Paulist, 78"),
(159, 104, "Rua Liberdade, 124"),
(401, 801, "Rua Vinte e três, 23"),
(485, 801, "Av Marechal, 68");

insert into tbcliente 
values
(12345678910, "Enildo", "M", "Rua Grande, 75"),
(12345678911, "Astrogildo", "M", "Rua Pequena, 789"),
(12345678912, "Monica", "F", "Av Larga, 148"),
(12345678913, "Cascão", "M", "Av Principal, 369");

insert into tbconta 
values
(9876, 456.05, 1, 123),
(9877, 312.00, 1, 123),
(9878, 100.00, 2, 485),
(9879, 5589.48, 1, 401);

insert into tbtelefone_cliente 
values
(912345678, 12345678910),
(912345679, 12345678911),
(912345680, 12345678912),
(912345681, 12345678913);

insert into tbhistorico
values
('2001-04-15', 12345678910, 9876),
('2011-03-10', 12345678911, 9877),
('2021-03-11', 12345678912, 9878),
('2000-07-05', 12345678913, 9879);

alter table tbcliente add email varchar(100);

select *
from tbcliente where Nome = "Monica";

select *
from tbagencia where CodBanco = "801";

select *
from tbcliente where Sexo = "M";
