--exercicio 01

delimiter //

create procedure  sp_ListarAutores()
begin
  select * from Autor;
end //

delimiter ;

call sp_ListarAutores();

--exercicio 02

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
