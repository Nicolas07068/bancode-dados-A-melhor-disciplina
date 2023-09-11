--Exercicio 01
select * from livros;

--exercicio 02
select nome from autores
where nascimento < '1900-01-01';

--exercicio 03
select * from livros
where autor_id = 1;

--exercicio 04 
select alunos.nome, matriculas.curso
from alunos
inner join matriculas on alunos.id = matriculas.aluno_id
where curso = 'Engenharia de Software';
