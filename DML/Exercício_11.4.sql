
-- Exercício 4

Delimiter $$
Create procedure InserirBairro(VarBairro char(200))
BEGIN

insert into tbBairro(Bairro) 
	values (VarBairro);
end $$

call InserirBairro("Aclimação");
call InserirBairro("Capão Redondo");
call InserirBairro("Pirituba");
call InserirBairro("Liberdade");

select * 
from tbBairro;
