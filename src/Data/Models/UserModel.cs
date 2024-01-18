using System.Data.SqlTypes;

namespace OnlineAuctions.Data.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }

        // TODO: Should be an hash
        public string Password { get; set; }
        
        public Roles Role { get; set; }
        public string RoleString => Role.ToString();
    }

    public enum Roles {
        Bidder,
        Admin
    }

    public class BidderModel : UserModel
    {
        public int NIF { get; set; }
        public DateOnly BirthDate { get; set; }
        public SqlMoney Balance { get; set; }
        public SqlMoney PendingBalance { get; set; }
    }

    public class AdminModel : UserModel
    {
        public int InternalID { get; set; }
        public bool IsMater { get; set; }
    }
}
