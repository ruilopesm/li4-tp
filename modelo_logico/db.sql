-- Microsoft SQL SERVER

USE [online_auctions];

CREATE TABLE [Utilizador]
(
    [NIF]              INT                NOT NULL PRIMARY KEY IDENTITY,
    [Nome]             VARCHAR(50)        NOT NULL,
    [Email]            VARCHAR(50) UNIQUE NOT NULL,
    [Password]         VARCHAR(50)        NOT NULL,
    [Data_Nascimento]  DATE               NOT NULL,
    [Fundos_Livres]    MONEY              NOT NULL,
    [Fundos_Pendentes] MONEY              NOT NULL,
);

CREATE TABLE [Administrador]
(
    [ID]       INT                NOT NULL PRIMARY KEY IDENTITY,
    [Nome]     VARCHAR(50)        NOT NULL,
    [Email]    VARCHAR(50) UNIQUE NOT NULL,
    [Password] VARCHAR(50)        NOT NULL,
)

CREATE TABLE [Modelo]
(
    [ID]            INT         NOT NULL PRIMARY KEY IDENTITY,
    [Nome]          VARCHAR(50) NOT NULL,
    [Cor]           VARCHAR(50),
    [Armazenamento] VARCHAR(50),
)

CREATE TABLE [Produto]
(
    [ID]        INT         NOT NULL PRIMARY KEY IDENTITY,
    [Nome]      VARCHAR(50) NOT NULL,
    [Descricao] VARCHAR(50) NOT NULL,
    [ID_Modelo] INT         NOT NULL,
    [Estado]    INT         NOT NULL,
    [Condicao]  INT         NOT NULL,
    FOREIGN KEY ([ID_Modelo]) REFERENCES [Modelo] ([ID]),
)

CREATE TABLE [Leilao]
(
    [ID]                          INT      NOT NULL PRIMARY KEY IDENTITY,
    [ID_Produto]                  INT      NOT NULL,
    [Data_Inicio]                 DATETIME NOT NULL,
    [Data_Fim]                    DATETIME NOT NULL,
    [Preco_Base]                  MONEY    NOT NULL,
    [Estado]                      INT      NOT NULL,
    [ID_Administrador_Publicador] INT      NOT NULL,
    [NIF_Vencedor]                INT,
    FOREIGN KEY ([ID_Produto]) REFERENCES [Produto] ([ID]),
    FOREIGN KEY ([ID_Administrador_Publicador]) REFERENCES [Administrador] ([ID]),
    FOREIGN KEY ([NIF_Vencedor]) REFERENCES [Utilizador] ([NIF]),
)

CREATE TABLE [Licitacao]
(
    [ID]            INT   NOT NULL PRIMARY KEY IDENTITY,
    [ID_Leilao]     INT   NOT NULL,
    [ID_Utilizador] INT   NOT NULL,
    [Valor]         MONEY NOT NULL,
    FOREIGN KEY ([ID_Leilao]) REFERENCES [Leilao] ([ID]),
    FOREIGN KEY ([ID_Utilizador]) REFERENCES [Utilizador] ([NIF]),
)



