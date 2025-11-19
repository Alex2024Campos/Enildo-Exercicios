use DistribuidoraLTDA;
-- Exercício 3

Delimiter $$
Create procedure InserirEstado(VarUF char(2))
BEGIN

insert into tbEstado(UF) 
	values (VarUF);
    
end $$

call InserirEstado("SP");
call InserirEstado("RJ");
call InserirEstado("RS");

select * 
from tbEstado;