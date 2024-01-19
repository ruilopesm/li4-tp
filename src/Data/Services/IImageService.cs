using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services;

public interface IImageService
{
    Task<List<ImageModel>> GetImages(int productId);
}