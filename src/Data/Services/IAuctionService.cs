using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IAuctionService
    {
        Task<List<AuctionModel>> GetAuctions();
    }
}
