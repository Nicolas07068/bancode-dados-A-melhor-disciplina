select produto, sum(receita) as receita_total
from vendas
group by produto
having sum(receita) > 10000;