select produto, count(*) as qntd_transacoes
from vendas
group by produto
order by qntd_transacoes desc
limit 1;