select autores.nome as autor, livros.titulo as livro
from autores
left join livros on autores.id = livros.autor_id;