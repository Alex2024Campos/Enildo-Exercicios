-- Exercício 11:
create database DistribuidoraLTDA;
use DistribuidoraLTDA;

create table tbBairro(
BairroId int primary key auto_increment,
Bairro char(200) not null
);

create table tbCidade(
CidadeId int primary key auto_increment,
Cidade varchar(200) not null
);

create table tbEstado(
UFId int primary key auto_increment,
UF char(2) not null
);


create table tbEndereco(
CEP  decimal(8,0) primary key,
Logradouro char(200) not null,

BairroId int not null,
foreign key (BairroId) references tbBairro(BairroId),

CidadeId int not null,
foreign key (CidadeId) references tbCidade(CidadeId),

UFId int not null,
foreign key (UFId) references tbEstado(UFId)
);


create table tbCliente(
Id int primary key auto_increment,
NomeCli varchar(200) not null,
NumEnd decimal(6,0) not null,
CompEnd varchar(50),
CepCli decimal(8,0),
foreign key (CepCli) references tbEndereco(CEP) -- Foreign Key
);

create table tbClientePF(
CPF bigint primary key,
RG int not null,
RG_Dig char(1) not null,
Nasc date not null,

id int,
foreign key (id) references tbCliente(Id)
);

create table tbClientePJ(
CNPJ bigint primary key,
IE bigint unique,

id int,
foreign key (id) references tbCliente(Id)
);

create table tbFornecedor(
Codigo int primary key auto_increment,
CNPJ decimal(14,0) unique,
Nome varchar(200) not null,
Telefone decimal(11,0)
);

create table tbProduto(
CodigoBarras Decimal(14,0) primary key,
Nome varchar(200) not null,
Valor decimal(10,2) not null,
Qtd int
);

create table tbCompra(
NotaFiscal int primary key,
DataCompra date not null,
ValorTotal decimal (10,2) not null,
QtdTotal int not null,

Codigo int,
foreign key (Codigo) references tbFornecedor(Codigo)
);

create table tbItemCompra(
CodigoBarras Decimal(14,0),
NotaFiscal int,

primary key (NotaFiscal, CodigoBarras),

foreign key (NotaFiscal) references tbCompra(NotaFiscal),
foreign key (CodigoBarras) references tbProduto(CodigoBarras),

ValorItem decimal (8,2) not null,
Qtd int not null
);

create table tbNotaFiscal(
NF int primary key,
TotalNota decimal(8,2) not null,
DataEmissao date not null
);

create table tbVenda(
NumeroVenda int primary key,
DataVenda date not null,
TotalVenda decimal (10,2) not null,

Id_Cli int not null, -- Foreign Key,
foreign key (Id_Cli) references tbCliente(Id), -- Confirmar
 
NF int, -- Foreign Key
foreign key (NF) references tbNotaFiscal(NF) -- Confirmar
); 

create table tbItemVenda(

NumeroVenda int,
CodigoBarras Decimal(14,0),
primary key (NumeroVenda, CodigoBarras),

foreign key (NumeroVenda) references tbVenda(NumeroVenda),
foreign key (CodigoBarras) references tbProduto(CodigoBarras),


ValorItem decimal(8,2) not null,
Qtd int not null
);