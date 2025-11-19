-- Exercício 11.13

use DistribuidoraLTDA;

delimiter $$

create procedure ApagarProduto(CodigoBarras decimal(14,0))
begin

if exists (select 1 from tbProduto where CodigoBarras = CodigoBarras) then

delete from tbProduto
where CodigoBarras = CodigoBarras;
end if;

end $$

DELIMITER ;

call ApagarProduto(12345678910116);
call ApagarProduto(12345678910117);