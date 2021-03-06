
 CREATE DATABASE MEGANSTORE;

CREATE TABLE CLINTE(
CLI_CPF CHAR(11) PRIMARY KEY,
CLI_TEL VARCHAR(12) NOT NULL,
CLI_NOME VARCHAR(40) NOT NULL
);

CREATE TABLE FORNECEDOR(
FORN_CNPJ VARCHAR(14) PRIMARY KEY,
FORN_NOME VARCHAR(40) NOT NULL,
FORN_TEL VARCHAR (12) NOT NULL
);
 
CREATE TABLE VENDEDOR(
VEND_COD INT AUTO_INCREMENT PRIMARY KEY,
VEND_NOME VARCHAR(40) NOT NULL
);

CREATE TABLE PRODUTO(
PRD_COD INT AUTO_INCREMENT PRIMARY KEY,
PRD_NOME VARCHAR(20) NOT NULL,
PRD_ESTOQUE INT NOT NULL,
PRD_PRECO DECIMAL(10,2) NOT NULL
);

CREATE TABLE PAGAMENTO (
PAG_COD       INT AUTO_INCREMENT PRIMARY KEY,
CARD_PARCELAS INT  NOT NULL,
CARD_VALOR    DECIMAL(10,2) NOT NULL,
CARD_NUM      CHAR(16)      NOT NULL,
CARD_VALIDADE CHAR(5)       NOT NULL,
CARD_TITULAR  VARCHAR(40)   NOT NULL
);

CREATE TABLE COMPRA(
NF_COD INT AUTO_INCREMENT PRIMARY KEY,
NF_TOTAL DECIMAL(10,2) NOT NULL,
NF_DATA DATE  NOT NULL,
VEND_COD INT REFERENCES VENDEDOR (VEND_COD),
CLI_CPF CHAR(11) REFERENCES CLIENTE (CLI_CPF)
);

CREATE TABLE FORNECEDOR_PRODUTO (
FORN_CNPJ VARCHAR(14)  REFERENCES FORNECEDOR (FORN_CNPJ),
PRD_COD   INT REFERENCES PRODUTO (PRD_COD)
);

CREATE TABLE COMPRA_PAGAMENTO (
NF_COD  INT REFERENCES COMPRA (NF_COD),
PAG_COD INT REFERENCES PAGAMENTO (PAG_COD)
);

CREATE TABLE COMPRA_PRODUTO (
NF_COD    INT  REFERENCES COMPRA (NF_COD),
PRD_COD   INT  REFERENCES PRODUTO (PRD_COD),
PRD_PRECO DECIMAL(10,2) NOT NULL,
PRD_QTD   INT  NOT NULL
);