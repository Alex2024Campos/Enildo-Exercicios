
-- Exercício 5

Delimiter $$
Create procedure InserirProduto(VarCodigoBarras decimal(14,0), VarNome varchar(200), VarValor decimal(10,2), VarQtd int)
BEGIN

insert into tbProduto(CodigoBarras, Nome, Valor, Qtd) 
	values (VarCodigoBarras, VarNome, VarValor, VarQtd);
end $$

call InserirProduto(12345678910111, "Rei de Papel Mache", 5461, 120);
call InserirProduto(12345678910112, "Bolinha de Sabão", 10045, 120);
call InserirProduto(12345678910113, "Carro Bate", 4400, 120);
call InserirProduto(12345678910114, "Bola Furada", 1000, 120);
call InserirProduto(12345678910115, "Maçã Laranja", 9944, 120);
call InserirProduto(12345678910116, "Boneco do Hitler", 12400, 200);
call InserirProduto(12345678910117, "Farinha de Suruí", 5000, 200);
call InserirProduto(12345678910118, "Zelador de Cemitério", 2450, 100);

select * 
from tbProduto;
