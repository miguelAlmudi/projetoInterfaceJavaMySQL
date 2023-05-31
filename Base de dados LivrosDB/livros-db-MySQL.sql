DROP IF EXISTS TABLE pedidos_detalhe;
DROP IF EXISTS TABLE livros;
DROP IF EXISTS TABLE generos;
DROP IF EXISTS TABLE usuarios;
DROP IF EXISTS TABLE pedidos;

CREATE TABLE generos
(
	GENERO_ID	SMALLINT	NOT NULL,
	DESCRICAO	VARCHAR(30)	NOT NULL,
	PRIMARY KEY (GENERO_ID)
);

INSERT INTO generos VALUES (1, 'Inteligencia Artificial');
INSERT INTO generos VALUES (2, 'Machine Learning');
INSERT INTO generos VALUES (3, 'Literatura');
INSERT INTO generos VALUES (4, 'Ficcao Cientifica');
INSERT INTO generos VALUES (5, 'Programacao');
INSERT INTO generos VALUES (6, 'Bancos de Dados');
INSERT INTO generos VALUES (7, 'Cibernética');

CREATE TABLE livros 
(
  LIVRO_ID	SMALLINT 	NOT NULL,
  TITULO	VARCHAR(150) NOT NULL,
  AUTOR		VARCHAR(150) NOT NULL,
  EDICAO    SMALLINT    NOT NULL,
  ANO		SMALLINT	NOT NULL,
  EDITORA	VARCHAR(50) NOT NULL,
  GENERO_ID	SMALLINT	NOT NULL REFERENCES generos(GENERO_ID) ON DELETE RESTRICT,
  DESCRICAO	VARCHAR(450) NOT NULL,
  PRECO		NUMERIC(15,2) NOT NULL,
  ESTOQUE	SMALLINT	NOT NULL,
  RESERVA	SMALLINT	NOT NULL,
  CAPA		MEDIUMBLOB,
 PRIMARY KEY (LIVRO_ID)
);

CREATE TABLE usuarios
(
	USUARIO_ID	SMALLINT    NOT NULL,
	NOME		VARCHAR(40)	NOT NULL,
	ENDERECO	VARCHAR(40),
	BAIRRO		VARCHAR(30),
	CIDADE		VARCHAR(30) NOT NULL,
	UF			CHAR(2)     NOT NULL,
	CEP			CHAR(8)     NOT NULL,
	FONE		VARCHAR(20) NOT NULL,
	LOGIN		VARCHAR(20)	NOT NULL,
	SENHA		VARCHAR(20)	NOT NULL,
  PRIMARY KEY (USUARIO_ID)
);

CREATE TABLE pedidos
(
	PEDIDO_ID	SERIAL,
	USUARIO_ID	SMALLINT NOT NULL,
	DATA_PEDIDO	DATE 	 NOT NULL,
	TIPO_PAG	SMALLINT NOT NULL,
	PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE pedidos_detalhe
(
	DETALHE_ID	SERIAL,
	PEDIDO_ID 	SMALLINT NOT NULL,
	LIVRO_ID	SMALLINT NOT NULL,
	QTD			SMALLINT NOT NULL,
  PRIMARY KEY (DETALHE_ID)
);