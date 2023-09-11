select distinct matriculas.curso, alunos.nome as aluno
from matriculas
right join alunos on matriculas.aluno_id = alunos.id;