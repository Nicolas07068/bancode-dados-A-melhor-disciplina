select produto, sum(receita) as receita_total
from vendas
group by produto;