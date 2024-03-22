namespace TicketCaseApp;

public class Tickets
{
    public string TicketId1
    {
        get => TicketId;
        set => TicketId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string UserId1
    {
        get => UserId;
        set => UserId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeanceId1
    {
        get => SeanceId;
        set => SeanceId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeatNumber1
    {
        get => SeatNumber;
        set => SeatNumber = value ?? throw new ArgumentNullException(nameof(value));
    }

    string TicketId;
    string UserId;
    string SeanceId;
    string SeatNumber;
}