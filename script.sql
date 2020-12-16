
CREATE TABLE aluno (
id SERIAL,
nome VARCHAR (255),
cpf CHAR (11),
observacao TEXT,
idade INTEGER,
dinheiro NUMERIC (10,2),
altura real,
ativo BOOLEAN,
data_nascimento DATE,
hora_aula TIME,
matriculado_em TIMESTAMP
);

DROP TABLE aluno;

SELECT * FROM aluno;

INSERT INTO aluno(
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em

    )
    VALUES ('Diogo',
            '35107781896',
            'Lalalalalalal',
            32,
            100.50,
            1.65,
            TRUE,
            '1988-01-26',
            '17:30:00',
            '2020-12-01 18:28:00'
    );

UPDATE aluno
SET nome = 'Daniele',
    cpf = '35272352807',
    observacao ='Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.85,
    ativo = FALSE,
    data_nascimento = '1985-10-10',
    hora_aula = '18:49:00',
   matriculado_em = '2020-12-02 19:00:00'
    WHERE id = 1;

SELECT * FROM aluno
WHERE nome = 'Daniele';

DELETE FROM aluno
WHERE nome = 'Daniele';

SELECT nome AS "Nome do Aluno", idade, matriculado_em AS quando_se_matriculou FROM aluno;

INSERT INTO aluno (nome) VALUES ('Vinicius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('Joao Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

SELECT * FROM aluno
WHERE nome <> 'Diogo';

SELECT * FROM aluno
WHERE cpf IS NOT NULL;

SELECT * FROM aluno
WHERE idade BETWEEN 10 AND 35;

SELECT * FROM aluno
WHERE ativo IS NULL;

SELECT * FROM aluno
WHERE nome LIKE 'D%'
AND cpf IS NOT NULL;

SELECT * FROM aluno
WHERE nome LIKE 'Diogo'
OR nome LIKE 'Rodrigo'
OR nome LIKE 'Nico%';

DROP TABLE curso;

CREATE TABLE curso(
    id INTEGER PRIMARY KEY ,
    nome VARCHAR (255)
);


INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;

SELECT * FROM aluno;

CREATE TABLE aluno(
  id SERIAL PRIMARY KEY,
  nome varchar (255)

);


DROP TABLE aluno;

INSERT INTO aluno (nome) VALUES ('Vinicius');
INSERT INTO aluno (nome) VALUES ('Diogo');

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id) REFERENCES aluno(id)
    ON DELETE CASCADE,

    FOREIGN KEY (curso_id) REFERENCES curso(id)

);

INSERT INTO  aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO  aluno_curso (aluno_id, curso_id) VALUES (2,1);

SELECT * FROM aluno_curso;

SELECT * FROM aluno;
SELECT * FROM curso;

SELECT * FROM aluno JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
                    JOIN curso ON curso.id = aluno_curso.curso_id;

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

INSERT INTO aluno (nome) VALUES ('Nico');
INSERT INTO curso (id, nome) VALUES (3,'CSS');

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
        FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
        FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
        FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
        FROM aluno
CROSS JOIN curso;

SELECT * FROM  aluno;
SELECT * FROM  aluno_curso;
SELECT * FROM curso;

DROP TABLE funcionarios;

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR (10),
    nome VARCHAR (255),
    sobrenome VARCHAR (255)
);

INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M001','Diogo','Mascarenhas');
INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M002','Vinicius','Dias');
INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M003','Nico','Steppat');
INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M004','João','Roberto');
INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M005','Diogo','Mascarenhas');
INSERT INTO funcionarios(matricula, nome, sobrenome) VALUES ('M006','Alberto','Martins');

SELECT * FROM funcionarios
ORDER BY nome, matricula DESC;

SELECT * FROM funcionarios ORDER BY nome LIMIT 5;

SELECT COUNT (id),
SUM (id),
MAX (id),
MIN (id),
AVG (id)
FROM funcionarios;

SELECT nome,sobrenome, COUNT (*) FROM funcionarios GROUP BY 1, 2 ORDER BY nome;

SELECT curso.nome,
       COUNT (aluno.id)
       FROM aluno
        JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
        JOIN curso ON curso.id = aluno_curso.curso_id
        GROUP BY 1
        ORDER BY 1

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * from curso;

SELECT curso.nome,
       COUNT (aluno.id)
FROM curso
LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
--WHERE curso.nome = 'Javascript'
GROUP BY 1
HAVING COUNT (aluno.id) > 0

DROP TABLE aluno_curso, curso;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    primeiro_nome VARCHAR (255) NOT NULL,
    ultimo_nome VARCHAR (255) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (255) NOT NULL,
    categoria_id INTEGER NOT NULL REFERENCES categoria (id)
);

CREATE TABLE categoria(
    id SERIAL PRIMARY KEY ,
    nome VARCHAR (255) NOT NULL );

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Vinicius', 'Dias', '1997-10-15'),
('Patricia', 'Freitas', '1986-10-25'), ('Diogo', 'Oliveira', '1984-08-27'), ('Maria', 'Rosa', '1985-01-01');

INSERT INTO categoria (nome) VALUES ('Front-end'), ('Programação'), ('Banco de Dados'), ('Data Science');

INSERT INTO curso (nome, categoria_id) VALUES
('HTML', 1),
('CSS', 1),
('JS', 1),
('PHP', 2),
('Java', 2),
('C++', 2),
('PostgreSQL', 3),
('MySQL', 3),
('Oracle', 3),
('SQL Server', 3),
('SQLite', 3),
('Pandas', 4),
('Machine Learning', 4),
('Power BI', 4);

INSERT INTO aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);

SELECT aluno.primeiro_nome,
       aluno.ultimo_nome,
       COUNT (aluno_curso.curso_id) numero_cursos
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY aluno.primeiro_nome, aluno.ultimo_nome
ORDER BY numero_cursos DESC;

SELECT curso.nome,
       COUNT (aluno_curso.aluno_id) numero_alunos
FROM curso
JOIN aluno_curso ON aluno_curso.curso_id = curso_id
GROUP BY curso.nome
ORDER BY numero_alunos DESC ;


SELECT * FROM curso;
SELECT * FROM categoria;
SELECT * FROM aluno_curso;

SELECT * FROM curso;
SELECT * FROM categoria;




SELECT curso.nome FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome NOT LIKE '% %');


SELECT * FROM aluno;

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
      EXTRACT(YEAR FROM AGE (data_nascimento)) AS idade
    FROM aluno;

SELECT @ 1723482814;

SELECT TO_CHAR (NOW(), 'DD/MM/YYYY');

CREATE VIEW vw_cursos_por_categoria AS SELECT categoria.nome AS categoria,
    COUNT (curso.id) AS numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
    GROUP BY categoria

SELECT * FROM vw_cursos_por_categoria;

CREATE VIEW vw_cursos_programacao AS SELECT nome FROM curso WHERE categoria_id = 2;
SELECT * FROM vw_cursos_programacao;
SELECT * FROM vw_cursos_programacao WHERE nome = 'PHP';










