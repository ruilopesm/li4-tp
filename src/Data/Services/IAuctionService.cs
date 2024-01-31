using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IAuctionService
    {
        Task<List<AuctionModel>> GetAuctions();

        Task<AuctionModel?> GetAuction(int id);

        Task<List<AuctionModel>> GetUserWonAuctions(int nif);

        Task<AuctionModel?> GetProductAuction(int productId);

        Task<AuctionModel> CreateAuction(int productId, DateTime start, DateTime end, decimal startPrice, int publisherId);

        Task<bool> HasAdminCreatedAnyAuction(int adminId);

        Task CancelAuction(int id);

        Task SetWinner(int auctionId, int winnerId);
    }
}
