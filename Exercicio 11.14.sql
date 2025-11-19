-- Exercício 11.14

use DistribuidoraLTDA;

delimiter $$

create procedure AtualizarProduto(
CodigoBarras decimal(14,0),
Nome varchar(200),
ValorUnitario decimal(8,2)
)
begin

if exists (select 1 from tbProduto where CodigoBarras = CodigoBarras) then

update tbProduto
set Nome = Nome, Valor = ValorUnitario
where CodigoBarras = CodigoBarras;
end if;

end $$

delimiter ;

call AtualizarProduto(12345678910113, 'Rei de Papel Mache', 64.50);
call AtualizarProduto(12345678910112, 'Bolinha de Sabão', 120.00);
call AtualizarProduto(12345678910113, 'Carro Bate Bate', 64.00 );