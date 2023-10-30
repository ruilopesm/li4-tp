-- Microsoft SQL SERVER

USE [online_auctions];

CREATE TABLE [Utilizador]
(
    [NIF]      INT         NOT NULL PRIMARY KEY IDENTITY,
    [Nome]     VARCHAR(50) NOT NULL,
    [Email]    VARCHAR(50) NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
    [Morada]   VARCHAR(50) NOT NULL
);

CREATE TABLE [Administrador]
(
    [ID]       INT         NOT NULL PRIMARY KEY IDENTITY,
    [Nome]     VARCHAR(50) NOT NULL,
    [Email]    VARCHAR(50) NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
)

CREATE TABLE [Modelo]
(
    [ID]      INT         NOT NULL PRIMARY KEY IDENTITY,
    [Nome]    VARCHAR(50) NOT NULL,
    [Caminho] VARCHAR(50) NOT NULL,
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
    [DataInicio]                  DATETIME NOT NULL,
    [DataFim]                     DATETIME NOT NULL,
    [PrecoBase]                   FLOAT    NOT NULL,
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
    [Valor]         FLOAT NOT NULL,
    FOREIGN KEY ([ID_Leilao]) REFERENCES [Leilao] ([ID]),
    FOREIGN KEY ([ID_Utilizador]) REFERENCES [Utilizador] ([NIF]),
)



