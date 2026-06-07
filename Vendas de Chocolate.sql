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