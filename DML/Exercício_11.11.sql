-- Exercício 11.11

use DistribuidoraLTDA;

delimiter $$

create procedure inserir_notafiscal(NF int, ClienteNota varchar(200))

begin
declare IdCliente int;
declare TotalNota decimal (8,2);

select Id into IdCliente from tbCliente where NomeCli = ClienteNota;

if IdCliente is not null then 

if exists (select 1 from tbVenda where Id_Cli = IdCliente) then 
select sum(TotalVenda) into TotalNota from tbVenda where Id_Cli = IdCliente;

insert into tbNota_Fiscal(NF, DataEmissao, TotalNota, Id_Cli)
values(pNF, curdate(), TotalNota, IdCliente);

end if; 
end if;

end $$


delimiter ;

call inserir_notafiscal(359, 'Pimpão');
call inserir_notafiscal(360, 'Lança Perfume');