-- Exercício 11.10

use DistribuidoraLTDA;

delimiter $$

create procedure inserir_vendas (
VarNumeroVenda int,
VarCliente varchar(200),	
VarCodigoBarras decimal(14,0),
VarQtd int
)

begin 
declare VarValorProduto decimal (8,2);
declare VarIdCliente int;

if exists(select 1 from tbCliente where NomeCli = VarCliente)
and exists(select 1 from tbProduto where CodigoBarras = VarCodigoBarras)
then

set VarIdCliente = (select Id from tbCliente where NomeCli = VarCliente);
set VarValorProduto = (select Valor from tbProduto where CodigoBarras = VarCodigoBarras);


insert into tbVenda(Id_Cli, NumeroVenda, DataVenda, TotalVenda) 
values(VarIdCliente, VarNumeroVenda, curdate(), (VarValorProduto * VarQtd));

insert into tbItemVenda(NumeroVenda, CodigoBarras, ValorItem, Qtd) 
values(VarNumeroVenda, VarCodigoBarras, VarValorProduto, VarQtd);

end if ;

end $$

delimiter ;

call inserir_vendas(1, "Pimpão", 12345678910111, 1);
call inserir_vendas(2, "Lança Perfume", 12345678910112, 2);
call inserir_vendas(3, "Pimpão", 12345678910113, 1);

select *
from tbVenda;
select *
from tbItemVenda;