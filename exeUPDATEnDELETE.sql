CREATE TABLE  `cliente` (
    `cpf` CHAR(14) PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `telefone` BIGINT NOT NULL
);
INSERT INTO cliente (cpf, nome, telefone) VALUES
('111.111.111-11', 'Ana Carolina Souza', 48991234567),
('222.222.222-22', 'Bruno Costa', 47988765432),
('333.333.333-33', 'Ana Clara Ferreira', 48999998888),
('444.444.444-44', 'Carlos de Souza', 51981817171),
('555.555.555-55', 'Cliente Teste Antigo', 99999999999);



DELETE FROM `cliente` WHERE #usar esse
`cpf` = '111.111.111-11';

DELETE FROM `cliente`
WHERE `nome` LIKE 'ANA %';

UPDATE `cliente` 
SET `telefone` = '4799981234'
WHERE `cpf` = '222.222.222-22';

UPDATE `cliente`
SET `nome` = 'Ricardo Silva', `telefone` = '4899991234'
WHERE `cpf` = '555.555.555-55';

# --------------------------------------- #
# EXERCÍCIOS DE DELETAR E ATUALIZAR DADOS #
# --------------------------------------- #

#EXE1 ---------

UPDATE `cliente` 
SET `telefone` = '48998765432'
WHERE `cpf` = '111.111.111-11';

#EXE2 ---------

UPDATE `empregado` 
SET `cargo` = 'Desenvolvedor Sênior'
WHERE `cpf` = '333.333.333-33';

#EXE3 ---------

DELETE FROM `cliente` 
WHERE `cpf` = '555.555.555-55';

#EXE4 ---------

UPDATE `projeto`
SET `preco` = `preco` * 1.10

#EXE5 ---------

DELETE `projeEmp` 
WHERE `cpfEmpregado` = '333.333.333-33' AND `codProj` = 2 

#EXE6 ---------

UPDATE  