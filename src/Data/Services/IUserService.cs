using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IUserService
    {
        Task<List<UserModel>> GetUsers();

        Task<UserModel?> GetUser(string email);

        Task<BidderModel?> GetBidder(string email);

        Task<AdminModel?> GetAdmin(string email);

        Task<List<AdminModel>> GetAdmins();

        Task CreateBidder(string name, string email, string password, int NIF, DateOnly birthDate);

        Task DeleteAdmin(AdminModel adminModel);

        Task<AdminModel> CreateAdmin(string name, string email, string passwordHash);

        Task UpdateAdmin(int adminId, string name, string email, string passwordHash);

        Task UpdateAdmin(int adminId, string name, string email);
    }
}
