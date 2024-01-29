namespace OnlineAuctions.Data.Models
{
    public class ProductModel
    {
        public int ID { get; set; }
        public string? Description { get; set; }
        public List<string> Images { get; set; }
        public ModelModel Model { get; set; }
        public ProductState State { get; set; }
        public static string StateString(ProductState state)
        {
            return state switch
            {
                ProductState.Excellent => "Excelente",
                ProductState.Good => "Bom",
                ProductState.Bad => "Satisfatório",
                _ => "Unknown",
            };
        }
        public Condition Condition { get; set; }
        public static string ConditionString(Condition condition)
        {
            return condition switch
            {
                Condition.Used => "Usado",
                Condition.Refurbished => "Recondicionado",
                Condition.Returned => "Devolvido",
                _ => "Unknown",
            };
        }
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
