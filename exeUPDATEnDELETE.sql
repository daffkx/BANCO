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
  `cpfEmpregado` CHAR(14) NOT NULL,
  `codProj` INT NOT NULL,
  `hrTrab` INT NOT NULL,
  PRIMARY KEY (`cpfEmpregado`, `codProj`),
  FOREIGN KEY (`cpfEmpregado`) REFERENCES `empregado`(`cpf`),
  FOREIGN KEY (`codProj`) REFERENCES `projeto`(`codProj`)
);

INSERT INTO cliente (nome, cpf, telefone) VALUES 
('João da Silva','111.111.111-11','48991234567'),
('Maria Oliveira','222.222.222-22','48997654321'),
('Pedro Gomes','555.555.555-55','48999887766'),
('Fernanda Lima','777.777.777-77','48991231231');

INSERT INTO empregado (nome, cpf, cargo) VALUES 
('Carlos Pereira','333.333.333-33','Analista de Sistemas'),
('Ana Souza','444.444.444-44','Gerente de Projetos'),
('Lucas Andrade','666.666.666-66','Desenvolvedor Backend');

INSERT INTO projeto (nome, descricao, preco, dtFim, dtEstimada, dtSolicitacao, cpfGerente, cpfCliente) VALUES
('Sistema de Vendas','Plataforma para e-commerce','15000.00','2025-12-01','2025-11-15','2025-09-10','444.444.444-44','111.111.111-11'),
('Aplicativo Financeiro','Gestão de despesas pessoais','12000.00','2025-10-30','2025-10-20','2025-09-12','444.444.444-44','222.222.222-22'),
('Site Institucional','Página para empresa local','5000.00','2025-11-01','2025-10-25','2025-09-20','444.444.444-44','555.555.555-55'),
('Controle de Estoque','Sistema para loja de roupas','8000.00','2025-12-20','2025-12-05','2025-09-25','444.444.444-44','777.777.777-77');

INSERT INTO projEmp (cpfEmpregado, codProj, hrTrab) VALUES
('333.333.333-33', 1, 40),
('444.444.444-44', 1, 20),
('333.333.333-33', 2, 35),
('666.666.666-66', 3, 50);

------------------------------------------------
-- EXERCÍCIOS SOBRE DELETAR E ATUALIZAR DADOS --
------------------------------------------------

-- EXE1 ---------

UPDATE `cliente` 
SET `telefone` = '48998765432'
WHERE `cpf` = '111.111.111-11';

-- EXE2 ---------

UPDATE `empregado` 
SET `cargo` = 'Desenvolvedor Sênior'
WHERE `cpf` = '333.333.333-33';

-- EXE3 ---------

DELETE FROM `cliente` 
WHERE `cpf` = '555.555.555-55';

-- EXE4 ---------

UPDATE `projeto`
SET `preco` = `preco` * 1.10;

-- EXE5 ---------

DELETE FROM `projEmp` 
WHERE `cpfEmpregado` = '333.333.333-33' AND `codProj` = 2;

-- EXE6 --------- 

UPDATE `projeto`
SET `descricao` = CONCAT('PROJETO LEGADO - ', `descricao`) -- concat = juntar strings
WHERE `dtSolicitacao` < '2025-09-15';

-- EXE7 ---------

UPDATE `projEmp`
SET `hrTrab` = `hrTrab` + 15
WHERE `cpfEmpregado` = '666.666.666-66' AND `codProj` = 3;

-- EXE8 ---------

DELETE FROM `projeto`
WHERE `preco` < 6000;

-- EXE9 ---------

UPDATE `projeto`
SET `dtEstimada` = DATE_ADD(`dtEstimada`, INTERVAL 7 DAY) -- date_add = soma dias/meses/anos a uma data
WHERE `cpfGerente` = '444.444.444-44';

-- EXE10 ---------

INSERT INTO `empregado` (nome, cpf, cargo)
VALUES ('Teste Empregado','999.999.999-99','Estagiário');

DELETE FROM `empregado`
WHERE `cpf` = '999.999.999-99';

-- EXE11 ---------

UPDATE `empregado`
SET `cargo` = 'Gerente de Projetos'
WHERE `cpf` = '333.333.333-33';

UPDATE `projeto`
SET `cpfGerente` = '333.333.333-33'
WHERE `cpfCliente` = '222.222.222-22';

-- EXE12 ---------

DELETE FROM `projeto`
WHERE `dtFim` < CURDATE() -- curdate() = retorna a data atual do sistema
  AND `cpfCliente` <> '111.111.111-11';