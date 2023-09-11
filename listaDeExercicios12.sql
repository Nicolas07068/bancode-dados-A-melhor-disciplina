select alunos.nome as aluno, matriculas.curso
from alunos
left join matriculas on alunos.id = matriculas.aluno_id;