select distinct alunos.nome as aluno, matriculas.curso
from alunos
inner join matriculas on alunos.id = matriculas.aluno_id;