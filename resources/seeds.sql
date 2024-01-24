USE [OnlineAuctions];

-- Password for all users: user1234567, e.g. password for user 'Rui' is 'rui1234567'
INSERT INTO [User] ([Name], [Email], [PasswordHash], [Role])
VALUES ('Rui', 'rui@mail.com', '$2a$11$zS0Lx9yTVhukWEOFdvI0XuKwBxNghrkaAnGViznvDZ1M2LcX8uneC', 'Bidder'),
       ('Chico', 'chico@mail.com', '$2a$11$Ku2RhE1ggjylYgSsRB/xUuUw4V6FIgE9jTP5jM33IhA8ceX.5IONS', 'Bidder'),
       ('Daniel', 'daniel@mail.com', '$2a$11$EGhXtR27QuSBAtvA3DJtFOUqupaCKN3zMlzh.Iru2SI.ws34sdp.K', 'Bidder'),
       ('Duarte', 'duarte@mail.com', '$2a$11$dXjw52VOe.TJB6pWA8dNtefJ7U.fAksdpzo2buptSEwGs7IpUFE8y', 'Bidder'),
       ('Master', 'master@mail.com', '$2a$11$5lonnuO9V6W/ZbmIDVRyReIY72WN0C5jgMYdU3lRSiYLlj3Ju2iTO', 'Admin'),
       ('Admin', 'admin@mail.com', '$2a$11$BPrZSFwI009VrV5k359BAuchU9gr7fyo9ANwof9pG3BxsD1Q.ddYu', 'Admin');

INSERT INTO [Bidder] ([NIF], [BirthDate], [Balance], [PendingBalance], [UserID])
VALUES (123456789, '1987-05-23', 300, 0, 1),
       (987654321, '2005-01-01', 200, 0, 2),
       (123123123, '1995-12-31', 50, 0, 3),
       (321321321, '1999-06-06', 100, 0, 4);

INSERT INTO [Admin] ([IsMaster], [UserID])
VALUES (1, 5),
       (0, 6);

INSERT INTO [Model] ([Name], [Color], [Storage])
VALUES ('iPhone 15', 'Branco', '128GB'),
       ('iPhone 14', 'Preto', '1TB'),
       ('iPhone 12', 'Preto', '256GB'),
       ('iPhone 15 Pro Max', 'Titanio', '128GB');

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

INSERT INTO [ProductPhoto] ([ProductID], [ImagePath])
VALUES (1, 'assets/iphone-15-branco.jpeg'),
       (2, 'assets/iphone-14-preto.jpeg'),
       (3, 'assets/iphone-12-preto.jpeg'),
       (4, 'assets/iphone-15-pro-max-titanium.png'),
       (5, 'assets/cleaning-cloth.jpeg'),
       (6, 'assets/macbook-air-m1.jpeg'),
       (7, 'assets/macbook-pro-m1.jpeg');

INSERT INTO [Auction] ([ProductID], [Start], [End], [StartPrice], [CurrentPrice], [PublisherID])
VALUES (1, "2024-01-19 01:30:02", "2024-01-19 01:35:02", 700, 700, 1),
       (2, "2024-01-20 23:05:02", "2024-01-22 01:30:02", 600, 600, 1),
       (3, "2024-01-19 01:30:02", "2024-05-22 01:30:02", 500, 500, 1),
       (4, "2024-01-19 01:30:02", "2024-05-23 01:30:02", 400, 400, 1),
       (5, "2024-01-19 01:30:02", "2024-01-20 01:30:02", 10, 10, 1),
       (6, "2024-01-19 01:30:02", "2024-01-22 12:30:02", 1000, 1000, 1),
       (7, "2024-01-19 01:30:02", "2024-01-22 19:30:02", 1500, 1500, 1);

INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 123456789, 750, "2024-01-19 01:33:00"), 
       (2, 123456789, 650, "2024-01-21 23:15:00"),
       (3, 123456789, 550, "2024-05-21 01:31:00");

INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 987654321, 720, "2024-01-19 01:34:00"),
       (2, 987654321, 620, "2024-01-22 00:30:00"),
       (3, 987654321, 520, "2024-05-21 01:32:00");

INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 123123123, 500, "2024-01-19 01:35:00"),
       (2, 123123123, 400, "2024-01-21 23:45:00"),
       (3, 123123123, 300, "2024-05-21 01:33:00");

INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 321321321, 430, "2024-01-19 01:36:00"),
       (2, 321321321, 330, "2024-01-21 23:50:00"),
       (3, 321321321, 230, "2024-05-21 01:34:00");
