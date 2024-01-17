using System.Data.SqlTypes;

namespace OnlineAuctions.Data.Models
{
    public class UserModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        
        public Roles Role { get; set; }
        public BidderModel? Bidder { get; set; }
        public AdminModel? Admin { get; set; }

        public string GetRole()
        {
            return Role switch
            {
                Roles.Bidder => "Bidder",
                Roles.Admin => "Admin",
                _ => throw new NotImplementedException()
            };
        }
    }
    
    public class BidderModel
    {
        public int NIF { get; set; }
        public DateOnly BirthDate { get; set; }
        public SqlMoney Balance { get; set; }
        public SqlMoney PendingBalance { get; set; }
    }

    public class AdminModel
    {
        public bool IsMaster { get; set; } 
    }

    public enum Roles
    {
        Bidder,
        Admin,
    }
}
