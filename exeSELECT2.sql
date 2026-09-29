CREATE TABLE `Tutores` (
    `idTutor` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE,
    `telefone` VARCHAR(20),
    `cidade` VARCHAR(50)
);

CREATE TABLE `Veterinarios` (
    `idVeterinario` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `crmv` VARCHAR(15) NOT NULL UNIQUE,
    `especialidade` VARCHAR(100) DEFAULT 'Clínico Geral'
);

CREATE TABLE `Animais` (
    `idAnimal` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `especie` VARCHAR(50), 
    `raca` VARCHAR(50),
    `dtNascimento` DATE,
    `peso_kg` DECIMAL(5, 2),
    `idTutor_fk` INT,
    `obs` TEXT, 
    FOREIGN KEY (`idTutor_fk`) REFERENCES `Tutores`(`idTutor`)
);

CREATE TABLE `Consultas` (
    `idConsulta` INT AUTO_INCREMENT PRIMARY KEY,
    `idAnimal_fk` INT,
    `idVeterinario_fk` INT,
    `dtConsulta` DATETIME,
    `motivo` VARCHAR(255),
    `diagnostico` TEXT, 
    `custo` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`idAnimal_fk`) REFERENCES `Animais`(`idAnimal`),
    FOREIGN KEY (`idVeterinario_fk`) REFERENCES `Veterinarios`(`idVeterinario`)
);

INSERT INTO `Tutores` (`nome`, `email`, `telefone`, `cidade`) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98888-1111', 'São Paulo'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 97777-2222', 'Rio de Janeiro'),
('Carla Dias', 'carla.dias@email.com', '(31) 96666-3333', 'Belo Horizonte'),
('Daniel Moreira', 'daniel.moreira@email.com', '(48) 95555-4444', 'Florianópolis'),
('Elisa Fernandes', NULL, '(51) 94444-5555', 'Porto Alegre');

INSERT INTO `Veterinarios` (`nome`, `crmv`, `especialidade`) VALUES
('Dr. Ricardo Alves', 'SP-12345', 'Clínico Geral'),
('Dra. Beatriz Lima', 'RJ-54321', 'Cirurgiã'),
('Dr. Mário Sérgio', 'MG-98765', 'Dermatologista'),
('Dra. Lúcia Mendes', 'SP-11223', 'Clínico Geral');

INSERT INTO `Animais` (`nome`, `especie`, `raca`, `dtNascimento`, `peso_kg`, `idTutor_fk`, `obs`) VALUES
('Thor', 'Cachorro', 'Labrador', '2022-05-15', 28.50, 1, NULL),
('Mia', 'Gato', 'Siamês', '2021-10-01', 4.20, 2, 'Alérgica a frutos do mar'),
('Loki', 'Cachorro', 'Golden Retriever', '2023-01-20', 25.10, 1, 'Muito agitado'),
('Bolinha', 'Cachorro', 'Pug', '2019-03-10', 8.70, 3, NULL),
('Piu-Piu', 'Ave', 'Canário', '2023-11-30', 0.15, 4, NULL),
('Frajola', 'Gato', 'Persa', '2018-07-25', 5.50, 5, 'Necessita escovação diária'),
('Max', 'Cachorro', 'Pastor Alemão', '2020-02-12', 32.00, 2, 'Cão de guarda'),
('Nemo', 'Peixe', 'Peixe-Palhaço', '2024-01-05', 0.10, 3, NULL),
('Garfield', 'Gato', 'SRD', '2021-04-01', 6.80, 4, 'Come muito');

INSERT INTO `Consultas` (`idAnimal_fk`, `idVeterinario_fk`, `dtConsulta`, `motivo`, `diagnostico`, `custo`) VALUES
(1, 1, '2025-01-10 10:30:00', 'Check-up anual', 'Saudável', 150.00),
(2, 2, '2025-01-12 14:00:00', 'Vacina V5', 'Aplicação de vacina', 80.00),
(4, 1, '2025-02-05 09:15:00', 'Problema de pele', 'Dermatite alérgica', 180.00),
(3, 3, '2025-02-15 11:00:00', 'Coceira intensa', 'Dermatite (tratamento iniciado)', 200.00),
(1, 1, '2025-03-20 16:00:00', 'Vômito', 'Gastroenterite leve', 220.00),
(5, 4, '2025-04-01 10:00:00', 'Asa machucada', NULL, 100.00),
(7, 2, '2025-04-10 12:00:00', 'Check-up e vacina', 'Saudável, vacina anti-rábica aplicada', 190.00),
(2, 1, '2025-05-05 15:30:00', 'Espirros', 'Rinotraqueíte felina', 170.00),
(6, 3, '2025-05-15 08:30:00', 'Consulta dermatológica', 'Revisão da dermatite', 120.00);

--------------------------------------------
-- EXERCÍCIOS DE SELEÇÃO DE DADOS PARTE 2 --
--------------------------------------------

-- EXE1 ---------

SELECT 
    `nome` AS 'Nome do tutor',
    `cidade` AS 'Cidade'
FROM `Tutores`;

-- EXE2 ---------

SELECT
    `nome` AS 'Veterinário(a)',
    `especialidade` AS 'Especialidade'
FROM `Veterinarios`;

-- EXE3 ---------

SELECT
    `nome` AS 'Nome do Animal',
    `peso_kg` AS 'Peso (kg)'
FROM `Animais`;

-- EXE4 ---------

SELECT
    `dtConsulta` AS 'Data da Consulta',
    `custo` AS 'Valor (R$)'
FROM `Consultas`;

-- EXE5 ---------

SELECT `nome`
FROM `Tutores` ORDER BY `nome` ASC;

-- EXE6 ---------

SELECT `nome`
FROM `Animais` ORDER BY `nome` DESC;

-- EXE7 ---------

SELECT `nome`, `peso_kg`
FROM `Animais` ORDER BY `peso_kg` DESC;

-- EXE8 ---------

SELECT `motivo`, `custo`
FROM `Consultas` ORDER BY `custo` ASC;

-- EXE9 ---------

SELECT `nome`, `dtNascimento`
FROM `Animais` ORDER BY `dtNascimento` DESC;

-- EXE10 ---------

SELECT `nome`, `dtNascimento`
FROM `Animais` ORDER BY `dtNascimento` ASC;

-- EXE11 ---------

SELECT `motivo`, `dtConsulta`
FROM `Consultas` ORDER BY `dtConsulta` DESC;

-- EXE12 ---------

SELECT `nome`, `especie`
FROM `Animais` ORDER BY `especie` ASC, `nome` ASC;

-- EXE13 ---------

SELECT *
FROM `Animais` ORDER BY `idAnimal` ASC LIMIT 5;

-- EXE14 ---------

SELECT *
FROM `Consultas` ORDER BY `idConsulta` ASC LIMIT 3;

-- EXE15 ---------

SELECT *
FROM `Tutores` ORDER BY `idTutor` ASC LIMIT 2;

-- EXE16 ---------

SELECT *
FROM `Tutores` ORDER BY `idTutor` ASC LIMIT 2, 2;

-- EXE17 ---------

SELECT 
    `nome` AS 'Animal Mais Pesado',
    `peso_kg` AS 'Peso (kg)'
FROM `Animais` ORDER BY `peso_kg` DESC LIMIT 1;

-- EXE18 ---------

SELECT
    `motivo` AS 'Motivo',
    `diagnostico` AS 'Diagnóstico',
    `custo` AS 'Valor'
FROM `Consultas` ORDER BY `custo` DESC LIMIT 1;

-- EXE19 ---------

SELECT
    `nome` AS 'Nome',
    `especie` AS 'Espécie',
    `dtNascimento` AS 'Nascimento'
FROM `Animais` ORDER BY `dtNascimento` DESC LIMIT 3;

-- EXE20 ---------

SELECT
    `dtConsulta` AS 'Data',
    `motivo` AS 'Motivo'
FROM `Consultas` ORDER BY `dtConsulta` ASC LIMIT 2;