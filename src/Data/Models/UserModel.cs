namespace OnlineAuctions.Data.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        // TODO: Should be an hash
        public string Password { get; set; }
        public Role Role { get; set; }
        public string RoleString => Role.ToString();
    }

    public enum Role {
        Bidder,
        Admin
    }

    public class BidderModel : UserModel
    {
        public int NIF { get; set; }
        public DateOnly BirthDate { get; set; }
        public int Balance { get; set; }
        public int PendingBalance { get; set; }
    }

    public class AdminModel : UserModel
    {
        public int InternalID { get; set; }
        public bool IsMater { get; set; }
    }
}
