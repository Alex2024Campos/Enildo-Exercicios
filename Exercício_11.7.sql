
-- Exercício 7

Delimiter $$
Create procedure InserirClientePF(VarNomeCli varchar(200), VarNumEnd decimal(6,0), VarCompEnd varchar(50), VarCEP decimal(8,0), VarCPF bigint, VarRG int, VarRGDig char(1), VarNasc date, VarLogradouro char(200), VarBairro varchar(200), VarCidade varchar(200), VarUF char(2))
BEGIN

if not exists (select CidadeId from tbCidade where Cidade = VarCidade) then -- Se não existir esse cidade, irá adicionar um novo
 call InserirCidade(VarCidade);
end if;

if not exists (select BairroId from tbBairro where Bairro = VarBairro) then -- Se não existir esse bairro, irá adicionar um novo
 call InserirBairro(VarBairro);
end if;

if not exists (select UFId from tbEstado where UF = VarUf) then
call inserirEstado(VarUf);
end if;

if not exists (select CEP from tbEndereco where CEP = VarCEP) then
insert into tbEndereco(Logradouro, BairroId, CidadeId, UFId, CEP)	
	values(
    VarLogradouro, 
    (Select BairroId from tbBairro where Bairro = VarBairro),
    (Select CidadeId from tbCidade where Cidade = VarCidade), 
    (Select UFId from tbEstado where UF = VarUF), 
    VarCEP
    );
end if;

insert into tbCliente(NomeCli, NumEnd, CompEnd, CepCli)
values(VarNomeCli, VarNumEnd, VarCompEnd, VarCEP);

insert into tbClientePF
values(VarCPF, VarRG, VarRGDIG, VarNasc, null);
end $$

CALL InserirClientePF('Pimpão', 325, NULL, 12345051, 12345678911, 12345678, '0', '2000-10-12', 'Av Brasil', 'Lapa', 'Campinas', 'SP');
CALL InserirClientePF('Disney Chaplin', 89, 'Ap. 12', 12345053, 12345678912, 12345679, '0', '2001-11-21', 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ');
CALL InserirClientePF('Marciano', 744, NULL, 12345054, 12345678913, 12345680, '0', '2001-06-01', 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ');
CALL InserirClientePF('Lança Perfume', 128, NULL, 12345059, 12345678914, 12345681, 'X', '2004-04-05', 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');
CALL InserirClientePF('Remédio Amargo', 2585, NULL, 12345058, 12345678915, 12345682, '0', '2002-07-15','Av Nova', 'Jardim Santa Isabel', 'Cuiabá', 'MT');

select * 
from tbCliente;

select * 
from tbClientePF;
