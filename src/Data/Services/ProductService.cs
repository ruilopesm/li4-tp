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
        const string sql = @"SELECT * FROM dbo.Product LEFT JOIN dbo.Model ON Product.ModelID = Model.ID WHERE Product.ID = @ID";

        var data = await _db.Connection.QueryAsync<ProductModel, ModelModel, ProductModel>(sql, (product, model) =>
        {
            product.Model = model;
            return product;
        }, new { ID = id }, splitOn: "ID");

        const string sql2 = @"SELECT ImagePath FROM dbo.ProductPhoto WHERE ProductID = @ID";

        var images = await _db.Connection.QueryAsync<string>(sql2, new { ID = id });

        var productModel = data.FirstOrDefault();

        if (productModel != null)
        {
            productModel.Images = images.ToList();
        }

        return productModel;
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

        const string sql2 = @"SELECT ImagePath FROM dbo.ProductPhoto WHERE ProductID = @ID";

        foreach (var productModel in data)
        {
            var images = await _db.Connection.QueryAsync<string>(sql2, new { productModel.ID });
            productModel.Images = images.ToList();
        }

        return data.ToList();
    }

    public async Task<int> CreateProduct(string description, int modelId, ProductState state, Condition condition, List<string> images)
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

        foreach (var image in images)
        {
            const string sql2 =
                @"INSERT INTO dbo.ProductPhoto (ProductID, ImagePath) VALUES (@ProductID, @Image)";

            await _db.Connection.ExecuteAsync(sql2, new
            {
                ProductID = id,
                Image = image
            });
        }

        return id;
    }
}
