use DistribuidoraLTDA;
-- Exercício 2

Delimiter $$
Create procedure InserirCidade(VarCidade varchar(200))
BEGIN
-- Sem a necessidade de especificar o ID, já que a cada novo registro, o auto incrementar irá adicionar mais um ao valor de ID.
insert into tbCidade(Cidade) 
	values (VarCidade);
    
end $$

 call InserirCidade("Rio de Janeiro");
 call InserirCidade("São Carlos");
 call InserirCidade("Campinas");
 call InserirCidade("Franco da Rocha");
 call InserirCidade("Osasco");
 call InserirCidade("Pirituba");
 call InserirCidade("Lapa");
 call InserirCidade("Ponta Grossa");
 
 select * 
from tbCidade;
 