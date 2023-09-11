select autores.nome as autores, count(livros.id) as qntd_de_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.nome
having count(livros.id) > 2;