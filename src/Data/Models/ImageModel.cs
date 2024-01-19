namespace OnlineAuctions.Data.Models;

public class ImageModel
{
    public int Id { get; }
    public int ProductId { get; }
    public string Path { get; }

    public ImageModel(int id, int productId, string path)
    {
        Id = id;
        ProductId = productId;
        Path = path;
    }
}