-- Exercício 11:

create table tbCliente(
Id int primary key auto_increment,
NomeCli char(200) not null,
NumEnd int not null,
CompEnd char(50),
CepCli int,
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

create table tbEndereco(
CEP int primary key,
Logradouro char(200) not null,

BairroId int not null,
foreign key (BairroId) references tbBairro(BairroId)

CidadeId int not null,
foreign key (CidadeId) references tbCidade(CidadeId)

UFId int not null,
foreign key (UFId) references tbEstado(UFId)
);

create tbBairro(
BairroId int primary key auto_increment,
Bairro char(200) not null
);

create tbCidade(
CidadeId int primary key auto_increment,
Cidade char(200)
);

create tbEstado(
UFId int primary key auto_increment,
UF char(2) not null
);


create table tbFornecedor(
Codigo int primary key auto_increment,
CNPJ bigint unique,
Nome char(200) not null,
Telefone bigint
);

create table tbProduto(
CodigoBarras Numeric(14) primary key,
Nome char(200) not null,
Valor decimal(10,2) not null,
QtdTotal int not null,
Codigo int, -- Foreign Key
);

create table tbCompra(
NotaFiscal int primary key,
DataCompra date not null,
ValorTotal decimal (10,2) not null,
Qtd int not null

Codigo int,
foreign key (Codigo) references tbFornecedor(Codigo)
);

create table tbItemCompra(
CodigoBarras Numeric(14),
NotaFiscal int,

primary key (NotaFiscal, CodigoBarras),

foreign key (NotaFiscal) references tbCompra(NotaFiscal),

foreign key (CodigoBarras) references tbProduto(CodigoBarras),

ValorItem decimal (10,2) not null,
Qtd int not null
);

create table tbVenda(
NumeroVenda int primary key,
DataVenda date not null,
TotalVenda decimal (10,2) not null,

Id bigint not null, -- Foreign Key,
foreign key (Id) references tbCliente(Id), -- Confirmar
 
NF int -- Foreign Key
foreign key (NF) references tbNotaFiscal(NF), -- Confirmar
); 

create table tbItemVenda(

NumeroVenda int,
CodigoBarras Numeric(14),
primary key (NumeroVenda, CodigoBarras),

foreign key (NumeroVenda) references tbVenda(NumeroVenda),


foreign key (CodigoBarras) references tbVenda(CodigoBarras),


ValorItem decimal(10,2) not null,
Qtd int not null
);

create table tbNotaFiscal(
NF primary key,
TotalNota dedcimal(10,2),
DataEmissao date not null
);
