drop datebase SGE;
/* Criando o banco de dados */
CREATE DATABASE SGE;

/* Usando o banco de dados */
USE SGE;

/* Criando a tabela Alunos */
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(75),
    telefone VARCHAR(15),
    data_nascimento DATE
);

/* Criando a tabela Cursos */
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horaria INT,
    disciplinas VARCHAR(75),
    horarios DATETIME,
    preco DECIMAL(10,2)
);

/* Criando a tabela Professores */
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(80),
    telefone VARCHAR(15),
    especialidade VARCHAR(50)
);

/* Criando a tabela Matriculas */
CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    status VARCHAR(20),

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),

    CONSTRAINT fk_matricula_curso
        FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

/* Inserindo dados na tabela Alunos */
INSERT INTO Alunos (id_aluno, nome, email, telefone, data_nascimento)
VALUES

(1, 'Larissa Menezes Rabelo', 'larissa.rabelo@gmail.com', '83990115566', '1998-03-19'),
(2, 'Daniel Carvalho Lopes', 'daniel.lopes@gmail.com', '83990116677', '1993-07-26'),
(3, 'Natália Guedes Araújo', 'natalia.araujo@gmail.com', '83990117788', '1997-12-02'),
(4, 'Felipe Moraes Teixeira', 'felipe.teixeira@gmail.com', '83990118899', '1984-04-15'),
(5, 'Sabrina Coutinho Bezerra', 'sabrina.bezerra@gmail.com', '83990225566', '1996-10-05');

/* Inserindo dados na tabela Cursos */
INSERT INTO Cursos (id_curso, nome_curso, carga_horaria, disciplinas, horarios, preco)
VALUES
(1, 'Gestão de TI', 60, 'Planejamento, Governança, TI Estratégica', '2025-03-01 18:00:00', 350.00),
(2, 'História do Computador', 40, 'Evolução, Gerações, Marcos Tecnológicos', '2025-03-02 18:00:00', 200.00),
(3, 'HTML, CSS e JavaScript', 80, 'HTML, CSS, JavaScript', '2025-03-03 19:00:00', 500.00),
(4, 'Informática Educativa', 40, 'Tecnologias Educacionais, Práticas Digitais', '2025-03-04 18:00:00', 250.00),
(5, 'Gestão de Projetos e Projeto Interdisciplinar III', 80, 'PMI, Projetos, Integração', '2025-03-26 19:00:00', 580.00);

/* Inserindo dados na tabela Professores */
INSERT INTO Professores (id_professor, nome, email, telefone, especialidade)
VALUES
(100, 'Cefras José Ferreira Mandú de Almeida', 'cefras.jose@gmail.com', '83991112233', 'Banco de Dados'),
(200, 'Jose Ramon da Silva Bezerra', 'jose.ramon@gmail.com', '83992223344', 'Python'),
(600, 'Walney de Negreiros Gomes', 'Walney.Negreiros@gmail.com', '83993334488', 'Programação Java');

/* Inserindo dados na tabela Matriculas */
INSERT INTO Matriculas (id_aluno, id_curso, data_matricula, status)
VALUES
(1, 1, '2025-02-01', 'Ativa'),
(2, 2, '2025-02-02', 'Ativa'),
(3, 3, '2025-02-03', 'Ativa'),
(4, 1, '2025-02-04', 'Ativa'),
(5, 2, '2025-02-05', 'Trancada');

/* Pesquisa 1 - Listar todos os alunos cadastrados */
SELECT id_aluno, nome, email, telefone, data_nascimento
FROM Alunos;

/* Pesquisa 2 - Cursos com carga horária maior que 50 horas */
SELECT nome_curso
FROM Cursos
WHERE carga_horaria > 50;


/* Pesquisa 3 - Alunos com matrícula ativa */
SELECT DISTINCT a.nome
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Ativa';

/* Pesquisa 4 - Alunos com idade menor que 22 anos */
SELECT 
    nome,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM Alunos
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 22;

/* Pesquisa 5 - Aluno e curso em que está matriculado */
SELECT 
    a.nome AS aluno,
    c.nome_curso AS curso
FROM Matriculas m
JOIN Alunos a ON m.id_aluno = a.id_aluno
JOIN Cursos c ON m.id_curso = c.id_curso;


/* Pesquisa 6 - Alunos matriculados no curso Banco de Dados */
SELECT a.nome
FROM Matriculas m
JOIN Alunos a ON m.id_aluno = a.id_aluno
JOIN Cursos c ON m.id_curso = c.id_curso
WHERE c.nome_curso = 'Banco de Dados';
