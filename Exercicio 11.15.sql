-- Exercício 11.15

use DistribuidoraLTDA;

delimiter $$

create procedure MostrarProdutos()
begin
    select * from tbProduto;
end $$

delimiter ;

call MostrarProdutos;

show tables;
select * from tbEndereco;
select * from tbProduto;
select * from tbCliente;
select * from tbClientePF;
select * from tbClientePJ;
select * from tbCompra;

select NotaFiscal, date_format(DataCompra, '%d/%m/%Y') as DataCompraBR, ValorTotal, Qtd, Codigo from tbCompra;
select * from tbItemCompra;
select * from tbVenda;
select * from tbItemVenda;

select NumeroVenda, date_format(DataVenda, '%d/%m/%Y') as DataVendaBR, TotalVenda from tbVenda;
select * from tbNotaFiscal;
select * from tbProduto;