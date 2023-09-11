select autores.nome as Autor, count(livros.id) as Quantidade_de_Livros
from autores
join livros on autores.id = livros.autor_id
group by autores.nome
order by Quantidade_de_Livros desc
limit 1;
