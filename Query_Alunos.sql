CREATE TABLE turma (
    id_turma INT PRIMARY KEY,
    codigo_turma VARCHAR(50),
    nome_turma VARCHAR(255)
);
SELECT * FROM TURMA

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(255),
    aluno_alocado BOOLEAN,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);
SELECT * FROM aluno


INSERT INTO turma (id_turma, codigo_turma, nome_turma) VALUES
    (1, 'T001', 'Português'),
    (2, 'T002', 'Matemática');
SELECT * FROM turma

INSERT INTO aluno (id_aluno, nome_aluno, aluno_alocado, id_turma) VALUES
    (1, 'Juliana', NULL,1),
    (2, 'Conrado', NULL,2);
SELECT * FROM aluno

INSERT INTO aluno (id_aluno, nome_aluno, aluno_alocado, id_turma) VALUES
    (3, 'Gabriela', NULL,NULL),
    (4, 'Gregório', NULL,NULL);
SELECT * FROM aluno

UPDATE aluno
SET aluno_alocado = CASE
    WHEN id_turma IS NOT NULL THEN TRUE
    ELSE FALSE
END;
SELECT * FROM aluno
