--exercicios01

delimiter //

create procedure  sp_ListarAutores()
begin
  select * from Autor;
end //

delimiter ;

call sp_ListarAutores();
