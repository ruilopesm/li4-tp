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

        public Task CreateBidder(string name, string email, string password, int NIF, DateOnly birthDate)
        {
            var queries = new Dictionary<string, dynamic>
            {
                {
                    @"INSERT INTO dbo.[User] (Name, Email, Password, Role) VALUES (@Name, @Email, @Password, @Role)",
                    new { Name = name, Email = email, Password = password, Role = "Bidder" }
                },
                {
                    @"INSERT INTO dbo.Bidder (NIF, BirthDate, UserId) VALUES (@NIF, @BirthDate, (SELECT Id FROM dbo.[User] WHERE Email = @Email))",
                    new { NIF, BirthDate = birthDate, Email = email }
                }
            };

            return _db.ExecuteTransaction(queries);
        }
    }
}
