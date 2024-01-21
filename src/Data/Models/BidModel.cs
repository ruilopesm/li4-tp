namespace OnlineAuctions.Data.Models;

public class BidModel
{
    public int Id { get; }
    public int AuctionId { get; }
    public int BidderNif { get; }
    public decimal Amount { get; }
    public DateTime Date { get; }
}