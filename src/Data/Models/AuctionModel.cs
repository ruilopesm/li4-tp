namespace OnlineAuctions.Data.Models
{
    public class AuctionModel
    {
        public int ID { get; set; }
        public ProductModel Product { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public decimal StartPrice { get; set; }
        public decimal CurrentPrice { get; set; }
        public bool IsCancelled { get; set; }
        public AdminModel Publisher { get; set; }
        public BidderModel Winner { get; set; }
    }
}
