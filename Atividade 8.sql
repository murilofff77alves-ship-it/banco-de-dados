CREATE DATABASE clinica_medica;

USE clinica_medica;

CREATE TABLE MEDICO (
    id_medico INT,
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE PACIENTE (
    id_paciente INT,
    nome VARCHAR(100),
    cpf VARCHAR(20),
    data_nascimento DATE,
    telefone VARCHAR(20)
);

DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS EXAME;
DROP TABLE IF EXISTS PACIENTE;
DROP TABLE IF EXISTS MEDICO;

CREATE TABLE MEDICO (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    CHECK (especialidade IN ('Cardiologia', 'Dermatologia', 'Ortopedia', 'Pediatria'))
);


CREATE TABLE PACIENTE (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20)
);


CREATE TABLE CONSULTA (
    id_consulta INT PRIMARY KEY,
    data_consulta DATETIME NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    observacoes VARCHAR(255),

    FOREIGN KEY (id_medico) REFERENCES MEDICO(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente)
);


CREATE TABLE EXAME (
    id_exame INT PRIMARY KEY,
    tipo_exame VARCHAR(100) NOT NULL,
    data_exame DATE NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,

    FOREIGN KEY (id_medico) REFERENCES MEDICO(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente)
);
