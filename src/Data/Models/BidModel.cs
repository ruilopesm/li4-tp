namespace OnlineAuctions.Data.Models;

public class BidModel
{
    public int Id { get; }
    public int AuctionId { get; }
    public int BidderNif { get; }
    public int Amount { get; }
    public DateTime Date { get; }
}
