-- Exercício 11.14

use DistribuidoraLTDA;

delimiter $$

create procedure AtualizarProduto(
VarCodigoBarras decimal(14,0),
VarNome varchar(200),
VarValorUnitario decimal(8,2)
)
begin

if exists (select CodigoBarras from tbProduto where CodigoBarras = VarCodigoBarras) then
update tbProduto
set Nome = VarNome, 
Valor = VarValorUnitario
where CodigoBarras = VarCodigoBarras;
end if;

end $$

delimiter ;

call AtualizarProduto(12345678910111, 'Rei de Papel Mache', 64.50);
call AtualizarProduto(12345678910112, 'Bolinha de Sabão', 120.00);
call AtualizarProduto(12345678910113, 'Carro Bate Bate', 64.00 );

select *
from tbProduto;