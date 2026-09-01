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

DELETE FROM `projEmp`
WHERE `codProj` = 3;

DELETE FROM `projeto`
WHERE `cpfCliente` = '555.555.555-55';

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

INSERT INTO `empregado` (`nome`, `cpf`, `cargo`)
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