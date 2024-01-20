namespace OnlineAuctions.Shared
{
    public static class ViewUtils
    {
        public static string GetRelativeTimeSpan(DateTime dateTime)
        {
            DateTime now = DateTime.Now;
            TimeSpan diff = now.Subtract(dateTime);
            bool isFuture = diff.TotalSeconds < 0;
            string prefix = isFuture ? "Termina em" : "Terminou há";
            string suffix = !isFuture ? "atrás" : string.Empty;
            string result = string.Empty;

            if (diff.TotalSeconds < 60)
                result = $"{diff.Seconds} {(diff.Seconds == 1 ? "segundo" : "segundos")}";
            else if (diff.TotalMinutes < 60)
                result = $"{diff.Minutes} {(diff.Minutes == 1 ? "minuto" : "minutos")}";
            else if (diff.TotalHours < 24)
                result = $"{diff.Hours} {(diff.Hours == 1 ? "hora" : "horas")}";
            else if (diff.TotalDays < 7)
                result = $"{diff.Days} {(diff.Days == 1 ? "dia" : "dias")}";
            else if (diff.TotalDays < 30)
                result = $"{diff.Days / 7} {(diff.Days / 7 == 1 ? "semana" : "semanas")}";
            else if (diff.TotalDays < 365)
                result = $"{diff.Days / 30} {(diff.Days / 30 == 1 ? "mês" : "meses")}";
            else
                result = $"{diff.Days / 365} {(diff.Days / 365 == 1 ? "ano" : "anos")}";

            return $"{prefix} {result} {suffix}";
        }
    }
}
