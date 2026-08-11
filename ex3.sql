#EXERCÍCIO 3
CREATE TABLE `disciplina`(
    `id` INT PRIMARY KEY,
    `ano_semestre` VARCHAR(255),
    `nome` VARCHAR(255),
    `carga_horaria` INT);

CREATE TABLE `trabalho`(
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR(255),
    `arquivo` BLOB,
    `data_entrega` DATE,
    `nota` FLOAT,
    `id_disciplina` INT,
    FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina`(`id`));

CREATE TABLE `autor`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),    
    `email` VARCHAR(255));

CREATE TABLE `trabalho_autor`(
    `id_trabalho` INT,
    `id_autor` INT,
    PRIMARY KEY (`id_trabalho`, `id_autor`),
    FOREIGN KEY (`id_trabalho`) REFERENCES `trabalho`(`id`),
    FOREIGN KEY (`id_autor`) REFERENCES `autor`(`id`));