using OnlineAuctions.Data.Models;

namespace OnlineAuctions.Data.Services
{
    public interface IModelService
    {
        Task<List<ModelModel>> GetModels();
    }
}
