using Dapper;
using Microsoft.Extensions.Primitives;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public class BidService : IBidService
{
    private readonly ISqlDataAccess _db;

    public BidService(ISqlDataAccess db)
    {
        _db = db;
    }

    public Task<int> CreateBid(int auctionId, int NIF, decimal amount)
    {
        const string sql = 
            @"INSERT INTO dbo.Bid (AuctionID, BidderNIF, Value)
            VALUES (@AuctionId, @NIF, @Amount); SELECT SCOPE_IDENTITY()";

        var parameters = new
        {
            AuctionId = auctionId,
            NIF,
            Amount = amount
        };

        return _db.Connection.ExecuteScalarAsync<int>(sql, parameters);
    }

    public async Task<List<BidModel>> GetBids(int auctionId)
    {
        const string sql = 
            @"SELECT * FROM dbo.Bid b
            LEFT JOIN dbo.Bidder ON b.BidderNIF = Bidder.NIF
            LEFT JOIN dbo.[User] ON Bidder.UserID = [User].ID
            WHERE AuctionID = @AuctionId
            ORDER BY b.ID DESC";

        var data = await _db.Connection.QueryAsync<BidModel, BidderModel, BidModel>(
            sql,
            (bid, bidder) =>
            {
                bid.Bidder = bidder;
                return bid;
            },
            new { AuctionId = auctionId },
            splitOn: "NIF"
        );        

        return data.ToList();
    }

    public async Task<List<BidModel>> GetLastUserBids(int NIF)
    {
        const string sql =
            @"SELECT * FROM dbo.Bid b
            LEFT JOIN dbo.Auction a ON b.AuctionID = a.ID
            LEFT JOIN dbo.Product p ON a.ProductID = p.ID
            LEFT JOIN dbo.Model m ON p.ModelID = m.ID
            LEFT JOIN dbo.Admin ad ON a.PublisherID = ad.InternalID
            WHERE b.BidderNIF = @NIF
            ORDER BY b.[Date] DESC";

        var data = await _db.Connection.QueryAsync<BidModel, AuctionModel, ProductModel, ModelModel, AdminModel, BidModel>(
            sql,
            (bid, auction, product, model, admin) =>
            {
                bid.Auction = auction;
                bid.Auction.Product = product;
                bid.Auction.Product.Model = model;
                bid.Auction.Publisher = admin;
                return bid;
            },
            new { NIF },
            splitOn: "ID, ID, ID, ID, InternalID"
        );

        const string sql2 = @"SELECT ImagePath FROM dbo.ProductPhoto WHERE ProductID = @ID";

        foreach (var bidModel in data)
        {
            var images = await _db.Connection.QueryAsync<string>(sql2, new { bidModel.Auction.Product.ID });
            bidModel.Auction.Product.Images = images.ToList();
        }

        return data.ToList();
    }

    public async Task<BidModel?> GetAuctionLastBid(int auctionId)
    {
        const string sql =
            @"SELECT TOP 1 * FROM dbo.Bid b
            LEFT JOIN dbo.Auction a ON b.AuctionID = a.ID
            LEFT JOIN dbo.Bidder bd ON b.BidderNIF = bd.NIF
            LEFT JOIN dbo.[User] u ON bd.UserID = u.ID
            WHERE b.AuctionID = @AuctionId
            ORDER BY b.[Date] DESC";

        var data = await _db.Connection.QueryAsync<BidModel, AuctionModel, BidderModel, BidModel>(
            sql,
            (bid, auction, bidder) =>
            {
                bid.Auction = auction;
                bid.Bidder = bidder;
                return bid;
            },
            new { AuctionId = auctionId },
            splitOn: "ID, NIF"
        );

        return data.FirstOrDefault();
    }
}
