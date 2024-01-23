using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IUserService
    {
        Task<List<UserModel>> GetUsers();

        Task<UserModel?> GetUser(string email);

        Task<BidderModel?> GetBidder(string email);

        Task<AdminModel?> GetAdmin(string email);

        Task CreateBidder(string name, string email, string password, int NIF, DateOnly birthDate);
    }
}
