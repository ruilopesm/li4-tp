USE [OnlineAuctions];

INSERT INTO [User] ([Name], [Email], [PasswordHash], [Role])
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

-- Bids for Rui (Bidder with NIF 123456789)
INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 123456789, 750, "2024-01-19 01:33:00"),  -- Bid for Auction 1
       (2, 123456789, 650, "2024-01-21 23:15:00"),  -- Bid for Auction 2
       (3, 123456789, 550, "2024-05-21 01:31:00");  -- Bid for Auction 3

-- Bids for Chico (Bidder with NIF 987654321)
INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 987654321, 720, "2024-01-19 01:34:00"),  -- Bid for Auction 1
       (2, 987654321, 620, "2024-01-22 00:30:00"),  -- Bid for Auction 2
       (3, 987654321, 520, "2024-05-21 01:32:00");  -- Bid for Auction 3

-- Bids for Daniel (Bidder with NIF 123123123)
INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 123123123, 500, "2024-01-19 01:35:00"),  -- Bid for Auction 1
       (2, 123123123, 400, "2024-01-21 23:45:00"),  -- Bid for Auction 2
       (3, 123123123, 300, "2024-05-21 01:33:00");  -- Bid for Auction 3

-- Bids for Duarte (Bidder with NIF 321321321)
INSERT INTO [Bid] ([AuctionID], [BidderNIF], [Value], [Date])
VALUES (1, 321321321, 430, "2024-01-19 01:36:00"),  -- Bid for Auction 1
       (2, 321321321, 330, "2024-01-21 23:50:00"),  -- Bid for Auction 2
       (3, 321321321, 230, "2024-05-21 01:34:00");  -- Bid for Auction 3;
