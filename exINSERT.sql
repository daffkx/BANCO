CREATE DATABASE `empresa`;

USE `empresa`;

CREATE TABLE `cliente` (
 `cpf` CHAR(14) PRIMARY KEY,
 `nome` VARCHAR(100) NOT NULL,
 `telefone` BIGINT NOT NULL
);

CREATE TABLE `empregado` (
 `cpf` CHAR(14) PRIMARY KEY,
 `nome` VARCHAR(100) NOT NULL,
 `cargo` VARCHAR(100) NOT NULL
);

CREATE TABLE `projeto` (
 `codProj` INT PRIMARY KEY AUTO_INCREMENT,
 `nome` VARCHAR(100) NOT NULL,
 `descricao` VARCHAR(100) NOT NULL,
 `preco` DECIMAL(10,2) NOT NULL,
 `dtFim` DATE NOT NULL,
 `dtEstimada` DATE NOT NULL,
 `dtSolicitacao` DATE NOT NULL,
 `cpfGerente` CHAR(14) NOT NULL,
 `cpfCliente` CHAR(14) NOT NULL,
 FOREIGN KEY (`cpfCliente`) REFERENCES `cliente`(`cpf`),
 FOREIGN KEY (`cpfGerente`) REFERENCES `empregado`(`cpf`)
);

CREATE TABLE `projEmp` (
 `codProj` INT,
 `cpfEmpregado` CHAR(14),
 `hrTrab` FLOAT
);

ALTER TABLE `projEmp` 
ADD CONSTRAINT PRIMARY KEY (`codProj`, `cpfEmpregado`);
ALTER TABLE `projEmp` 
ADD CONSTRAINT FOREIGN KEY (`cpfEmpregado`) REFERENCES `empregado`(`cpf`);
ALTER TABLE `projEmp` 
ADD CONSTRAINT FOREIGN KEY (`codProj`) REFERENCES `projeto`(`codProj`);

# ------------------------------- #
# EXERCÍCIOS DE INSERÇÃO DE DADOS #
# ------------------------------- #

#EX1 ---------
USE `empresa`;

INSERT INTO `cliente` (`nome`,`cpf`,`telefone`)
VALUES ('João da Silva','111.111.111-11','48991234567');

#EX2 ---------
USE `empresa`;

INSERT INTO `cliente` (`nome`,`cpf`,`telefone`)
VALUES ('Maria Oliveira','222.222.222-22','48997654321');

#EX3 ---------
USE `empresa`;

INSERT INTO `empregado` (`nome`,`cpf`,`cargo`)
VALUES ('Carlos Pereira','333.333.333-33','Analista de Sistemas');

#EX4 ---------
USE `empresa`;

INSERT INTO `empregado` (`nome`,`cpf`,`cargo`)
VALUES ('Ana Souza','444.444.444-44','Gerente de Projetos');

#EX5 ---------
USE `empresa`;

INSERT INTO `projeto` (`nome`,`descricao`,`preco`,`dtFim`,`dtEstimada`,`dtSolicitacao`,`cpfGerente`,`cpfCliente`)
VALUES ('Sistema de Vendas','Plataforma para e-commerce','15000.00','2025-12-01','2025-11-15','2025-09-10','444.444.444-44','111.111.111-11');

#EX6 ---------
USE `empresa`;

INSERT INTO `projeto` (`nome`,`descricao`,`preco`,`dtFim`,`dtEstimada`,`dtSolicitacao`,`cpfGerente`,`cpfCliente`)
VALUES ('Aplicativo Financeiro','Gestão de despesas pessoais','12000.00','2025-10-30','2025-10-20','2025-09-12','444.444.444-44','222.222.222-22');

#EX7 ---------
USE `empresa`;

INSERT INTO `projEmp` (`cpfEmpregado`, `codProj`,`hrTrab`)
VALUES ('333.333.333-33', '1', '40');

#EX8 ---------
USE `empresa`;

INSERT INTO `projEmp` (`cpfEmpregado`, `codProj`,`hrTrab`)
VALUES ('444.444.444-44', '1', '20');

#EX9 ---------
USE `empresa`;

INSERT INTO `projEmp` (`cpfEmpregado`, `codProj`,`hrTrab`)
VALUES ('333.333.333-33', '2', '35');

#EX10 ---------
USE `empresa`;

INSERT INTO `cliente` (`nome`,`cpf`,`telefone`)
VALUES ('Pedro Gomes','555.555.555-55','48999887766');

#EX11 ---------
USE `empresa`;

INSERT INTO `empregado` (`nome`,`cpf`,`cargo`)
VALUES ('Lucas Andrade','666.666.666-66','Desenvolvedor Backend');

#EX12 ---------
USE `empresa`;

INSERT INTO `projeto` (`nome`,`descricao`,`preco`,`dtFim`,`dtEstimada`,`dtSolicitacao`,`cpfGerente`,`cpfCliente`)
VALUES ('Site Institucional','Página para empresa local','5000.00','2025-11-01','2025-10-25','2025-09-20','444.444.444-44','555.555.555-55');

#EX13 ---------
USE `empresa`;

INSERT INTO `projEmp` (`cpfEmpregado`, `codProj`,`hrTrab`)
VALUES ('666.666.666-66', '3', '50');

#EX14 ---------
USE `empresa`;

INSERT INTO `cliente` (`nome`,`cpf`,`telefone`)
VALUES ('Fernanda Lima','777.777.777-77','48991231231');

#EX15 ---------
USE `empresa`;

INSERT INTO `projeto` (`nome`,`descricao`,`preco`,`dtFim`,`dtEstimada`,`dtSolicitacao`,`cpfGerente`,`cpfCliente`)
VALUES ('Controle de Estoque','Sistema para loja de roupas','8000.00','2025-12-20','2025-12-05','2025-09-25','444.444.444-44','777.777.777-77');