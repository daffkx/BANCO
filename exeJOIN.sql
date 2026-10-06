CREATE DATABASE `loja_eletronicos`;
USE `loja_eletronicos`;

CREATE TABLE `categorias` (
`idCategoria` INT AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE `produtos` (
`idProduto` INT AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(150) NOT NULL,
`fabricante` VARCHAR(100),
`preco` DECIMAL(10, 2) NOT NULL,
`estoque` INT DEFAULT 0,
`idCategoria_fk` INT,
`dtCadastro` DATE,
FOREIGN KEY (`idCategoria_fk`) REFERENCES `categorias`(`idCategoria`)
);

INSERT INTO `categorias` (`nome`) VALUES
('Notebooks'), 
('Smartphones'), 
('Periféricos'), 
('Monitores'); 

INSERT INTO `produtos` (`nome`, `fabricante`, `preco`, `estoque`, `idCategoria_fk`, `dtCadastro`) VALUES
('Laptop Pro', 'TechCorp', 4500.00, 15, 1, '2024-01-10'),
('Smartphone X', 'MobileInc', 3200.00, 30, 2, '2024-02-15'),
('Mouse Gamer', 'GamerGear', 250.00, 100, 3, '2024-03-05'),
('Teclado Mecânico', 'GamerGear', 450.00, 50, 3, '2024-03-05'),
('Monitor UltraWide', 'ViewMax', 1800.00, 20, 4, '2024-01-20'),
('Laptop Gamer', 'TechCorp', 6500.00, 10, 1, '2024-02-25'),
('Smartphone Y', 'MobileInc', 1900.00, 40, 2, '2024-04-10'),
('Webcam HD', 'Perifex', 150.00, 0, 3, '2024-05-01'),
('Mouse Pad', NULL, 50.00, 200, 3, '2024-03-06'),
('Monitor 4K', 'ViewMax', 2700.00, 12, 4, '2024-05-15');

------------------------------------
-- EXERCÍCIOS DE JOIN --------------
------------------------------------

-- EXE1 ---------

SELECT 
    p.nome AS produto,
    c.nome AS categoria
FROM
    produtos p
INNER JOIN 
    categorias c ON p.idCategoria_fk = c.idCategoria;

-- EXE2 ---------

SELECT 
    p.nome AS produto,
    p.preco
FROM 
    produtos p
INNER JOIN 
    categorias c ON p.idCategoria_fk = c.idCategoria WHERE c.nome = 'Periféricos';

-- EXE3 ---------

SELECT 
    p.nome AS produto,
    p.fabricante
FROM 
    produtos p
INNER JOIN 
    categorias c ON p.idCategoria_fk = c.idCategoria WHERE c.nome = 'Notebooks';

-- EXE4 ---------

SELECT 
    p.nome AS produto,
    c.nome AS categoria,
    p.preco
FROM 
    produtos p
INNER JOIN 
    categorias c ON p.idCategoria_fk = c.idCategoria WHERE p.preco > 2000.00;