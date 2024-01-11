using System.Data.SqlTypes;

namespace OnlineAuctions.Data.Models
{
    public class UserModel
    {
        public required int NIF { get; set; }
        public required string Name { get; set; }
        public required string Email { get; set; }
        public required DateOnly BirthDate { get; set; }
        public SqlMoney FreeBalance { get; set; } = new SqlMoney(0);
        public SqlMoney PendingBalance { get; set; } = new SqlMoney(0);
    }
}
