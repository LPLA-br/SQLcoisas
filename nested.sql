
/* consultas aninhadas e joins */
USE world;

/* consultas aninhadas só podem ser feitas com uma coluna de exibição
   ERROR 1241: operand should contain 1 column
 */

/* Todas as cidade que situam-se no brasil */
SELECT Name FROM city WHERE CountryCode IN
	( SELECT CountryCode FROM country WHERE CountryCode = "BRA" );

/* Todas as cidades Portuguesas que tem população maior que 100.000*/
SELECT Name, Population, District FROM city WHERE CountryCode IN
	( SELECT CountryCode FROM country WHERE CountryCode = "PTR" )
AND Population > 100000;

/* Paises menos populosos que São Paulo.*/
/* A subconsulta deve retornar 1 valor de outra tabela */
SELECT Name, Population FROM country WHERE 
Population < ( SELECT Population FROM city WHERE Name = 'São paulo' )
ORDER BY Population DESC;

