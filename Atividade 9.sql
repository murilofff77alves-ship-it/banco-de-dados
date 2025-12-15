create database clinicaMedicaDB;
USE clinicaMedicaDB;

create table medico (
	CRM VARCHAR(10) primary key,
    NOME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    TELEFONE VARCHAR(15) UNIQUE,
    DATA_NASC DATE,
    ESPECIALIZACAO VARCHAR(25)
);

create table paciente (
	ID INT primary key,
    CPF VARCHAR(15) UNIQUE,
    NOME VARCHAR(100),
    ENDERECO VARCHAR(75),
    TELEFONE VARCHAR(15) UNIQUE,
    TIPO_EXAME VARCHAR(25)
);

create table CONSULTA (
	ID_MEDICO VARCHAR(10) NOT NULL,
	ID_PACIENTE INT NOT NULL,
    DATA_CONSULT DATE NOT NULL,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20),
    foreign key (ID_MEDICO) REFERENCES MEDICO(CRM),
    foreign key (ID_PACIENTE) REFERENCES PACIENTE(ID)
);

create table EXAME (
	ID_MEDICO VARCHAR(10) NOT NULL,
	ID_PACIENTE INT NOT NULL,
    DATA_EXAME DATE,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20),
    TIPO_EXAME VARCHAR(50),
    foreign key (ID_MEDICO) REFERENCES MEDICO(CRM),
    foreign key (ID_PACIENTE) REFERENCES PACIENTE(ID)
);

INSERT INTO medico (CRM, NOME, EMAIL, TELEFONE, DATA_NASC, ESPECIALIZACAO)
VALUES
('123456-PB', 'Murilo Alves da Silva', 'Murilo.alves@clinica.com', '83991234567', '1982-04-15', 'Cardiologia'),
('234567-PB', 'Maria Jose da Silva', 'maria.jose@clinica.com', '83999887766', '1978-11-02', 'Ortopedia'),
('345678-PB', 'Jose Soares da Silva', 'jose.soares@clinica.com', '83998765432', '1990-07-21', 'Pediatria'),
('456789-PB', 'Ramon ferreira da Silva', 'ramon.ferreira@clinica.com', '83998112233', '1985-02-10', 'Dermatologia'),
('567890-PB', 'David Ruan Ferreira da Silva', 'david.ruan@clinica.com', '83999665544', '1993-09-30', 'Ginecologia');


INSERT INTO paciente (ID, CPF, NOME, ENDERECO, TELEFONE, TIPO_EXAME)
VALUES

(1, '123.456.789-01', 'Murilo Alves da Silva', 'Rua das Flores, 120 - Centro', '83991234567', 'Raio-X'),
(2, '234.567.890-12', 'Jose Soares da Silva', 'Av. Brasil, 455 - Catolé', '83999887766', 'Hemograma'),
(3, '345.678.901-23', 'Ramon ferreira da Silva', 'Rua São Pedro, 77 - Bodocongó', '83998765432', 'Ultrassom'),
(4, '456.789.012-34', 'Maria Jose da Silva', 'Rua João Pessoa, 310 - Centro', '83998123456', 'Tomografia'),
(5, '012.345.678-90', 'David Ruan Ferreira da Silva', 'Rua Acre, 60 - Velame', '83998223344', 'Tomografia');


UPDATE paciente
SET TELEFONE = '83999999999'
WHERE ID = 2;

SELECT * FROM paciente;

SELECT NOME, ESPECIALIZACAO
FROM medico;
ALTER TABLE consulta ADD ID INT AUTO_INCREMENT PRIMARY KEY;

SELECT *
FROM consulta
WHERE ID = 1;

ALTER TABLE paciente ADD DATA_NASC DATE;

SELECT *
FROM paciente
WHERE DATA_NASC > '2000-01-01';

SELECT *
FROM medico
WHERE ESPECIALIZACAO = 'Cardiologia';
