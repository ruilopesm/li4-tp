#!/usr/bin/env dotnet-script
#r "nuget:BCrypt.Net-Next, 4.0.3"
#r "nuget:Dapper, 2.1.28"
#r "nuget:Dapper.Transaction, 2.1.24"
#r "nuget:System.Data.SqlClient, 4.8.6"

using Dapper;
using System;
using System.Data.SqlClient;
using System.Collections.Generic;

var connection = new SqlConnection("Server=localhost;Database=OnlineAuctions;User Id=sa;Password=Admin-123");

using (connection)
{
    connection.Open();

    // Insert Users
    var users = new List<(string, string, string, string)>
    {
        ("Rui", "rui@mail.com", BCrypt.Net.BCrypt.HashPassword("rui1234"), "Bidder"),
        ("Chico", "chico@mail.com", BCrypt.Net.BCrypt.HashPassword("chico1234"), "Bidder"),
        ("Daniel", "daniel@mail.com", BCrypt.Net.BCrypt.HashPassword("daniel1234"), "Bidder"),
        ("Duarte", "duarte@mail.com", BCrypt.Net.BCrypt.HashPassword("duarte1234"), "Bidder"),
        ("Master", "master@mail.com", BCrypt.Net.BCrypt.HashPassword("master1234"), "Admin")
    };

    var insertUserString = "INSERT INTO [User] (Name, Email, PasswordHash, Role) VALUES";
    var userValues = string.Join(",", users.Select(u => $"('{u.Item1}', '{u.Item2}', '{u.Item3}', '{u.Item4}')"));
    var userCommand = new SqlCommand($"{insertUserString} {userValues}", connection);
    userCommand.ExecuteNonQuery();

    // Insert Bidders
    var bidders = new List<(int, DateTime, decimal, decimal, int)>
    {
        (123456789, DateTime.Parse("1987-05-23"), 300, 0, 1),
        (987654321, DateTime.Parse("2005-01-01"), 200, 0, 2),
        (123123123, DateTime.Parse("1995-12-31"), 50, 0, 3),
        (321321321, DateTime.Parse("1999-06-06"), 100, 0, 4)
    };

    var insertBidderString = "INSERT INTO [Bidder] (NIF, BirthDate, Balance, PendingBalance, UserID) VALUES";
    var bidderValues = string.Join(",", bidders.Select(b => $"({b.Item1}, '{b.Item2:yyyy-MM-dd}', {b.Item3}, {b.Item4}, {b.Item5})"));
    var bidderCommand = new SqlCommand($"{insertBidderString} {bidderValues}", connection);
    bidderCommand.ExecuteNonQuery();

    // Insert Admins
    var admins = new List<(int, int)>
    {
        (1, 5)
    };

    var insertAdminString = "INSERT INTO [Admin] (IsMaster, UserID) VALUES";
    var adminValues = string.Join(",", admins.Select(a => $"({a.Item1}, {a.Item2})"));
    var adminCommand = new SqlCommand($"{insertAdminString} {adminValues}", connection);
    adminCommand.ExecuteNonQuery();

    // Insert Models
    var models = new List<(string, string, string)>
    {
        ("iPhone 14", "Rosa", "128GB"),
        ("iPhone 13", "Azul", "1TB"),
        ("iPhone 12", "Preto", "256GB"),
        ("iPhone 11", "Branco", "64GB"),
        ("Pano de Limpeza", "Branco", null),
        ("Macbook Air M1", "Cinzento", "256GB"),
        ("Macbook Pro M1", "Cinzento", "512GB")
    };

    var insertModelString = "INSERT INTO [Model] (Name, Color, Storage) VALUES";
    var modelValues = string.Join(",", models.Select(m =>
    {
        if (m.Item3 != null)
        {
            return $"('{m.Item1}', '{m.Item2}', '{m.Item3}')";
        }
        else
        {
            return $"('{m.Item1}', '{m.Item2}', NULL)";
        }
    }));

    var modelCommand = new SqlCommand($"{insertModelString} {modelValues}", connection);
    modelCommand.ExecuteNonQuery();

    // Insert Products
    var products = new List<(string, int, string, string)>
    {
        ("Com poucas marcas de uso", 1, "Excellent", "Used"),
        ("Com marcas de uso", 2, "Good", "Used"),
        ("Como novo", 3, "Excellent", "Refurbished"),
        ("Com vidro de trás partido", 4, "Bad", "Used"),
        ("Um pouco sujo", 5, "Good", "Returned"),
        ("Como novo", 6, "Excellent", "Refurbished"),
        ("Com marcas de uso", 7, "Good", "Used")
    };

    var insertProductString = "INSERT INTO [Product] (Description, ModelID, State, Condition) VALUES";
    var productValues = string.Join(",", products.Select(p => $"('{p.Item1}', {p.Item2}, '{p.Item3}', '{p.Item4}')"));
    var productCommand = new SqlCommand($"{insertProductString} {productValues}", connection);
    productCommand.ExecuteNonQuery();

    // Insert Auctions
    var auctions = new List<(int, DateTime, DateTime, decimal, decimal, int)>
    {
        (1, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-01-19 01:35:02"), 700, 700, 1),
        (2, DateTime.Parse("2024-01-20 23:05:02"), DateTime.Parse("2024-01-22 01:30:02"), 600, 600, 1),
        (3, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-05-22 01:30:02"), 500, 500, 1),
        (4, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-05-23 01:30:02"), 400, 400, 1),
        (5, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-01-20 01:30:02"), 10, 10, 1),
        (6, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-01-22 12:30:02"), 1000, 1000, 1),
        (7, DateTime.Parse("2024-01-19 01:30:02"), DateTime.Parse("2024-01-22 19:30:02"), 1500, 1500, 1)
    };

    var insertAuctionString = "INSERT INTO [Auction] (ProductID, [Start], [End], StartPrice, CurrentPrice, PublisherID) VALUES";
    var auctionValues = string.Join(",", auctions.Select(a => $"({a.Item1}, '{a.Item2:yyyy-MM-dd HH:mm:ss}', '{a.Item3:yyyy-MM-dd HH:mm:ss}', {a.Item4}, {a.Item5}, {a.Item6})"));
    var auctionCommand = new SqlCommand($"{insertAuctionString} {auctionValues}", connection);
    auctionCommand.ExecuteNonQuery();

    // Insert Bids
    var bids = new List<(int, int, decimal, DateTime)>
    {
        (1, 123456789, 750, DateTime.Parse("2024-01-19 01:33:00")),
        (2, 123456789, 650, DateTime.Parse("2024-01-21 23:15:00")),
        (3, 123456789, 550, DateTime.Parse("2024-05-21 01:31:00")),
        (1, 987654321, 720, DateTime.Parse("2024-01-19 01:34:00")),
        (2, 987654321, 620, DateTime.Parse("2024-01-22 00:30:00")),
        (3, 987654321, 520, DateTime.Parse("2024-05-21 01:32:00")),
        (1, 123123123, 500, DateTime.Parse("2024-01-19 01:35:00")),
        (2, 123123123, 400, DateTime.Parse("2024-01-21 23:45:00")),
        (3, 123123123, 300, DateTime.Parse("2024-05-21 01:33:00")),
        (1, 321321321, 430, DateTime.Parse("2024-01-19 01:36:00")),
        (2, 321321321, 330, DateTime.Parse("2024-01-21 23:50:00")),
        (3, 321321321, 230, DateTime.Parse("2024-05-21 01:34:00"))
    };

    var insertBidString = "INSERT INTO [Bid] (AuctionID, BidderNIF, Value, Date) VALUES";
    var bidValues = string.Join(",", bids.Select(b => $"({b.Item1}, {b.Item2}, {b.Item3}, '{b.Item4:yyyy-MM-dd HH:mm:ss}')"));
    var bidCommand = new SqlCommand($"{insertBidString} {bidValues}", connection);
    bidCommand.ExecuteNonQuery();

    connection.Close();
}

connection.Dispose();
