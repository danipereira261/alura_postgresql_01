
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


