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

        public async Task<List<AuctionModel>> GetUserWonAuctions(int nif)
        {
            const string sql =
                @"SELECT * FROM dbo.Auction a
                LEFT JOIN dbo.Product p ON a.ProductID = p.ID
                LEFT JOIN dbo.Model m ON p.ModelID = m.ID
                LEFT JOIN dbo.Admin ad ON a.PublisherID = ad.InternalID
                LEFT JOIN dbo.Bidder b ON a.WinnerID = b.NIF
                WHERE a.WinnerID = @NIF
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
                new { NIF = nif },
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

        public async Task<AuctionModel?> GetProductAuction(int productId)
        {
            const string sql = @"SELECT * FROM dbo.Auction WHERE ProductID = @ID";

            var data = await _db.Connection.QueryAsync<AuctionModel>(sql, new { ID = productId });

            return data.FirstOrDefault();
        }

        public async Task<AuctionModel> CreateAuction(int productId, DateTime start, DateTime end, decimal startPrice, int publisherId)
        {
            const string sql = 
                @"INSERT INTO dbo.Auction (ProductID, Start, [End], StartPrice, CurrentPrice, PublisherID) VALUES (@ProductID, @Start, @End, @StartPrice, @CurrentPrice, @PublisherID)";

            var id = await _db.Connection.ExecuteScalarAsync<int>(sql, new
            {
                ProductID = productId,
                Start = start,
                End = end,
                StartPrice = startPrice,
                CurrentPrice = startPrice,
                PublisherID = publisherId
            });

            return (await GetAuction(id))!;
        }

        public async Task<bool> HasAdminCreatedAnyAuction(int adminId)
        {
            const string sql = @"SELECT * FROM dbo.Auction WHERE PublisherID = @ID";

            var data = await _db.Connection.QueryAsync<AuctionModel>(sql, new { ID = adminId });

            return data.Any();
        }
    }
}
