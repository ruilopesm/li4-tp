using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IProductService
{
    Task<List<ProductModel>> GetProducts();

    Task<ProductModel> CreateProduct(int modelId, ProductState state, Condition condition, string description, List<string> images);

    Task UpdateProduct(int productId, int modelId, ProductState state, Condition condition, string description, List<string> images);

    Task DeleteProduct(int productId);
}
