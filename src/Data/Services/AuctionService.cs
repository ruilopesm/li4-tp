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

            const string sql2 = @"SELECT ImagePath FROM dbo.ProductPhoto WHERE ProductID = @ID";

            foreach (var auctionModel in data)
            {
                var images = await _db.Connection.QueryAsync<string>(sql2, new { auctionModel.Product.ID });
                auctionModel.Product.Images = images.ToList();
            }

            const string sql3 = @"SELECT * FROM dbo.Bid WHERE AuctionID = @ID";

            foreach (var auctionModel in data)
            {
                var bids = await _db.Connection.QueryAsync<BidModel>(sql3, new { auctionModel.ID });
                auctionModel.Bids = bids.ToList();
            }

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

            const string sql2 = @"SELECT ImagePath FROM dbo.ProductPhoto WHERE ProductID = @ID";

            var images = await _db.Connection.QueryAsync<string>(sql2, new { data.FirstOrDefault()?.Product.ID });

            var auctionModel = data.FirstOrDefault();

            if (auctionModel != null)
            {
                auctionModel.Product.Images = images.ToList();
            }

            const string sql3 = @"SELECT * FROM dbo.Bid WHERE AuctionID = @ID";

            var bids = await _db.Connection.QueryAsync<BidModel>(sql3, new { auctionModel?.ID });

            if (auctionModel != null)
            {
                auctionModel.Bids = bids.ToList();
            }

            return auctionModel;
        }
    }
}
