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

        public Task<BidderModel?> GetBidder(string email)
        {
            const string sql = @"
                SELECT * FROM dbo.[User] AS u
                INNER JOIN dbo.Bidder AS b ON u.Id = b.UserId
                WHERE u.Email = @Email
            ";
            return _db.LoadData<BidderModel, dynamic>(sql, new { Email = email })
                .ContinueWith(task => task.Result.FirstOrDefault());
        }

        public Task<AdminModel?> GetAdmin(string email)
        {
            const string sql = @"
                SELECT * FROM dbo.[User] AS u
                INNER JOIN dbo.Admin AS a ON u.Id = a.UserId
                WHERE u.Email = @Email
            ";
            return _db.LoadData<AdminModel, dynamic>(sql, new { Email = email })
                .ContinueWith(task => task.Result.FirstOrDefault());
        }

        public Task<List<AdminModel>> GetAdmins()
        {
            const string sql = @"
                SELECT * FROM dbo.[User] AS u
                INNER JOIN dbo.Admin AS a ON u.Id = a.UserId
                ORDER BY a.InternalId ASC
            ";
            return _db.LoadData<AdminModel, dynamic>(sql, new { });
        }

        public Task CreateBidder(string name, string email, string passwordHash, int NIF, DateOnly birthDate)
        {
            var queries = new Dictionary<string, dynamic>
            {
                {
                    @"INSERT INTO dbo.[User] (Name, Email, PasswordHash, Role) VALUES (@Name, @Email, @PasswordHash, @Role)",
                    new { Name = name, Email = email, PasswordHash = passwordHash, Role = "Bidder" }
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
