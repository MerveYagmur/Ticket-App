namespace TicketCaseApp;

public class Halls
{
    public string HallId1
    {
        get => HallId;
        set => HallId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeatCount1
    {
        get => SeatCount;
        set => SeatCount = value ?? throw new ArgumentNullException(nameof(value));
    }
    string HallId;
    string SeatCount;
}