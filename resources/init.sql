USE master;
GO
CREATE DATABASE [OnlineAuctions];
GO

SET QUOTED_IDENTIFIER ON;
GO

USE [OnlineAuctions];

CREATE TABLE [User]
(
    [ID]            INT                IDENTITY PRIMARY KEY,
    [Name]          VARCHAR(50)        NOT NULL,
    [Email]         VARCHAR(50) UNIQUE NOT NULL,
    [PasswordHash]  VARCHAR(72)        NOT NULL,
    [Role]          VARCHAR(6)         NOT NULL CHECK ([Role] IN ('Bidder', 'Admin')),
)

CREATE TABLE [Bidder]
(
    [NIF]            INT   NOT NULL PRIMARY KEY,
    [BirthDate]      DATE  NOT NULL,
    [Balance]        MONEY NOT NULL DEFAULT 0 CHECK ([Balance] >= 0),
    [PendingBalance] MONEY NOT NULL DEFAULT 0 CHECK ([PendingBalance] >= 0),
    [UserID]         INT   NOT NULL,

    FOREIGN KEY ([UserID]) REFERENCES [User] ([ID]),
)

CREATE TABLE [Admin]
(
    [InternalID]  INT IDENTITY PRIMARY KEY,
    [IsMaster]    BIT NOT NULL DEFAULT 0,
    [UserID]      INT NOT NULL,

    FOREIGN KEY ([UserID]) REFERENCES [User] ([ID]),
);
GO

-- Constraint to ensure that there is at most one master admin
CREATE UNIQUE INDEX UQ_IsMaster ON [Admin] ([IsMaster]) WHERE ([IsMaster] = 1);
GO

CREATE TABLE [Model]
(
    [ID]       INT         NOT NULL PRIMARY KEY IDENTITY,
    [Name]     VARCHAR(50) NOT NULL,
    [Color]    VARCHAR(50),
    [Storage]  VARCHAR(50),
)

CREATE TABLE [Product]
(
    [ID]           INT          NOT NULL PRIMARY KEY IDENTITY,
    [Description]  VARCHAR(50)  NOT NULL,
    [ModelID]      INT          NOT NULL,
    [State]        VARCHAR(10)  NOT NULL,
    [Condition]    VARCHAR(11)  NOT NULL,

    FOREIGN KEY ([ModelID]) REFERENCES [Model] ([ID]),
)

CREATE TABLE [Auction]
(
    [ID]           INT        NOT NULL PRIMARY KEY IDENTITY,
    [ProductID]    INT        NOT NULL,
    [Start]        DATETIME   NOT NULL,
    [End]          DATETIME   NOT NULL,
    [StartPrice]   MONEY      NOT NULL CHECK ([StartPrice] >= 0),
    [CurrentPrice] MONEY      NOT NULL CHECK ([CurrentPrice] >= 0),
    [IsCancelled]  BIT        NOT NULL DEFAULT 0,
    [PublisherID]  INT        NOT NULL,
    [WinnerID]     INT        NULL,

    FOREIGN KEY ([ProductID])   REFERENCES [Product] ([ID]),
    FOREIGN KEY ([PublisherID]) REFERENCES [Admin] ([InternalID]),
    FOREIGN KEY ([WinnerID])    REFERENCES [Bidder] ([NIF]),
)

CREATE TABLE [Bid]
(
    [ID]         INT      NOT NULL PRIMARY KEY IDENTITY,
    [AuctionID]  INT      NOT NULL,
    [BidderNIF]  INT      NOT NULL,
    [Value]      MONEY    NOT NULL,
    [Date]       DATETIME DEFAULT GETDATE(),

    FOREIGN KEY ([AuctionID]) REFERENCES [Auction] ([ID]),
    FOREIGN KEY ([BidderNIF]) REFERENCES [Bidder] ([NIF]),
)

CREATE TABLE [ProductPhoto]
(
    [ID]         INT          NOT NULL PRIMARY KEY IDENTITY,
    [ProductID]  INT          NOT NULL,
    [ImagePath]  VARCHAR(255) NOT NULL,

    FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ID]),
);
GO

SET QUOTED_IDENTIFIER OFF;
GO
