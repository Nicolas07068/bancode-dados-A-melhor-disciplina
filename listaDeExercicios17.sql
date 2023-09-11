select produto, min(receita) as menor_receita
from vendas
group by  produto
limit 1;