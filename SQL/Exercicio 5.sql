create database Gemima;

use Gemima;

create table tbvenda(
NF int primary key auto_increment,
DataValidade datetime not null
);

alter table tbVenda add Preco decimal(8,2) not null;
alter table tbVenda add Qtd int;

alter table tbvenda drop DataValidade;

alter table tbVenda add DataVenda datetime default current_timestamp;

create table produto(
CodigoB bigint(13) primary key,
NomeProd char(50) not null
);

alter table tbVenda add CodigoB bigint;

alter table tbVenda add foreign key (CodigoB) references produto(CodigoB);

describe produto;
describe tbvenda;
