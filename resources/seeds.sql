USE [OnlineAuctions];

INSERT INTO [User] ([Name], [Email], [Password], [Role])
VALUES ('Rui', 'rui@mail.com', 'rui1234', 'Bidder'),
       ('Chico', 'chico@mail.com', 'chico1234', 'Bidder'),
       ('Daniel', 'daniel@mail.com', 'daniel1234', 'Bidder'),
       ('Duarte', 'duarte@mail.com', 'duarte1234', 'Bidder'),
       ('Master', 'master@mail.com', 'master1234', 'Admin');

INSERT INTO [Bidder] ([NIF], [BirthDate], [Balance], [PendingBalance], [UserID])
VALUES (123456789, '1987-05-23', 300, 0, 1),
       (987654321, '2005-01-01', 200, 0, 2),
       (123123123, '1995-12-31', 50, 0, 3),
       (321321321, '1999-06-06', 100, 0, 4);

INSERT INTO [Admin] ([IsMaster], [UserID])
VALUES (1, 5);

INSERT INTO [Model] ([Name], [Color], [Storage])
VALUES ('iPhone 14', 'Red', '128')

INSERT INTO [Product] ([Name], [Description], [ModelID], [State], [Condition])
VALUES ('iPhone 14 sem caixa', 'iPhone 14 sem caixa e com poucas marcas de uso', 1, 'Good', 'Used');

INSERT INTO [Auction] ([ProductID], [Start], [End], [StartPrice], [CurrentPrice], [PublisherID])
VALUES (1, "2023-01-19 01:30:02", "2023-01-22 01:30:02", 100, 100, 1);
