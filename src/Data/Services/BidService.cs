using System.Data;
using System.Transactions;
using Dapper;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public class BidService : IBidService
{
    private readonly ISqlDataAccess _db;

    public BidService(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<BidModel> CreateBid(int auctionId, int NIF, decimal amount)
    {
        if (_db.Connection.State != ConnectionState.Open)
        {
            await _db.Connection.OpenAsync();
        }

        using var transaction = _db.Connection.BeginTransaction();
        try
        {
            const string sql =
                @"INSERT INTO dbo.Bid (AuctionID, BidderNIF, Value) VALUES (@AuctionId, @NIF, @Value); SELECT SCOPE_IDENTITY()";

            var id = await _db.Connection.ExecuteScalarAsync<int>(
                sql,
                new
                {
                    AuctionId = auctionId,
                    NIF,
                    Value = amount,
                },
                transaction
            );

            const string sql2 =
                @"UPDATE dbo.Auction
                    SET CurrentPrice = @Value
                    WHERE ID = @AuctionId";

            await _db.Connection.ExecuteAsync(
                sql2,
                new
                {
                    AuctionId = auctionId,
                    Value = amount,
                },
                transaction
            );

            const string sql3 =
                @"UPDATE dbo.Bidder
                    SET Balance = Balance - @Value, PendingBalance = PendingBalance + @Value
                    WHERE NIF = @NIF";

            await _db.Connection.ExecuteAsync(
                sql3,
                new
                {
                    NIF,
                    Value = amount,
                },
                transaction
            );

            const string sql4 =
                @"SELECT TOP 1 * FROM dbo.Bid b
                    LEFT JOIN dbo.Bidder bd ON b.BidderNIF = bd.NIF
                    LEFT JOIN dbo.[User] u ON bd.UserID = u.ID
                    WHERE b.AuctionID = @AuctionId
                    ORDER BY b.[Date] DESC";

            var data = await _db.Connection.QueryAsync<BidModel, BidderModel, BidModel>(
                sql4,
                (bid, bidder) =>
                {
                    bid.Bidder = bidder;
                    return bid;
                },
                new { AuctionId = auctionId },
                transaction,
                splitOn: "NIF"
            );

            var lastBid = data.FirstOrDefault();

            if (lastBid != null)
            {
                const string sql5 =
                    @"UPDATE dbo.Bidder
                        SET Balance = Balance + @Value, PendingBalance = PendingBalance - @Value
                        WHERE NIF = @NIF";

                await _db.Connection.ExecuteAsync(
                    sql5,
                    new
                    {
                        lastBid.Bidder.NIF,
                        lastBid.Value,
                    },
                    transaction
                );
            }

            transaction.Commit();

            return (await GetBid(id))!;
        }
        catch
        {
            transaction.Rollback();
            throw;
        }
    }

    public async Task<BidModel?> GetBid(int id)
    {
        const string sql =
            @"SELECT * FROM dbo.Bid b
            LEFT JOIN dbo.Bidder ON b.BidderNIF = Bidder.NIF
            LEFT JOIN dbo.[User] ON Bidder.UserID = [User].ID
            WHERE b.ID = @Id";

        var data = await _db.Connection.QueryAsync<BidModel, BidderModel, BidModel>(
            sql,
            (bid, bidder) =>
            {
                bid.Bidder = bidder;
                return bid;
            },
            new { Id = id },
            splitOn: "NIF"
        );

        return data.FirstOrDefault();
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

    public async Task<int> GetTotalBids(int auctionId)
    {
        const string sql =
            @"SELECT COUNT(*) FROM dbo.Bid
            WHERE AuctionID = @AuctionId";

        var data = await _db.Connection.QueryAsync<int>(
            sql,
            new { AuctionId = auctionId }
        );

        return data.FirstOrDefault();
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
