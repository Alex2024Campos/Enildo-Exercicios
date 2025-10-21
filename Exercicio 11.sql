<<<<<<< HEAD

-- Exercício 11:

=======
-- Exercício 11
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
create table tbCliente(
Id int primary key auto_increment,
NomeCli char(200) not null,
NumEnd int not null,
CompEnd char(50),
CepCli int,
<<<<<<< HEAD
foreign key (CepCli) references tbEndereco(CEP) -- Foreign Key
=======
foreign key (CepCli) references tbEndereco() -- Foreign Key
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
);

create table tbClientePF(
CPF bigint primary key,
RG int not null,
RG_Dig char(1) not null,
<<<<<<< HEAD
Nasc date not null,

id int,
foreign key (id) references tbCliente(Id)
);

create table tbClientePJ(
CNPJ bigint primary key,
IE bigint unique,

id int,
foreign key (id) references tbCliente(Id)
=======
Nasc date not null
);


create table tbClientePJ(
CNPJ bigint primary key,
IE bigint unique
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
);

create table tbEndereco(
CEP int primary key,
Logradouro char(200) not null,

BairroId int not null,
<<<<<<< HEAD
foreign key (BairroId) references tbBairro(BairroId)

CidadeId int not null,
foreign key (CidadeId) references tbCidade(CidadeId)
=======
foreign key (BairroId) references tbBairro(BairroId),

CidadeId int not null,
foreign key (CidadeId) references tbCidade(CidadeId),
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774

UFId int not null,
foreign key (UFId) references tbEstado(UFId)
);

<<<<<<< HEAD
create tbBairro(
=======
create table tbBairro(
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
BairroId int primary key auto_increment,
Bairro char(200) not null
);

<<<<<<< HEAD
create tbCidade(
=======
create table tbCidade(
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
CidadeId int primary key auto_increment,
Cidade char(200)
);

<<<<<<< HEAD
create tbEstado(
=======
create table tbEstado(
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
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
<<<<<<< HEAD
CodigoBarras Numeric(14) primary key,
Nome char(200) not null,
Valor decimal(10,2) not null,
QtdTotal int not null,
Codigo int, -- Foreign Key
=======
CodigoBarras bigint primary key,
Nome char(200) not null,
Valor decimal(10,2) not null,
QtdTotal int not null,
Codigo int -- Foreign Key
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
);

create table tbCompra(
NotaFiscal int primary key,
DataCompra date not null,
ValorTotal decimal (10,2) not null,
Qtd int not null
<<<<<<< HEAD

Codigo int,
foreign key (Codigo) references tbFornecedor(Codigo)
);

create table tbItemCompra(
CodigoBarras Numeric(14),
NotaFiscal int,

primary key (NotaFiscal, CodigoBarras),

foreign key (NotaFiscal) references tbCompra(NotaFiscal),

foreign key (CodigoBarras) references tbProduto(CodigoBarras),
=======
);

create table tbItemCompra(
NotaFiscal int primary key,
foreign key (NotaFiscal) references tbCompra(NotaFiscal),

CodigoBarras bigint primary key,
foreign key (CodigoBarras) references tbCompra(CodigoBarras),
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774

ValorItem decimal (10,2) not null,
Qtd int not null
);

create table tbVenda(
NumeroVenda int primary key,
DataVenda date not null,
TotalVenda decimal (10,2) not null,

<<<<<<< HEAD
Id bigint not null, -- Foreign Key,
foreign key (Id) references tbCliente(Id), -- Confirmar
 
NF int -- Foreign Key
foreign key (NF) references tbNotaFiscal(NF), -- Confirmar
); 

create table tbItemVenda(

NumeroVenda int,
CodigoBarras Numeric(14),
primary key (NumeroVenda, Numeric),

foreign key (NumeroVenda) references tbVenda(NumeroVenda),


=======
Id_Cli bigint not null, -- Foreign Key
foreign key (Id_Cli) references tb(Id_Cli), -- Confirmar
 
NF int, -- Foreign Key
foreign key (NF) references tbNotaFiscal(NF) -- Confirmar
); 

create table tbItemVenda(
NumeroVenda int primary key,
foreign key (NumeroVenda) references tbVenda(NumeroVenda),


CodigoBarras bigint primary key,
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
foreign key (CodigoBarras) references tbVenda(CodigoBarras),


ValorItem decimal(10,2) not null,
Qtd int not null
);

create table tbNotaFiscal(
<<<<<<< HEAD
NF primary key,
TotalNota dedcimal(10,2),
=======
NF bigint primary key,
TotalNota decimal(10,2),
>>>>>>> 6f5d474dd9d91ed81e8c51f4cecf2e3b432c6774
DataEmissao date not null
);