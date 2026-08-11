#EXERCÍCIO 2
CREATE TABLE `cantor`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255));

CREATE TABLE `musica`(
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR(255),
    `letra` TEXT);

CREATE TABLE `gravacao`(
    `id` INT PRIMARY KEY,
    `duracao` INT,
    `id_cantor` INT,
    `id_musica` INT,
    FOREIGN KEY (`id_cantor`) REFERENCES `cantor`(`id`),
    FOREIGN KEY (`id_musica`) REFERENCES `musica`(`id`));

CREATE TABLE `compositor`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255));

CREATE TABLE `musica_compositor`(
    `id_musica` INT,
    `id_compositor` INT,
    PRIMARY KEY (`id_musica`, `id_compositor`),
    FOREIGN KEY (`id_musica`) REFERENCES `musica`(`id`),
    FOREIGN KEY (`id_compositor`) REFERENCES `compositor`(`id`));
