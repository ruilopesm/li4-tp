using Dapper;
using OnlineAuctions.Data.Utils;
using System.Data.SqlClient;

namespace OnlineAuctions.Data
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;
        private readonly SqlConnection _connection;

        public SqlDataAccess(IConfiguration config) {
            _config = config;
            _connection = new SqlConnection(_config.GetConnectionString("Default"));

            SqlMapper.AddTypeHandler(new SqlDateOnlyTypeHandler());
            SqlMapper.AddTypeHandler(new SqlTimeOnlyTypeHandler());
        }

        public SqlConnection Connection => _connection;

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

        public Task ExecuteTransaction<T>(Dictionary<string, T> queries)
        {
            using (_connection)
            {
                _connection.Open();

                using var transaction = _connection.BeginTransaction();
                try
                {
                    foreach (var query in queries)
                    {
                        _connection.Execute(query.Key, query.Value, transaction);
                    }

                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }
            }

            return Task.CompletedTask;
        }
    }
}
