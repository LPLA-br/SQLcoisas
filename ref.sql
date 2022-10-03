------------------- SEÇÃO I -------------------
-- DOS BANCOS DE DADOS E TABELAS --

-- Criar banco de dados: CREATE DATABASE
CREATE DATABASE IF NOT EXISTS Supermercado;
USE Supermercado; --trabalhando com Supermercado para próximos comandos.

-- Criar Tabelas: CREATE TABLE
CREATE TABLE Fornecedores (
	Cod_Fornec SMALLINT PRIMARY KEY,
	Nome_Fornec VARCHAR(50)
);

CREATE TABLE Produtos (
	ID_Prod SMALLINT PRIMARY KEY,
	Nome_Prod VARCHAR(50) NOT NULL,
	Quant_Prod SMALLINT NOT NULL,
	Preco_Prod DECIMAL(10,2),
	Cod_Fornec SMALLINT,
	CONSTRAINT fk_cod_fornec FOREIGN KEY (Cod_Fornec)
	REFERENCES Fornecedores(Cod_Fornec)
);

-- Criará Produtos se ele não existe ainda.
CREATE TABLE IF NOT EXISTS Produtos;

-- Inserir dados nas tabelas: INSERT INTO

INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec)
VALUES (1, "Redstene"), (2, "EQR");

INSERT INTO Produtos
VALUES (100, "Monitor LCD", 12, 550.00, 1),
(101, "Roteador Banda Larga", 8, 130.00, 1),
(102, "Teclado", 15, 40.00, 1),
(103, "Pendrive 64gb", 22, 48.00, 1),
(104, "Webcam", 6, 170.00, 2),
(105, "Marreta Mágica", 2, 9756.50, 2);

-- Adicionar Coluna (Atributo) em uma tabela.

ALTER TABLE Produtos
ADD Volume VARCHAR(10),
ADD Peso SMALLINT NOT NULL;

-- Efetuar consulta (query), trazendo colunas específicas.

SELECT Nome_Fornec FROM Fornecedores; --uma coluna especificas.
SELECT Nome_Prod, Preco_Prod FROM Produtos; -- 2 colunas especificas.
SELECT * FROM Produtos; --toda a tabela.

SELECT DISTINCT Nome_Prod FROM Produtos; -- retorna coluna retirando valores iguais.

-- Consutando uma tabela com filtro de dados específicos.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101; --produto com id especifico.

-- Alterar um registro na tabela: UPDATE

UPDATE Produtos
SET Preco_Prod = 999.00, Quant_Prod = 15
WHERE ID_Prod = 100; -- apenas o produto de id 100

-- SELECT atributo FROM tabela WERE atributo = valor;

SELECT Preco_Prod FROM Produtos
WHERE ID_Prod = 100;

-- Excluir tupla de uma tabela: DELETE FROM

DELETE FROM Produtos
WHERE ID_Prod = 101; --Roteador foi eliminado.

SELECT Nome_Prod FROM Produtos --mais uma consulta específica.
WHERE ID_Prod = 101;

-- Trazer dados de duas ou mais tabelas relacionadas: INNER JOIN

SELECT Nome_Prod, Nome_Fornec
FROM Fornecedores
INNER JOIN Produtos
ON Fornecedores.Cod_Fornec = Produtos.Cod_Fornec;

-- Retornar resultados ordenados em uma consulta

SELECT Nome_Prod, Preco_Prod
FROM Produtos
ORDER BY Nome_Prod; --ordem alfabética.

-- Deletar Coluna em uma tabela.

ALTER TABLE Produtos
DROP COLUMN Volume,
DROP COLUMN Peso;

-- Apagar todos os dados de uma tabela. Toda tabela.

TRUNCATE TABLE Produtos
SELECT * FROM Produtos; --tabela produtos não mais existe.

-- Deletar a tabela inteira.

DROP TABLE IF EXISTS Produtos;

-- Deletar o banco de dados.

DROP DATABASE IF EXISTS Supermercado;

------------------- SEÇÃO II -------------------
-- DOS USUÁRIOS E CONTAS --
-- apenas root ou um usuário poderoso pode operar aqui.
-- localhost = 127.0.0.1

CREATE USER IF NOT EXISTS "Marcolino"@"localhost" IDENTIFIED BY "senhaForte123";

-- GRANT in Tables for a user.
-- USE banco; para poder dar permissões de tabela abaixo ao novo usuário

GRANT INSERT ON Tabela TO "Marcolino"@"localhost";
GRANT UPDATE ( coluna1, coluna2 ) ON Tabela TO "Marcolino"@"localhost";

-- principais permissões das tabelas:
-- ALTER, CREATE, DELETE, DROP, INSERT, SELECT, UPDATE.
-- principais perimissões das colunas
-- INSERT (col_list), SELECT (), UPDATE ()

-- Mostrar privilégios de um usuário
SHOW GRANTS FOR "Marcolino"@"localhost";



