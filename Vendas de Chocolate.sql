CREATE TABLE IF NOT EXISTS `Clientes` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`cpf` varchar(14) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);
CREATE TABLE IF NOT EXISTS `Funcionarios` (
	`id_funcionario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`cargo` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`email` varchar(100) NOT NULL,
	PRIMARY KEY (`id_funcionario`)
);
CREATE TABLE IF NOT EXISTS `Fornecedores` (
	`id_fornecedor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_empresa` varchar(100) NOT NULL,
	`cnpj` varchar(18) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	PRIMARY KEY (`id_fornecedor`)
);
CREATE TABLE IF NOT EXISTS `Chocolates` (
	`id_chocolate` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`categoria` varchar(50) NOT NULL,
	`preco` decimal(3,2) NOT NULL,
	`id_fornecedor` int NOT NULL,
	PRIMARY KEY (`id_chocolate`)
);
CREATE TABLE IF NOT EXISTS `Vendas` (
	`id_vendas` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_cliente` int NOT NULL,
	`id_funcionario` int NOT NULL,
	`id_chocolate` int NOT NULL,
	`data_venda` int AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (`id_vendas`)
);
ALTER TABLE `Chocolates` ADD CONSTRAINT `Chocolates_fk4` FOREIGN KEY (`id_fornecedor`) REFERENCES `Fornecedores`(`id_fornecedor`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk2` FOREIGN KEY (`id_funcionario`) REFERENCES `Funcionarios`(`id_funcionario`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk3` FOREIGN KEY (`id_chocolate`) REFERENCES `Chocolates`(`id_chocolate`);

-- Clientes
INSERT INTO Clientes (nome, cpf, telefone, cidade) VALUES
('João Silva', '123.456.789-01', '16999990001', 'Taquaritinga'),
('Maria Souza', '234.567.890-12', '16999990002', 'Araraquara'),
('Pedro Santos', '345.678.901-23', '16999990003', 'Matão');

-- Funcionarios
INSERT INTO Funcionarios (nome, cargo, telefone, email) VALUES
('Ana Costa', 'Vendedora', '16988880001', 'ana@choco.com'),
('Carlos Lima', 'Gerente', '16988880002', 'carlos@choco.com'),
('Juliana Rocha', 'Caixa', '16988880003', 'juliana@choco.com');

-- Fornecedores
INSERT INTO Fornecedores (nome_empresa, cnpj, telefone, cidade) VALUES
('Cacau Brasil', '12.345.678/0001-10', '1633334444', 'Ribeirão Preto'),
('Doce Sabor', '23.456.789/0001-20', '1633335555', 'São Carlos'),
('ChocoMax', '34.567.890/0001-30', '1633336666', 'Araraquara');

-- Chocolates
INSERT INTO Chocolates (nome, categoria, preco, id_fornecedor) VALUES
('Trufa de Chocolate', 'Trufa', 8.50, 1),
('Barra ao Leite', 'Barra', 12.90, 2),
('Bombom Recheado', 'Bombom', 5.75, 1),
('Chocolate Amargo', 'Barra', 14.50, 3),
('Caixa de Bombons', 'Presente', 29.90, 2);

-- Vendas
INSERT INTO Vendas (id_cliente, id_funcionario, id_chocolate, data_venda) VALUES
(1, 1, 1, '2025-06-01'),
(2, 2, 5, '2025-06-02'),
(3, 1, 2, '2025-06-03'),
(1, 3, 4, '2025-06-04'),
(2, 2, 3, '2025-06-05');

SELECT
    v.id_vendas,
    v.data_venda,

    c.nome AS cliente,
    c.cpf,
    c.cidade,

    f.nome AS funcionario,
    f.cargo,

    ch.nome AS chocolate,
    ch.categoria,
    ch.preco,

    fo.nome_empresa AS fornecedor

FROM Vendas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Funcionarios f
    ON v.id_funcionario = f.id_funcionario
INNER JOIN Chocolates ch
    ON v.id_chocolate = ch.id_chocolate
INNER JOIN Fornecedores fo
    ON ch.id_fornecedor = fo.id_fornecedor;
