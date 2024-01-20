namespace OnlineAuctions.Data.Models
{
    public class ProductModel
    {
        public int ID { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public ModelModel Model { get; set; }
        public ProductState State { get; set; }
        public string StateString()
        {
            return State switch
            {
                ProductState.Excellent => "Excelente",
                ProductState.Good => "Bom",
                ProductState.Bad => "Satisfatório",
                _ => "Unknown",
            };
        }
        public Condition Condition { get; set; }
        public string ConditionString()
        {
            return Condition switch
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
