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

--exercicio 05
select produto, sum(receita) as receita_total
from vendas
group by produto;

--exercicio 06
select autores.nome as a, count(livros.id) as qntd_de_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.nome;

--exercicio 07
select matriculas.curso as curso, count(*) as qntd_de_alunos_por_materia
from matriculas
group by matriculas.curso;
