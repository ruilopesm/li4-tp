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
VALUES ('iPhone 14', 'Rosa', '128GB'),
       ('iPhone 13', 'Azul', '1TB'),
       ('iPhone 12', 'Preto', '256GB'),
       ('iPhone 11', 'Branco', '64GB');

INSERT INTO [Model] ([Name], [Color])
VALUES ('Pano de Limpeza', 'Branco');

INSERT INTO [Model] ([Name], [Color], [Storage])
VALUES ('Macbook Air M1', 'Cinzento', '256GB'),
       ('Macbook Pro M1', 'Cinzento', '512GB');

INSERT INTO [Product] ([Description], [ModelID], [State], [Condition])
VALUES ('Com poucas marcas de uso', 1, 'Excellent', 'Used'),
       ('Com marcas de uso', 2, 'Good', 'Used'),
       ('Como novo', 3, 'Excellent', 'Refurbished'),
       ('Com vidro de trás partido', 4, 'Bad', 'Used'),
       ('Um pouco sujo', 5, 'Good', 'Returned'),
       ('Como novo', 6, 'Excellent', 'Refurbished'),
       ('Com marcas de uso', 7, 'Good', 'Used');

INSERT INTO [Auction] ([ProductID], [Start], [End], [StartPrice], [CurrentPrice], [PublisherID])
VALUES (1, "2024-01-19 01:30:02", "2024-01-19 01:35:02", 700, 700, 1),
       (2, "2024-01-20 23:05:02", "2024-01-22 01:30:02", 600, 600, 1),
       (3, "2024-01-19 01:30:02", "2024-05-22 01:30:02", 500, 500, 1),
       (4, "2024-01-19 01:30:02", "2024-05-23 01:30:02", 400, 400, 1),
       (5, "2024-01-19 01:30:02", "2024-01-20 01:30:02", 10, 10, 1),
       (6, "2024-01-19 01:30:02", "2024-01-22 12:30:02", 1000, 1000, 1),
       (7, "2024-01-19 01:30:02", "2024-01-22 19:30:02", 1500, 1500, 1);
