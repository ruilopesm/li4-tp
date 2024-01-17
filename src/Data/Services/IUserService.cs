using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IUserService
    {
        Task<List<UserModel>> GetUsers();

        Task<UserModel?> GetUser(string email);
    }
}
