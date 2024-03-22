namespace TicketCaseApp;

public class Movies
{
        public string MovieId1
        {
                get => MovieId;
                set => MovieId = value ?? throw new ArgumentNullException(nameof(value));
        }
        public string MovieName1
        {
                get => MovieName;
                set => MovieName = value ?? throw new ArgumentNullException(nameof(value));
        }
        public string Genre1
        {
                get => Genre;
                set => Genre = value ?? throw new ArgumentNullException(nameof(value));
        }
        public string ReleaseYear1
        {
                get => ReleaseYear;
                set => ReleaseYear = value ?? throw new ArgumentNullException(nameof(value));
        }
        public string Director1
        {
                get => Director;
                set => Director = value ?? throw new ArgumentNullException(nameof(value));
        }

        string MovieId;
        string MovieName;
        string Genre;
        string ReleaseYear;
        string Director;
}