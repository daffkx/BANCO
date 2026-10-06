CREATE DATABASE `clinica_veterinaria`;

USE `clinica_veterinaria`;

CREATE TABLE `tutores` (
    `idTutor` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE,
    `telefone` VARCHAR(20),
    `cidade` VARCHAR(50)
);

CREATE TABLE `veterinarios` (
    `idVeterinario` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `crmv` VARCHAR(15) NOT NULL UNIQUE,
    `especialidade` VARCHAR(100) DEFAULT 'Clínico Geral'
);

CREATE TABLE `animais` (
    `idAnimal` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `especie` VARCHAR(50), 
    `raca` VARCHAR(50),
    `dtNascimento` DATE,
    `peso_kg` DECIMAL(5, 2),
    `idTutor_fk` INT,
    `obs` TEXT, 
    FOREIGN KEY (`idTutor_fk`) REFERENCES `tutores`(`idTutor`)
);

CREATE TABLE `consultas` (
    `idConsulta` INT AUTO_INCREMENT PRIMARY KEY,
    `idAnimal_fk` INT,
    `idVeterinario_fk` INT,
    `dtConsulta` DATETIME,
    `motivo` VARCHAR(255),
    `diagnostico` TEXT, 
    `custo` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`idAnimal_fk`) REFERENCES `animais`(`idAnimal`),
    FOREIGN KEY (`idVeterinario_fk`) REFERENCES `veterinarios`(`idVeterinario`)
);

INSERT INTO `tutores` (`nome`, `email`, `telefone`, `cidade`) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98888-1111', 'São Paulo'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 97777-2222', 'Rio de Janeiro'),
('Carla Dias', 'carla.dias@email.com', '(31) 96666-3333', 'Belo Horizonte'),
('Daniel Moreira', 'daniel.moreira@email.com', '(48) 95555-4444', 'Florianópolis'),
('Elisa Fernandes', NULL, '(51) 94444-5555', 'Porto Alegre');

INSERT INTO `veterinarios` (`nome`, `crmv`, `especialidade`) VALUES
('Dr. Ricardo Alves', 'SP-12345', 'Clínico Geral'),
('Dra. Beatriz Lima', 'RJ-54321', 'Cirurgiã'),
('Dr. Mário Sérgio', 'MG-98765', 'Dermatologista'),
('Dra. Lúcia Mendes', 'SP-11223', 'Clínico Geral');

INSERT INTO `animais` (`nome`, `especie`, `raca`, `dtNascimento`, `peso_kg`, `idTutor_fk`, `obs`) VALUES
('Thor', 'Cachorro', 'Labrador', '2022-05-15', 28.50, 1, NULL),
('Mia', 'Gato', 'Siamês', '2021-10-01', 4.20, 2, 'Alérgica a frutos do mar'),
('Loki', 'Cachorro', 'Golden Retriever', '2023-01-20', 25.10, 1, 'Muito agitado'),
('Bolinha', 'Cachorro', 'Pug', '2019-03-10', 8.70, 3, NULL),
('Piu-Piu', 'Ave', 'Canário', '2023-11-30', 0.15, 4, NULL),
('Frajola', 'Gato', 'Persa', '2018-07-25', 5.50, 5, 'Necessita escovação diária'),
('Max', 'Cachorro', 'Pastor Alemão', '2020-02-12', 32.00, 2, 'Cão de guarda'),
('Nemo', 'Peixe', 'Peixe-Palhaço', '2024-01-05', 0.10, 3, NULL),
('Garfield', 'Gato', 'SRD', '2021-04-01', 6.80, 4, 'Come muito');

INSERT INTO `consultas` (`idAnimal_fk`, `idVeterinario_fk`, `dtConsulta`, `motivo`, `diagnostico`, `custo`) VALUES
(1, 1, '2025-01-10 10:30:00', 'Check-up anual', 'Saudável', 150.00),
(2, 2, '2025-01-12 14:00:00', 'Vacina V5', 'Aplicação de vacina', 80.00),
(4, 1, '2025-02-05 09:15:00', 'Problema de pele', 'Dermatite alérgica', 180.00),
(3, 3, '2025-02-15 11:00:00', 'Coceira intensa', 'Dermatite (tratamento iniciado)', 200.00),
(1, 1, '2025-03-20 16:00:00', 'Vômito', 'Gastroenterite leve', 220.00),
(5, 4, '2025-04-01 10:00:00', 'Asa machucada', NULL, 100.00),
(7, 2, '2025-04-10 12:00:00', 'Check-up e vacina', 'Saudável, vacina anti-rábica aplicada', 190.00),
(2, 1, '2025-05-05 15:30:00', 'Espirros', 'Rinotraqueíte felina', 170.00),
(6, 3, '2025-05-15 08:30:00', 'Consulta dermatológica', 'Revisão da dermatite', 120.00);

-- SELECT
--      `nome` AS 'Nome do Produto'
--      `fabricante` AS 'Marca
--      `dtcadastro` AS 'Data de Cadastro'
-- FROM `produtos`;

-- SELECT `nome`, `preco`
-- FROM `produtos` ORDER BY `nome` ASC;

-- SELECT
--      `nome` AS `Nome`
--      `preco` AS `Preço`
-- FROM `produtos` ORDER BY `preco` DESC;

-- LIKE
-- SELECT * FROM `produtos` WHERE `nome` LIKE 'laptop%';

-- BETWEEN
-- SELECT * FROM `produtos` WHERE `estoque` BETWEEN 15 AND 30 ORDER BY `estoque`;

-- INNER JOIN
-- SELECT 
--      `A`.`nome` AS 'Animal',
--      `T`.`nome` AS 'Tutor',
--      `T`.`cidade` AS 'Cidade'
-- FROM
--      `Animais` AS `A`      
-- INNER JOIN
--      `Tutores` AS `T` ON A.idTutor_fk = T.idTutor
Exercícios com LEFT JOIN
5. Listar TODOS os Produtos
O LEFT JOIN garante que todos os produtos apareçam, mesmo que algum deles não tenha categoria.

SELECT 
    p.nome AS produto,
    c.nome AS categoria
FROM produtos p
LEFT JOIN categorias c
    ON p.idCategoria_fk = c.idCategoria;

Com os dados atuais, todos os produtos possuem categoria.

6. Encontrar Produtos SEM Categoria
Aqui usamos LEFT JOIN e filtramos os registros em que a categoria não foi encontrada.

SELECT 
    p.nome AS produto
FROM produtos p
LEFT JOIN categorias c
    ON p.idCategoria_fk = c.idCategoria
WHERE p.idCategoria_fk IS NULL;

Resultado com o script atual: nenhum registro, pois todos os produtos possuem uma categoria.

Exercícios com RIGHT JOIN
7. Listar TODAS as Categorias
Como o foco é garantir que todas as categorias apareçam, mesmo aquelas sem produtos, podemos colocar categorias à direita do RIGHT JOIN.

SELECT 
    c.nome AS categoria,
    p.nome AS produto
FROM produtos p
RIGHT JOIN categorias c
    ON p.idCategoria_fk = c.idCategoria;

Se existir uma categoria sem produtos, ela aparecerá com NULL na coluna produto.

8. Encontrar Categorias VAZIAS
SELECT 
    c.nome AS categoria
FROM produtos p
RIGHT JOIN categorias c
    ON p.idCategoria_fk = c.idCategoria
WHERE p.idProduto IS NULL;

------------------------------------
-- EXERCÍCIOS DE SELEÇÃO DE DADOS --
------------------------------------

-- EXE1 ---------

SELECT *
FROM `animais`;

-- EXE2 ---------

SELECT `nome`, `email`, `cidade`
FROM `tutores`;

-- EXE3 ---------

SELECT `nome`, `especialidade`
FROM `veterinarios`;

-- EXE4 ---------

SELECT `motivo`, `custo`
FROM `consultas`;

-- EXE5 ---------

SELECT *
FROM `animais`
WHERE `especie` = 'gato';

-- EXE6 ---------

SELECT `nome`, `peso_kg`
FROM `animais`
WHERE `peso_kg` > 20

-- EXE7 ---------

SELECT *
FROM `consultas`
WHERE `custo` = 150.00;

-- EXE8 ---------

SELECT `nome`, `dtNascimento`
FROM `animais`
WHERE `dtNascimento` >= '2022-01-01';

-- EXE9 ---------

SELECT `nome`, `raca`
FROM `animais`
WHERE `raca` <> 'labrador';

-- EXE10 ---------

SELECT *
FROM `animais`
WHERE `especie` = 'cachorro' 
AND `peso_kg` < 10;

-- EXE11 ---------

SELECT *
FROM `consultas`
WHERE `dtConsulta` >= '2025-01-01'
AND `dtConsultas` < '2026-01-01'
AND `custo` > 100.00;

-- EXE12 ---------

SELECT *
FROM `animais` 
WHERE `especie` = `cachorro`
OR `especie` = 'gato';

-- EXE13 ---------

SELECT *
FROM `tutores`
WHERE `cidade` = 'são paulo'
OR `cidade` = 'rio de janeiro';

-- EXE14 ---------

SELECT * 
FROM `animais`
WHERE `especie` = 'cachorro'
AND `peso_kg` > 30
OR `especie` = 'gato'
AND `peso_kg` < 5;

-- EXE15 ---------

SELECT `nome`, `telefone`
FROM `tutores`
WHERE `nome` LIKE 'A%';

-- EXE16 ---------

SELECT `nome`, `raca`
FROM `animais`
WHERE `raca` = '%retriever%';

-- EXE17 ---------

SELECT `nome`, `email`, `cidade` 
FROM `tutores`
WHERE `cidade`IN ('Belo Horizonte', 'Florianópolis', 'Porto Alegre');

-- EXE18 ---------

SELECT `idAnimal_fk`, `custo`
FROM `consultas`
WHERE `custo` BETWEEN 100.00 AND 200.00; 

-- EXE19 ---------

SELECT *
FROM `animais`
WHERE `obs` IS NULL;

-- EXE20 ---------

SELECT *
FROM `consultas`
WHERE `diagnostico` IS NOT NULL;