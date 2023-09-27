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
