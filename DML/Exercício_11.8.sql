
-- Exercício 8
Delimiter $$
Create procedure InserirClientePJ(VarNomeCli varchar(200), VarCNPJ bigint, VarIE bigint, VarCEP decimal(8,0), VarLogradouro char(200), VarNumEnd decimal(6,0), VarCompEnd varchar(50),  VarBairro varchar(200), VarCidade varchar(200), VarUF char(2))
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

    insert into tbClientePJ(CNPJ, IE)
    Values(VarCNPJ, VarIE);
    
    insert into tbCliente(NomeCli, NumEnd, CompEnd, CepCli)
    values(VarNomeCli, VarNumEnd, VarCompEnd, VarCEP);
end $$

call InserirClientePJ("Paganada", 12345678912345, 98765432198, 12345051, "Av Brasil", 159, Null, "Lapa", "Campinas", "SP");
call InserirClientePJ("Caloteando", 12345678912346, 98765432199, 12345053, "Av Paulista", 69, Null, "Penha", "Rio de Janeiro", "RJ");
call InserirClientePJ("Semgrana", 12345678912347, 98765432100, 12345060, "Rua dos Amores", 189, Null, "Sei Lá", "Recife", "PE");
call InserirClientePJ("Cemreais", 12345678912348, 98765432101, 12345060, "Rua dos Amores", 5024, "Sala 23", "Sei Lá", "Recife", "PE");
call InserirClientePJ("Durango", 12345678912349, 98765432102, 12345060, "Rua dos Amores", 1254, Null, "Sei Lá", "Recife", "PE");

select *
from tbClientePJ;
select *
from tbCliente;
