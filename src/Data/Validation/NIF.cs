using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace OnlineAuctions.Data.Validation
{
    public class NIF : ValidationAttribute
    {
        public override bool IsValid(object? value)
        {
            return IsValidNIF(value?.ToString() ?? string.Empty);
        }

        private static bool IsValidNIF(string nifNumber)
        {
            string filteredNumber = Regex.Match(nifNumber, @"[0-9]+").Value;
            if (filteredNumber.Length != 9 || int.Parse(filteredNumber[0].ToString()) == 0) { return false; }

            int checkSum = 0;
            for (int i = 0; i < 9 - 1; i++)
            {
                checkSum += int.Parse(filteredNumber[i].ToString())*(9 - i);
            }

            int verificationDigit = 11-(checkSum % 11);
                
            if (verificationDigit > 9) { verificationDigit = 0; }
            return verificationDigit == int.Parse(filteredNumber[9 - 1].ToString());

        }
    }
}
