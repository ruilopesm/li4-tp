namespace OnlineAuctions.Data
{
    public class UserData(ISqlDataAccess db) : IUserData
    {
        private readonly ISqlDataAccess _db = db;

        public Task<List<Models.UserModel>> GetUsers()
        {
            const string sql = "SELECT * FROM dbo.Utilizador";
            return _db.LoadData<Models.UserModel, dynamic>(sql, new { });
        }
    }
}
