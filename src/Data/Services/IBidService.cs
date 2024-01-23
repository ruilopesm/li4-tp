using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IBidService
{
    Task<int> CreateBid(int auctionId, int NIF, decimal amount);

    Task<List<BidModel>> GetBids(int productId);

    Task<List<BidModel>> GetLastUserBids(int NIF);

    Task<BidModel?> GetAuctionLastBid(int auctionId);
}
