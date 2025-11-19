-- Exercício 11.12

use DistribuidoraLTDA;

delimiter $$

create procedure inserir_produto(
CodigoBarras decimal(14,0),
Nome varchar(200),
ValorUnit decimal(8,2),
Qtd int
)

begin

if not exists(select 1 from tbProduto where CodigoBarras = CodigoBarras) then

insert into tbProduto(CodigoBarras, Nome, Valor, Qtd)
values(CodigoBarras, Nome, ValorUnitario, Qtd);

end if;

end $$


delimiter ;

call inserir_produto(12345678910130, 'Camiseta de Poliéster', 'R$35.61', 100);
call inserir_produto(12345678910131, 'Blusa Frio Moletom', 'R$200.00', 100);
call inserir_produto(12345678910132, 'Vestido Decote Redondo', 'R$144.00', 50);
