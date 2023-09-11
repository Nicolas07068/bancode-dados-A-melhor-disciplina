select livros.titulo as livro, autores.nome as autor
from livros
inner join autores on livros.autor_id = autores.id;
