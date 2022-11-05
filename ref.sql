-- Este código é uma referência.

------------------- SEÇÃO NULL -------------------

--Operadores Aritméticos de soma,subração,
--multiplicação,divisão e módulo = javascript

--WHERE condição_lógica;

--	=	igual a (comparação)
--	<>	não igual a (comparação)
--	>	maior que
--	<	menor que
--	>=	maior que ou igual
--	<=	menor que ou igual

--MYSQL
--	ALL
--	AND
--	ANY
--	BETWEEN
--	EXISTS
--	IN
--	LIKE
--	NOT
--	OR
--	SOME

--CONSTRAINTS (restrições)
--	NOT NULL	valor obrigatório
--	UNIQUE		chave aternativa
--	PRIMARY KEY	chave primária
--	FOREIGN KEY	chave estrangeira
--	CHECK
--	DEFAULT
--	CREATE INDEX

------------------- SEÇÃO I -------------------
-- DOS BANCOS DE DADOS E TABELAS --

-------------------------------------------CREATE DATABASE

-- Criar banco de dados: CREATE DATABASE
CREATE DATABASE IF NOT EXISTS Supermercado;

-- USE define seu database de trabalho atual.
USE Supermercado;

-- A notação "nomeBancoDados.nomeTabela" funciona.

-------------------------------------------CREATE TABLE

CREATE TABLE Fornecedores (
	Cod_Fornec SMALLINT PRIMARY KEY AUTO_INCREMENT,
	Nome_Fornec VARCHAR(50)
);

CREATE TABLE Produtos (
	ID_Prod SMALLINT,
	Nome_Prod VARCHAR(50) NOT NULL,
	Quant_Prod SMALLINT NOT NULL,
	Preco_Prod DECIMAL(10,2),
	Cod_Fornec SMALLINT,
	Cod_unico CHAR(5),
	PRIMARY KEY (ID_Prod),
	FOREIGN KEY (Cod_Fornec)
		REFERENCES Fornecedores(Cod_Fornec),
	UNIQUE(Cod_unico)
);

-- Mostrar Tabelas de um database sem USE.
SHOW TABLES FROM Supermercado;

-- Descreve Tabelas de um database
DESCRIBE Produtos;

-- Criará Produtos se ele não existe ainda.
CREATE TABLE IF NOT EXISTS Produtos;

-------------------------------------------INSERT INTO

INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec)
VALUES (1, "Redstene"), (2, "EQR");

INSERT INTO Produtos (ID_Prod, Nome_Prod, Quant_Prod, Preco_Prod, Cod_Fornec, Cod_unico)
VALUES (100, "Monitor LCD", 12, 550.00, 1, "ak9ig"),
(101, "Roteador Banda Larga", 8, 130.00, 1, "6etgy"),
(102, "Teclado", 15, 40.00, 1, "5deot"),
(103, "Pendrive 64gb", 22, 48.00, 1, "65gut"),
(104, "Webcam", 6, 170.00, 2, "morl1"),
(105, "Marreta Mágica", 2, 9756.50, 2, "de6se");

------------------------------------------ALTER TABLE

-- Adicionar Coluna (Atributo) em uma tabela.

ALTER TABLE Produtos
ADD Volume VARCHAR(10),
ADD Peso SMALLINT NOT NULL;

-- Modificar definição da coluna.

ALTER TABLE Produtos
MODIFY COLUMN Preco_Prod DECIMAL(9,2);

ALTER TABLE Produtos
MODIFY Preco_Prod DECIMAL(9,2);


-- Deletar Coluna em uma tabela.

ALTER TABLE Produtos
DROP COLUMN Volume,
DROP COLUMN Peso;

--------------------------------------------SELECT FROM

-- Efetuar consulta (query), trazendo colunas específicas.

SELECT Nome_Fornec FROM Fornecedores; 		--uma coluna especificas.
SELECT Nome_Prod, Preco_Prod FROM Produtos; 	--2 colunas especificas.
SELECT * FROM Produtos; 			--toda a tabela.
SELECT DISTINCT Nome_Prod FROM Produtos; 	--retorna coluna retirando valores iguais.

-- Consutando uma tabela com filtro de dados específicos E lógica.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101; 				--produto com id especifico.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101 OR Nome_Prod = "Retornar Banda Larga";

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101 AND Nome_Prod = "Roteador Banda Larga";

SELECT Nome_Prod FROM Produtos
WHERE NOT ID_Prod = 101;

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod >= 101 AND ( Quant_Prod >= 1  OR Preco_Prod > 50.0  );

-------------------------------------------UPDATE

-- Alterar um registro na tabela: UPDATE

UPDATE Produtos
SET Preco_Prod = 999.00, Quant_Prod = 15
WHERE ID_Prod = 100;

--------------------------------------------DELETE

-- Excluir tupla de uma tabela: DELETE FROM

DELETE FROM Produtos
WHERE ID_Prod = 101; --Omissão de WHERE resulta em deleção de tudo.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101;

---------------------------------------------INNER JOIN

-- Trazer dados de duas ou mais tabelas relacionadas: INNER JOIN
-- INNER JOIN selects records that have matching values in both
-- tables.

SELECT Nome_Prod, Nome_Fornec
FROM Fornecedores
INNER JOIN Produtos
ON Fornecedores.Cod_Fornec = Produtos.Cod_Fornec;

-- Retornar resultados ordenados em uma consulta

SELECT Nome_Prod, Preco_Prod
FROM Produtos
ORDER BY Nome_Prod; --ordem alfabética.

SELECT Nome_Prod
FROM Produtos
ORDER BY Nome_Prod ASC; --ordem alfabética ascedente.

SELECT Nome_Prod
FROM Produtos
ORDER BY Nome_Prod DESC; --ordem alfabética decrescente.

-----------------------------------------------TRUNCATE
-- Apagar todos os dados de uma tabela. Não toda a tabela.

TRUNCATE TABLE Produtos
SELECT * FROM Produtos; --tabela produtos não mais existe.

-----------------------------------------------DROP

-- Deletar a tabela inteira.

DROP TABLE IF EXISTS Produtos;

-- Deletar o banco de dados.

DROP DATABASE IF EXISTS Supermercado;

------------------- SEÇÃO II -------------------
-- DOS USUÁRIOS E CONTAS --
-- apenas root ou um usuário poderoso
-- do SGBD pode operar aqui.
-- localhost = 127.0.0.1 --ou Não

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



