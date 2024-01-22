using Dapper;
using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public class ProductService : IProductService
{
    private readonly ISqlDataAccess _db;

    public ProductService(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<ProductModel?> GetProduct(int id)
    {
        const string sql =
            @"SELECT * FROM dbo.Product LEFT JOIN dbo.Model ON Product.ModelID = Model.ID WHERE Product.ID = @ID";

        var data = await _db.Connection.QueryAsync<ProductModel, ModelModel, ProductModel>(sql, (product, model) =>
        {
            product.Model = model;
            return product;
        }, new { ID = id }, splitOn: "ID");

        // TODO: load images from the other table

        return data.FirstOrDefault();
    }

    public async Task<List<ProductModel>> GetProducts()
    {
        const string sql =
            @"SELECT * FROM dbo.Product LEFT JOIN dbo.Model ON Product.ModelID = Model.ID";

        var data = await _db.Connection.QueryAsync<ProductModel, ModelModel, ProductModel>(sql, (product, model) =>
        {
            product.Model = model;
            return product;
        }, splitOn: "ID");

        // TODO: load images from the other table

        return data.ToList();
    }

    public async Task<int> CreateProduct(string description, int modelId, ProductState state,
        Condition condition, List<string> imagePaths)
    {
        const string sql =
            @"INSERT INTO dbo.Product (Description, ModelID, State, Condition) VALUES (@Description, @ModelID, @State, @Condition); SELECT SCOPE_IDENTITY()";

        var id = await _db.Connection.ExecuteScalarAsync<int>(sql, new
        {
            Description = description,
            ModelID = modelId,
            State = state,
            Condition = condition
        });

        foreach (var imagePath in imagePaths)
        {
            const string sql2 =
                @"INSERT INTO dbo.ProductPhoto (ProductID, Path) VALUES (@ProductID, @Path)";

            await _db.Connection.ExecuteAsync(sql2, new
            {
                ProductID = id,
                Path = imagePath
            });
        }

        return id;
    }
}