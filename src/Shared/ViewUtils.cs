using Humanizer;

namespace OnlineAuctions.Shared
{
    public static class ViewUtils
    {
        public static string PrettyDisplayDateTime(DateTime dateTime)
        {
            string prettyPrinted = dateTime.Humanize(culture: new("pt-PT"));

            if (prettyPrinted == "ontem")
            {
                return "Terminou " + prettyPrinted;
            }

            DateTime now = DateTime.Now;
            if (dateTime > now)
            {
                return "Termina " + prettyPrinted;
            }

            if (dateTime == now)
            {   
                return "Terminou " + prettyPrinted;
            }

            return "Terminou há " + prettyPrinted;
        }
    }
}
