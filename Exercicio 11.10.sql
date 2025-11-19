-- Exercício 11.10

use DistribuidoraLTDA;

delimiter $$

create procedure inserir_vendas (
NumeroVenda int,
Cliente varchar(200),	
CodigoBarras decimal(14,0),
Qtd int
)

begin 
declare ValorProduto decimal (8,2);
declare IdCliente int;

if exists(select 1 from tbCliente where NomeCli = Cliente)
and exists(select 1 from tbProduto where CodigoBarras = CodigoBarras)
then

set IdCliente = (select Id from tbCliente where NomeCli = Cliente);
set ValorProduto = (select Valor from tbProduto where CodigoBarras = CodigoBarras);


insert into tbVenda(Id_Cli, NumeroVenda, DataVenda, TotalVenda) 
values(IdCliente, NumeroVenda, curdate(), (ValorProduto * Qtd));

insert into tbItemVenda(NumeroVenda, CodigoBarras, ValorItem, Qtd) 
values(NumeroVenda, CodigoBarras, ValorProduto, Qtd);

end if ;

end $$

delimiter ;

call inserir_vendas(1, "Pimpão", 12345678910111, 1);
call inserir_vendas(2, "Lança Perfume", 12345678910112, 2);
call inserir_vendas(3, "Pimpão", 12345678910113, 1);
