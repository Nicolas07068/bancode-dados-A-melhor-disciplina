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
