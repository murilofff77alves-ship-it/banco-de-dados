create database escolaDB;

USE escolaDB;

create table alunos (
	id int auto_increment primary key,
    nome varchar(50),
    idade int,
    cidade varchar(50)
);

create table curso (
    id int auto_increment primary key,
    nome_curso varchar(50),
    carga_horaria int
);

create table matricula (
    id int auto_increment primary key,
    aluno_id int,
    curso_id int,
    data_matricula date,
    foreign key (aluno_id) references alunos(id),
    foreign key (curso_id) references curso(id)
);

INSERT INTO alunos (nome, idade, cidade)
VALUES
	('Murilo Alves da Silva',27, 'Campina Grande'),
	('Alex da Silva',46, 'Rio de Janeiro'),
	('Juliano de Oliveira',43, 'Recife'),
	('Mario Soares da Silva',21,'Natal');

INSERT INTO curso (nome_curso, carga_horaria)
VALUES

('Banco de Dados', 40),
('Logica de progamação', 50),
('Desenvolvimento web', 60);

INSERT INTO matricula (aluno_id, curso_id, data_matricula)
VALUES
(1, 1, '2024-02-15'),
(2, 2, '2024-03-10'),
(3, 3, '2024-04-05'),
(4, 1, '2024-05-20');

select data_matricula
from matricula;

select * from alunos;

select nome, idade
from alunos
where idade > 20;

select nome, cidade
from alunos
where cidade = 'campina grande';


select nome_curso, carga_horaria
from curso
where carga_horaria < 70;

    
SELECT alunos.nome AS nome_alunos, curso.nome_curso AS curso
FROM alunos, curso, matricula
WHERE alunos.id = matricula.aluno_id
AND curso.id = matricula.curso_id;
  
  
select nome, idade, cidade
from alunos
where idade > 20 and cidade = 'campina grande';
  
  
select nome_curso
from curso
where carga_horaria = 40 or carga_horaria = 80; 


select nome_curso
from curso
where carga_horaria = 40 or carga_horaria = 50; 

/Questão 1 - Liste todos os alunos com suas respectivas cidades/

SELECT nome, cidade
FROM alunos;

/*Questão 2 - Mostre apenas os nomes dos cursos com carga horária maior que 50 horas. */

SELECT nome_curso
FROM curso
WHERE carga_horaria > 50;


/*Questão 3 - Exisba os alunos que moram em Campina grande. */

SELECT nome
FROM alunos
WHERE cidade = 'Campina Grande';

/Questão 4 - Mostre o nome e idade dos alunos com idade menor que 22 anos/

SELECT nome, idade
FROM alunos
WHERE idade < 22;

/Questão 5 - Liste o nome do aluno e o nome do curso em que ele está matriculado/

SELECT alunos.nome AS aluno,
curso.nome_curso AS curso
FROM matricula
JOIN alunos ON alunos.id = matricula.aluno_id
JOIN curso ON curso.id = matricula.curso_id;

/Questão 6 - Exiba os alunos matriculados no curso "Banco de dados"/

SELECT alunos.nome
FROM matricula
JOIN alunos ON alunos.id = matricula.aluno_id
JOIN curso ON curso.id = matricula.curso_id
WHERE curso.nome_curso = 'Banco de Dados';

/*Questão 7 - Mostre os curso com carga horária diferente de 60 horas. */

SELECT nome_curso, carga_horaria
FROM curso
WHERE carga_horaria <> 60;

/*Questão 8 - Liste o nome e cidade dos alunos de Campina Grande  ou Recife. */

SELECT nome, cidade
FROM alunos
WHERE cidade = 'Campina Grande'
OR cidade = 'Recife';
