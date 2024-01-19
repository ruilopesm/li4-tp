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

        return data.ToList();
    }

    public async Task<int> CreateProduct(string name, string description, int modelId, ProductState state,
        Condition condition)
    {
        const string sql =
            @"INSERT INTO dbo.Product (Name, Description, ModelID, State, Condition) VALUES (@Name, @Description, @ModelID, @State, @Condition); SELECT SCOPE_IDENTITY()";

        var id = await _db.Connection.ExecuteScalarAsync<int>(sql, new
        {
            Name = name,
            Description = description,
            ModelID = modelId,
            State = state,
            Condition = condition
        });

        return id;
    }
}