CREATE TABLE tbl_cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL
);

CREATE TABLE tbl_professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE tbl_materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES tbl_professores(id_professor)
);

CREATE TABLE tbl_alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(10) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(50),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES tbl_cursos(id_curso)
);

CREATE TABLE tbl_turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    semestre VARCHAR(6) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES tbl_cursos(id_curso)
);

CREATE TABLE tbl_notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_materia INT,
    semestre VARCHAR(6) NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    situacao VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES tbl_alunos(id_aluno),
    FOREIGN KEY (id_materia) REFERENCES tbl_materias(id_materia)
);
