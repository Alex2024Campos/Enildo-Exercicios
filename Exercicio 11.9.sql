-- Exercício 11.9
use DistribuidoraLTDA;

delimiter $$

create procedure inserir_compra(
NotaFiscal int,
Fornecedor varchar(200),
DataCompra varchar(10),
CodigoBarras decimal(14,0),
ValorItem decimal(8,2),
Qtd int,
QtdTotal int,
ValorTotal decimal(8,2)
)
begin 
declare FornecedorId int;
declare ExisteNotaId int;

select Codigo into FornecedorId from tbFornecedor where Nome = Fornecedor;

if FornecedorId is not null then 
if exists (select 1 from tbProduto where CodigoBarras = CodigoBarras) then
select count(*) into ExisteNotaId from tbCompra where NotaFiscal = NotaFiscal;
if ExisteNotaId = 0 then
insert into tbCompra (NotaFiscal, DataCompra, ValorTotal, QtdTotal, Codigo)
values (NotaFiscal, str_to_date(DataCompra, '%d/%m/%Y'), ValorTotal, QtdTotal, FornecedorId);
end if;

insert into tbItemCompra (NotaFiscal, CodigoBarras, ValorItem, Qtd)
values(NotaFiscal, CodigoBarras, ValorItem, Qtd);

end if; 
end if;
    

end $$

DELIMITER ;

call inserir_compra(
8459, 'Amoroso e Doce', '01/05/2018',
12345678910111, 22.22, 200, 700, 21944.00
);

call inserir_compra(
2482, 'Revenda Chico Loco', '22/04/2020',
12345678910112, 40.50, 180, 180, 7290.00
);

call inserir_compra(
21563, 'Marcelo Dedal', '12/07/2020',
12345678910113, 3.00, 300, 300, 900.00
);

call inserir_compra(
8459, 'Amoroso e Doce', '01/05/2018',
12345678910114, 35.00, 500, 700, 21944.00
);

call inserir_compra(
156354, 'Revenda Chico Loco', '23/11/2021',
12345678910115, 54.00, 350, 350, 18900.00
);
