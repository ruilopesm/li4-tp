using System.ComponentModel.DataAnnotations;

namespace OnlineAuctions.Data.Validation
{
    public class MinimumAge : ValidationAttribute
    {
        public int RequiredAge { get; }
        
        public MinimumAge(int requiredAge)
        {
            RequiredAge = requiredAge;
        }
        
        public override bool IsValid(object? value)
        {
            return value != null && ((DateOnly)value).AddYears(RequiredAge) <= DateOnly.FromDateTime(DateTime.Now);
        }
    }
}
