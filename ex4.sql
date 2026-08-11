#EXERCÍCIO 4
CREATE TABLE `foto`(
    `id` INT PRIMARY KEY,
    `arquivo` BLOB,
    `formato` VARCHAR(255),
    `id_usuario` INT,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id`));

CREATE TABLE `usuario`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `cidade` VARCHAR(255),
    `idade` INT,
    `sexo` CHAR(1)
    `ctg_preferido` VARCHAR(255));

CREATE TABLE `avaliacao_foto_usuario`(
    `id_foto` INT,
    `id_usuario` INT,
    `avaliacao` FLOAT,
    PRIMARY KEY (`id_foto`, `id_usuario`),
    FOREIGN KEY (`id_foto`) REFERENCES `foto`(`id`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id`));