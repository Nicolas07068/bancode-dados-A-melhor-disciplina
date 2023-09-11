select matriculas.curso as curso, count(*) as qntd_de_alunos_por_materia
from matriculas
group by matriculas.curso;
