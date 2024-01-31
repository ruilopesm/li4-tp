using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IBidService
{
    Task<BidModel> CreateBid(int auctionId, int NIF, decimal amount);

    Task<BidModel?> GetBid(int id);

    Task<List<BidModel>> GetBids(int auctionId);

    Task<int> GetTotalBids(int auctionId);

    Task<List<BidModel>> GetLastUserBids(int NIF);

    Task<BidModel?> GetAuctionLastBid(int auctionId);

    Task<int> GetTotalBidsInAuction(int auctionId);
}
