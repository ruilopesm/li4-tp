using Dapper;
using System.Data.SqlClient;

namespace OnlineAuctions.Data
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;
        private readonly SqlConnection _connection;

        public SqlDataAccess(IConfiguration config) {
            _config = config;
            _connection = new SqlConnection(_config.GetConnectionString(ConnectionStringName));
        }

        public string ConnectionStringName { get; set; } = "Default";

        public async Task<List<T>> LoadData<T, U>(string sql, U parameters)
        {
            using (_connection)
            {
                var data = await _connection.QueryAsync<T>(sql, parameters);
                return data.ToList();
            }
        }

        public Task SaveData<T>(string sql, T parameters)
        {
            using (_connection)
            {
                return _connection.ExecuteAsync(sql, parameters);
            }
        }
    }
}
