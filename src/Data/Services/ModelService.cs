using Dapper;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public class ModelService : IModelService
{
    private readonly ISqlDataAccess _db;

    public ModelService(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<List<ModelModel>> GetModels()
    {
        const string sql = 
            @"SELECT * FROM dbo.Model";

        var data = await _db.Connection.QueryAsync<ModelModel>(sql);

        return data.ToList();
    }
}
