#EXEMPLOS
CREATE TABLE `departamento`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255));
    
CREATE TABLE `pessoa`(
    `id` INT,
    `nome` VARCHAR(255),
    CONSTRAINT `pessoa_pk` PRIMARY KEY (`id`));

CREATE TABLE `empregado`(
    `id` INT PRIMARY KEY,
    `nome`VARCHAR(255),
    `id_depto` INT, 
    FOREIGN KEY (`id_depto`) REFERENCES `departamento`(`id`));

//////////////////////////////
    
#EXERCÍCIO 1
CREATE TABLE `grupo`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `grau_importancia` CHAR(1));

CREATE TABLE `contato`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `ocupacao` VARCHAR(255),
    `email` VARCHAR(255),
    `endereco` VARCHAR(255),
    `id_grupo` INT,
    FOREIGN KEY (`id_grupo`) REFERENCES `grupo`(`id`));

CREATE TABLE `telefone`(
    `id` INT PRIMARY KEY,
    `rotulo` VARCHAR(255),
    `numero` INT,
    `id_contato` INT, 
    FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id`));