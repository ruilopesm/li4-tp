USE master;
GO
CREATE DATABASE [online_auctions];
GO

USE [online_auctions];

CREATE TABLE [Utilizador]
(
    [ID]               INT                IDENTITY PRIMARY KEY,
    [Nome]             VARCHAR(50)        NOT NULL,
    [Email]            VARCHAR(50) UNIQUE NOT NULL,
    [PasswordHash]     VARCHAR(72)        NOT NULL,
    [Role]             VARCHAR(10)        NOT NULL CHECK ([Role] IN ('Licitador', 'Administrador')),
)

CREATE TABLE [Licitador]
(
    [NIF]               INT         NOT NULL PRIMARY KEY,
    [Data_Nascimento]   DATE        NOT NULL,
    [Fundos_Livres]     MONEY       NOT NULL DEFAULT 0 CHECK ([Fundos_Livres] >= 0),
    [Fundos_Pendentes]  MONEY       NOT NULL DEFAULT 0 CHECK ([Fundos_Pendentes] >= 0),
    [ID_Utilizador]     VARCHAR(50) NOT NULL,
    
    FOREIGN KEY ([ID_Utilizador]) REFERENCES [Utilizador] ([Email]),
)

CREATE TABLE [Administrador]
(
    [ID]            INT         NOT NULL PRIMARY KEY IDENTITY,
    [Master]        BIT         NOT NULL,
    [ID_Utilizador] VARCHAR(50) NOT NULL,
    
    FOREIGN KEY ([ID_Utilizador]) REFERENCES [Utilizador] ([Email]),
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
    [Estado]    TINYINT     NOT NULL,
    [Condicao]  TINYINT     NOT NULL,
    
    FOREIGN KEY ([ID_Modelo]) REFERENCES [Modelo] ([ID]),
)

CREATE TABLE [Leilao]
(
    [ID]                          INT      NOT NULL PRIMARY KEY IDENTITY,
    [ID_Produto]                  INT      NOT NULL,
    [Data_Inicio]                 DATETIME NOT NULL,
    [Data_Fim]                    DATETIME NOT NULL,
    [Preco_Base]                  MONEY    NOT NULL,
    [Estado]                      TINYINT  NOT NULL,
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

CREATE TABLE [Link_Fotos]
(
    [ID]         INT         NOT NULL PRIMARY KEY IDENTITY,
    [ID_Produto] INT         NOT NULL,
    [Link]       VARCHAR(50) NOT NULL,
    
    FOREIGN KEY ([ID_Produto]) REFERENCES [Produto] ([ID]),
)
