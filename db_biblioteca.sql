create database db_biblioteca;

use db_biblioteca;

create table livros(
id int auto_increment primary key,
titulo varchar(100),
autor varchar(50),
ano_publicacao int
);

INSERT INTO livros (id, titulo, autor, ano_publicacao)
VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 1899),
(2, 'O Alienista', 'Machado de Assis', 1882),
(3, 'Memórias Póstumas de Brás cubas', 'Machado de Assis', 1881),
(4, 'Capitães da Areia', 'Jorge Amado', 1937);

select * from livros;

select titulo, autor from livros;

select * from livros  where autor = 'Machado de Assis';

SET SQL_SAFE_UPDATES = 0;

UPDATE livros
SET ano_publicacao = 1938
WHERE titulo = 'Capitães da Areia';

select * from livros;
