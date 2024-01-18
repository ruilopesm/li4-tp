using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public class UserService : IUserService
    {
        private readonly ISqlDataAccess _db;

        public UserService(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<List<UserModel>> GetUsers()
        {
            const string sql = "SELECT * FROM dbo.[User]";
            return _db.LoadData<UserModel, dynamic>(sql, new { });
        }

        public Task<UserModel?> GetUser(string email)
        {
            const string sql = "SELECT * FROM dbo.[User] WHERE Email = @Email";
            return _db.LoadData<UserModel, dynamic>(sql, new { Email = email })
                .ContinueWith(task => task.Result.FirstOrDefault());
        }
    }
}
