select produto, avg(receita) as media_total
from vendas
group by produto;
