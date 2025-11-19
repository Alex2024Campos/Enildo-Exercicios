
-- Exercício 6
Delimiter $$
Create procedure InserirEndereco(VarLogradouro char(200), VarBairro varchar(200), VarCidade varchar(200), VarUF char(2), VarCEP decimal(8,0))
BEGIN

if not exists (select BairroId from tbBairro where Bairro = VarBairro) then -- Se não existir esse bairro, irá adicionar um novo
 call InserirBairro(VarBairro);
end if;

if not exists (select CidadeId from tbCidade where Cidade = VarCidade) then -- Se não existir esse cidade, irá adicionar um novo
 call InserirCidade(VarCidade);
end if;

if not exists (select UFId from tbEstado where UF = VarUF) then -- Se não existir esse estado, irá adicionar um novo
 call InserirEstado(VarUF);
end if;

insert into tbEndereco(Logradouro, BairroId, CidadeId, UFId, CEP)	
	values(
    VarLogradouro, 
    (Select BairroId from tbBairro where Bairro = VarBairro),
    (Select CidadeId from tbCidade where Cidade = VarCidade), 
    (Select UFId from tbEstado where UF = VarUF), 
    VarCEP
    );

end $$

call InserirEndereco("Rua da Federal", "Lapa", "São Paulo", "SP", 12345050);
call InserirEndereco("Av Brasil", "Lapa", "Campinas", "SP", 12345051);
call InserirEndereco("Rua Liberdade", "Consolação", "São Paulo", "SP", 12345052);
call InserirEndereco("Av Paulista", "Penha", "Rio de Janeiro", "RJ", 12345053);
call InserirEndereco("Rua Ximbú", "Penha", "Rio de Janeiro", "RJ", 12345054);
call InserirEndereco("Rua Piu XI", "Penha", "Campinas", "SP", 12345055);
call InserirEndereco("Rua Pão na Chapa", "Barra Funda", "Ponta Grossa", "RS", 12345056);
call InserirEndereco("Rua Pão na Chapa", "Barra Funda", "Ponta Grossa", "RS", 12345057);

select * 
from tbEndereco;
select * 
from tbEstado;
select *
from tbCidade;
select* 
from tbBairro;