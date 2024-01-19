using Dapper;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public class ImageService : IImageService
{
    private readonly ISqlDataAccess _db;

    public ImageService(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<List<ImageModel>> GetImages(int productId)
    {
        const string sql = "SELECT * FROM dbo.Image WHERE ProductID = @ProductId";

        var data = await _db.Connection.QueryAsync<ImageModel>(sql, new { ProductId = productId });

        return data.ToList();
    }
}