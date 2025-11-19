use dbescola; -- Reabrindo a database. Exercício 8

create table tbest(
IdUf smallint primary key,
NomeUfs char(2) not null,
NomeEstado char(40) not null
);

alter table tbEndereco add constraint FK_Iduf_TbEndereco foreign key (IdUf) references tbEst(IdUf);

alter table tbest drop NomeEstado;

rename table tbest to tbEstado;

alter table tbEndereco add IdCid mediumint;

create table tbcidade(
IdCid mediumint primary key,
NomeCidade char(50) not null
);

alter table tbCidade modify NomeCidade char(250) not null;

ALTER TABLE tbEndereco ADD CONSTRAINT FK_IdCid_TbEndereco foreign key (IdCid) REFERENCES tbCidade(IdCid);
