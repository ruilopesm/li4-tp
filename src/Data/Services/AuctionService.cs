using Dapper;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public class AuctionService : IAuctionService
    {
        private readonly ISqlDataAccess _db;

        public AuctionService(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<List<AuctionModel>> GetAuctions()
        {
            const string sql =
                @"SELECT * FROM dbo.Auction a
                LEFT JOIN dbo.Product p ON a.ProductID = p.ID
                LEFT JOIN dbo.Model m ON p.ModelID = m.ID
                LEFT JOIN dbo.Admin ad ON a.PublisherID = ad.InternalID
                LEFT JOIN dbo.Bidder b ON a.WinnerID = b.NIF
                ORDER BY a.[End] DESC";

            var data = await _db.Connection.QueryAsync<AuctionModel, ProductModel, ModelModel, AdminModel, BidderModel, AuctionModel>(
                sql,
                (auction, product, model, admin, bidder) =>
                {
                    auction.Product = product;
                    auction.Product.Model = model;
                    auction.Publisher = admin;
                    auction.Winner = bidder;
                    return auction;
                },
                splitOn: "ID, ID, ID, InternalID, NIF"
            );

            return data.ToList();
        }

        public async Task<AuctionModel?> GetAuction(int id)
        {
            const string sql =
                @"SELECT * FROM dbo.Auction a
                LEFT JOIN dbo.Product p ON a.ProductID = p.ID
                LEFT JOIN dbo.Model m ON p.ModelID = m.ID
                LEFT JOIN dbo.Admin ad ON a.PublisherID = ad.InternalID
                LEFT JOIN dbo.Bidder b ON a.WinnerID = b.NIF
                WHERE a.ID = @ID";

            var data = await _db.Connection.QueryAsync<AuctionModel, ProductModel, ModelModel, AdminModel, BidderModel, AuctionModel>(
                sql,
                (auction, product, model, admin, bidder) =>
                {
                    auction.Product = product;
                    auction.Product.Model = model;
                    auction.Publisher = admin;
                    auction.Winner = bidder;
                    return auction;
                },
                new { ID = id },
                splitOn: "ID, ID, ID, InternalID, NIF"
            );

            return data.FirstOrDefault();
        }
    }
}
