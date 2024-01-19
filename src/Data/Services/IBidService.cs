using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IBidService
{
    Task<int> CreateBid(int auctionId, int nif, decimal amount);

    Task<List<BidModel>> GetBids(int productId);
}