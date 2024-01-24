namespace OnlineAuctions.Data.Models;

public class BidModel
{
    public int Id { get; }
    public AuctionModel Auction { get; set; }
    public BidderModel Bidder { get; set; }
    public decimal Value { get; }
    public DateTime Date { get; }
}
