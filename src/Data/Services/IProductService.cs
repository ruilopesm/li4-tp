using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IProductService
{
    Task<ProductModel?> GetProduct(int id);

    Task<List<ProductModel>> GetProducts();

    Task<int> CreateProduct(string description, int modelId, ProductState state,
        Condition condition, List<string> images);
}
