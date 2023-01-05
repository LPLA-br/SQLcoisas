/* join combina colunas de duas ou mais tabelas (Produto Cartesiano)
   literalmente exibindo uma nova tabela não existente no bando de dados.*/

/*
--TIPO:
INNER JOIN	ou apenas	JOIN
OUTER JOIN
*/

USE NEOTWITER;
/*
Usuarios(id,login,senha)
Videos(id,titulo,descrição)
Gostinhas(id_usuario, id_video, Gostou)
*/

/* SELECT colunas FROM tabelaA INNER JOIN tabelaB; */
/*fusão sem lógica das tabelas*/
SELECT * FROM Usuarios INNER JOIN Mensagens;

/* SELECT colunas FROM tabelaA INNER JOIN tabelaB ON tabelaA.id = tabelaB.idForasteiro; */
/* fusão lógica de ids PRIMARY KEY e FOREIGN KEY */
SELECT * FROM Mensagens INNER JOIN Usuarios ON
Mensagens.id_usuario = Usuarios.id;


/*Como join une tabelas então é possível
  SELECIONAR dados de ambas tabelas
  com a especificação TABELA.ATRIBUTO*/
SELECT Mensagens.id, texto, data_post, Usuarios.login
FROM Mensagens INNER JOIN Usuarios ON Mensagens.id_usuario = Usuarios.id;

/* foco no lado Usuarios que está a direita de RIGHT JOIN */
SELECT Usuarios.login, Gostinhas.id_video FROM Gostinhas RIGHT JOIN Usuarios ON Gostinhas.id_usuario = Usuarios.id;

/* foco no lado Gostinhas que está a esquerda de LEFT JOIN */

