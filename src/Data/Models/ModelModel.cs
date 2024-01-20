namespace OnlineAuctions.Data.Models
{
    public class ModelModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        // TODO: Should be an enum, which would map to css colors
        public string Color { get; set; }
        public string Storage { get; set; }
    }
}
