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

    public Task<int> CreateBid(int auctionId, int nif, decimal amount)
    {
        const string sql = @"INSERT INTO dbo.Bid (AuctionID, BidderNIF, Value)
                             VALUES (@AuctionId, @NIF, @Amount); SELECT SCOPE_IDENTITY()";

        var parameters = new
        {
            AuctionId = auctionId,
            NIF = nif,
            Amount = amount
        };

        return _db.Connection.ExecuteScalarAsync<int>(sql, parameters);
    }

    public async Task<List<BidModel>> GetBids(int productId)
    {
        const string sql = @"SELECT * FROM dbo.Bid WHERE AuctionID = @ProductId";

        var data = await _db.Connection.QueryAsync<BidModel>(sql, new { ProductId = productId });

        return data.ToList();
    }

    public Task<List<BidModel>> GetLastUserBids(int nif)
    {
        const string sql = @"SELECT * FROM dbo.Bid WHERE BidderNIF = @NIF
                            LEFT JOIN dbo.Auction ON dbo.Bid.AuctionID = dbo.Auction.ID
                            LEFT JOIN dbo.Product ON dbo.Auction.ProductID = dbo.Product.ID
                            LEFT JOIN dbo.Model ON dbo.Product.ModelID = dbo.Model.ID 
                            ORDER BY dbo.Auction.[End] DESC";

        return _db.LoadData<BidModel, dynamic>(sql, new { NIF = nif });
    }
}
