using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data
{
    public interface IUserData
    {
        Task<List<UserModel>> GetUsers();
    }
}
