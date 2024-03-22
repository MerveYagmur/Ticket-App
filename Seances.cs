namespace TicketCaseApp;

public class Seances
{
    public string SeanceId1
    {
        get => SeanceId;
        set => SeanceId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string HallId1
    {
        get => HallId;
        set => HallId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string MovieId1
    {
        get => MovieId;
        set => MovieId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeanceTime1
    {
        get => SeanceTime;
        set => SeanceTime = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string SeanceDate1
    {
        get => SeanceDate;
        set => SeanceDate = value ?? throw new ArgumentNullException(nameof(value));
    }

    string SeanceId;
    string HallId;
    string MovieId;
    string SeanceTime;
    string SeanceDate;
}