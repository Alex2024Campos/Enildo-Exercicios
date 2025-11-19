-- Exercício 9
DELIMITER $$
CREATE PROCEDURE spInsert_tbCompra(
    vNotaFiscal int,
    vFornecedor varchar(200),
    vDataCompra date,
    vCodigoBarras decimal(14,0),
    vValorItem decimal(10,2),
    vQtd int,
    vQtdTotal int,
    vValorTotal decimal(10,2)
)
BEGIN
declare vCodFornecedor int;
    -- Verificar se o fornecedor existe
    IF NOT EXISTS (
        SELECT * FROM tbFornecedor 
        WHERE Nome = vFornecedor
    ) THEN

        SELECT 'Fornecedor não cadastrado!' AS Mensagem;


    -- Verificar se o produto existe
    ELSEIF NOT EXISTS (
        SELECT CodigoBarras FROM tbProduto 
        WHERE CodigoBarras = vCodigoBarras
    ) THEN

        SELECT 'Produto não cadastrado!' AS Mensagem;
    -- Se ambos existem, insere

            END IF;

IF EXISTS (
SELECT * FROM tbFornecedor
WHERE Nome = vFornecedor
        ) then
        
    Select Codigo into vCodFornecedor from tbFornecedor where Nome = vFornecedor;
 
 IF NOT EXISTS(select 1 from tbCompra where NotaFiscal = vNotaFiscal) then
        INSERT INTO  tbCompra(NotaFiscal, DataCompra, ValorTotal, QtdTotal, Codigo)
        values(vNotaFiscal, vDataCompra, vValorTotal, vQtdTotal, vCodFornecedor);
        end if;
        
		IF NOT EXISTS(select 1 from tbItemCompra where NotaFiscal = vNotaFiscal and CodigoBarras = vCodigoBarras) then
        insert into tbItemCompra(NotaFiscal, CodigoBarras, ValorItem, Qtd)
        values(vNotaFiscal, vCodigoBarras, vValorItem, vQtd);
              end if;
        
        END IF;

END $$

call spInsert_tbCompra(8459, "Amoroso e Doce", '2018-05-01', 12345678910111, 2222, 200, 700, 2194400);
call spInsert_tbCompra(2482, "Revenda Chico Loco", '2020-04-22', 12345678910112, 4050, 180, 180, 729000);
call spInsert_tbCompra(21563, "Marcelo Dedal", '2020-07-12', 12345678910113, 300, 300, 300, 90000);
call spInsert_tbCompra(156354, "Revenda Chico Loco", '2021-11-23', 12345678910115, 5400, 350, 350, 1890000);
call spInsert_tbCompra(8459, "Amoroso e Doce", '2018-05-01', 12345678910114, 3500, 500, 700, 2194400);

select *
from tbCompra;
select * 
from tbItemCompra;
select * 
from tbFornecedor;
select * 
from tbProduto;
