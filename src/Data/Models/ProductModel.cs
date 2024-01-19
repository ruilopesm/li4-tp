namespace OnlineAuctions.Data.Models
{
    public class ProductModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public ModelModel Model { get; set; }
        public ProductState State { get; set; }
        public string StateString => State.ToString();
        public Condition Condition { get; set; }
    }

    public enum ProductState {
        Excellent,
        Good,
        Bad,
    }

    public enum Condition {
        Used,
        Refurbished,
        Returned,
    }
}
