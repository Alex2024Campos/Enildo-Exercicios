-- Exercício 11.12

use DistribuidoraLTDA;

delimiter $$

create procedure inserir_produto(
VarCodigoBarras decimal(14,0),
VarNome varchar(200),
VarValorUnit decimal(8,2),
VarQtd int
)

begin

if not exists(select CodigoBarras from tbProduto where CodigoBarras = VarCodigoBarras) then
insert into tbProduto(CodigoBarras, Nome, Valor, Qtd)
values(VarCodigoBarras, VarNome, VarValorUnit, VarQtd);
end if;

end $$


delimiter ;

call inserir_produto(12345678910130, 'Camiseta de Poliéster', '35.61', 100);
call inserir_produto(12345678910131, 'Blusa Frio Moletom', '200.00', 100);
call inserir_produto(12345678910132, 'Vestido Decote Redondo', '144.00', 50);

select *
from tbProduto;