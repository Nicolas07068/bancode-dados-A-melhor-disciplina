select a.nome as Aluno, count(m.aluno_id) as total_matriculas
from alunos a
left join matriculas m on a.id = m.aluno_id
group by a.nome
order by total_matriculas desc ;
