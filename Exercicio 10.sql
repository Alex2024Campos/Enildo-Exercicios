-- Exercício 10

use dbBANCO;
set sql_safe_updates = 0;

delete from tbtelefone_cliente where Cpf = "12345678911";

update tbconta
set TipoConta = 2
where TipoConta = 9879;

update tbcliente
set email = 'Astro@Escola.com'
where Nome = 'Monica';

select *
from tbconta;

update tbconta
set Saldo = Saldo * 1.10
where NumeroConta = '9876';	

update tbcliente
set Nome = "Enildo Candido", email = 'enildo@escola.com'
where Cpf = 12345678910;

update tbconta
set Saldo = Saldo - 30;

select *
from tbcliente;

select *
from tbconta;

select *
from tbtelefone_cliente;
