using System.Data.SqlTypes;

namespace OnlineAuctions.Data.Models
{
    public class AuctionModel
    {
        public int ID { get; set; }
        public ProductModel Product { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public SqlMoney StartPrice { get; set; }
        public SqlMoney CurrentPrice { get; set; }
        public AuctionState State { get; set; }
        public string StateString => State.ToString();
        public AdminModel Publisher { get; set; }
        public BidderModel? Winner { get; set; }
    }
    
    public enum AuctionState {
        Open,
        Closed,
        Canceled
    }
}
