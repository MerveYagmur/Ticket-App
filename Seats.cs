namespace TicketCaseApp;

public class Seats
{
    public string SeanceId1
    {
        get => SeanceId;
        set => SeanceId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeatId1
    {
        get => SeatId;
        set => SeatId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string HallId1
    {
        get => HallId;
        set => HallId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeatNumber1
    {
        get => SeatNumber;
        set => SeatNumber = value ?? throw new ArgumentNullException(nameof(value));
    }
    public bool IsBooked1
    {
        get => IsBooked;
        set => IsBooked = value;
    }
    private string SeatId;
    private string HallId;
    private string SeatNumber;
    private bool IsBooked;
    private string SeanceId;
}