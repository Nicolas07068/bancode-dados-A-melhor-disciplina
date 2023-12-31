-- exercicio 01

delimiter //

create procedure  sp_ListarAutores()
begin
  select * from Autor;
end //

delimiter ;

call sp_ListarAutores();

-- exercicio 02

delimiter //

create procedure sp_LivrosPorCategoria(in categoriaNome varchar(100))
begin
  select Livro.Titulo
  from Livro
  join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
  where Categoria.Nome = categoriaNome;
end //

delimiter ;

call sp_LivrosPorCategoria('Ciência');


-- exercicio 03

delimiter //

create procedure sp_ContarLivrosPorCategoria(in categoriaNome varchar(100), out contador int)
begin
  select count(*)
  into contador
  from Livro
  join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
  where Categoria.Nome = categoriaNome;
end //

delimiter ;

call sp_ContarLivrosPorCategoria('Romance', @contagem);
select @contagem;


-- exercicio 04

delimiter //

create procedure sp_VerificarLivrosCategoria(in categoriaNome varchar(100), out possuiLivros boolean)
begin
  declare contador int;
  call sp_ContarLivrosPorCategoria(categoriaNome, contador);
  if contador > 0 then
    set possuiLivros = true;
  else
    set possuiLivros = false;
  end if;
end //

delimiter ;

call sp_VerificarLivrosCategoria('Ficção Científica', @possuiLivros);
select @possuiLivros;


-- exercicio 05 

delimiter //

create procedure sp_LivrosAteAno(in ano int)
begin
  select * from Livro where Ano_Publicacao <= ano;
end //

delimiter ;

call sp_LivrosAteAno(2010);


-- exercicio 06

delimiter //

create procedure sp_TitulosPorCategoria(in categoriaNome varchar(100))
begin
  select Livro.Titulo
  from Livro
  join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
  where Categoria.Nome = categoriaNome;
end //

delimiter ;

call sp_TitulosPorCategoria('Autoajuda');


-- exercicio 07

delimiter //

create procedure sp_AdicionarLivro(in tituloLivro varchar(255), in editoraID int, in anoPublicacao int, in numPaginas int, in categoriaID int, out mensagem varchar(255))
begin
  declare exit handler for sqlexception 
  begin
    set mensagem = 'Erro: Não foi possível adicionar o livro. Verifique se o título já existe.';
  end;

  insert into Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
  values (tituloLivro, editoraID, anoPublicacao, numPaginas, categoriaID);
  
  set mensagem = 'Livro adicionado com sucesso.';
end //

delimiter ;


call sp_AdicionarLivro('Nova Aventura', 1, 2022, 400, 3, @mensagem);
select @mensagem;


-- exercicio 08

delimiter //

create procedure sp_AutorMaisAntigo(out nomeAutorMaisAntigo varchar(255))
begin
  select concat(Nome, ' ', Sobrenome) into nomeAutorMaisAntigo
  from Autor
  order by Data_Nascimento asc
  limit 1;
end //

delimiter ;

-- exercicio 09

-- utilizei a procedure sp_LivrosPorCategoria de exemplo


-- Definindo um novo delimitador para permitir a criação da stored procedure.
delimiter //

-- Criando a stored procedure sp_LivrosPorCategoria com um parâmetro de entrada categoriaNome.
create procedure sp_LivrosPorCategoria(in categoriaNome varchar(100))
begin
  -- Selecionando o título dos livros da tabela Livro que pertencem à categoria especificada.
  -- A cláusula JOIN é usada para conectar a tabela Livro à tabela Categoria com base no ID da categoria.
  select Livro.Titulo
  from Livro
  join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
  -- Filtrando os resultados para incluir apenas os livros da categoria especificada.
  where Categoria.Nome = categoriaNome;
end //

-- Restaurando o delimitador padrão.
delimiter ;

-- Para testar a stored procedure, você pode chamá-la com o nome da categoria desejada.
-- Por exemplo, para listar os títulos de livros da categoria 'Ciência':
-- CALL sp_LivrosPorCategoria('Ciência');



call sp_AutorMaisAntigo(@nomeAutorMaisAntigo);
select @nomeAutorMaisAntigo;


-- exercicio 10

delimiter //

create procedure sp_LivrosESeusAutores()
begin
  select Livro.Titulo, concat(Autor.Nome, ' ', Autor.Sobrenome) as Autor
  from Livro
  join Autor_Livro on Livro.Livro_ID = Autor_Livro.Livro_ID
  join Autor on Autor_Livro.Autor_ID = Autor.Autor_ID;
end //

delimiter ;


call sp_LivrosESeusAutores();
