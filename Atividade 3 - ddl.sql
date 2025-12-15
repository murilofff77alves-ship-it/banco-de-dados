	create database db_escola;
    
	use db_escola;
    
    create table escola(
	id int auto_increment primary key,
	nome varchar(100),
    idade int,
	serie varchar(50)
	
	);

	INSERT INTO escola (id, nome, idade, serie)
	VALUES
	(1, 'Murilo Alves da Silva', 27, 'terceiro_ano'),
	(2, 'Ramon junior da Silva', 46, 'setimo_ano'),
	(3, 'Helena Soares de Oliveira', 42, 'segundo_ano'),
    (4, 'Jose Soares da Silva', 21, 'primeiro_ano'),
	(5, 'Alex da Silva', 23, 'nono_ano');
    
    	select * from escola;
        /Exibir todos os aluns cadastrados/
        
		select nome, idade  from escola; 
        /Exibir apenas nome e idade/
        
		select * from escola  where serie = 'terceiro_ano';
        /Exibir os anos da série terceiro_ano/
        
        UPDATE escola
		SET idade = 28
		WHERE id = 1;
        /atualizar a idade de um aluno/
        
        DELETE FROM escola WHERE id = 1;
		DELETE FROM escola;
		DROP TABLE escola;
        /Excluir um aluno da tabela/
        
        
	create database db_professor;
    
	use db_professor;
    
    create table professor(
	id int auto_increment primary key,
	nome varchar(100),
    idade int,
	turma varchar(50)
	
	);
    
    INSERT INTO professor (id, nome, idade, turma)
	VALUES
	(1, 'Cefras', 23, 'Inf16'),
	(2, 'Thiago', 46, 'inf15'),
	(3, 'Ramon', 23, 'inf14'),
    (4, 'Valney', 40, 'inf13'),
	(5, 'Gabriel', 27, 'inf12');
