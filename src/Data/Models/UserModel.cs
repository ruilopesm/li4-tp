namespace OnlineAuctions.Data.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public Role Role { get; set; }
        public string RoleString => Role.ToString();
        public static Role FromString(string role) => (Role)Enum.Parse(typeof(Role), role);
    }

    public enum Role {
        Bidder,
        Admin
    }

    public class BidderModel : UserModel
    {
        public int NIF { get; set; }
        public DateOnly BirthDate { get; set; }
        public decimal Balance { get; set; }
        public decimal PendingBalance { get; set; }
    }

    public class AdminModel : UserModel
    {
        public int InternalID { get; set; }
        public bool IsMaster { get; set; }
    }
}
