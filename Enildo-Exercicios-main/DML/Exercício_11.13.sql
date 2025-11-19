-- Exercício 11.13

use DistribuidoraLTDA;
set sql_safe_updates = 0;


delimiter $$

create procedure ApagarProduto(VarCodigoBarras decimal(14,0))
begin

if exists (select 1 from tbProduto where CodigoBarras = VarCodigoBarras) then

delete from tbProduto
where CodigoBarras = VarCodigoBarras;
end if;

end $$

DELIMITER ;

call ApagarProduto(12345678910116);
call ApagarProduto(12345678910117);

select *
from tbProduto;