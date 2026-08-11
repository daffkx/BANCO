#EXERCÍCIO 1
CREATE DATABASE `prog_contato`;

USE `prog_contato`;

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
    `numero` VARCHAR(255),
    `id_contato` INT, 
    FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id`));