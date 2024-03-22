using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;

namespace TicketCaseApp;
internal class Database
{    //data Source=(server name; DatabaseFilename;), replace the server name of the data source with your own server name
    private SqlConnection _connectString = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=CinemaTicket.mdf;Integrated Security=True; Connect Timeout = 30;");
    public List<Users> UsersList { get; set; } //Database Lists
    public List<Movies> MoviesList { get; set; }
    public List<Halls> HallsList { get; set; }
    public List<Seances> SeancesList { get; set; }
    public List<Tickets> TicketsList { get; set; }
    public List<Seats> SeatsList { get; set; }
    public Database() 
    {
        UsersList = new List<Users>();
        MoviesList = new List<Movies>();
        HallsList = new List<Halls>();
        SeancesList = new List<Seances>();
        TicketsList = new List<Tickets>();
        SeatsList = new List<Seats>();
        GetUser(); //Getting of Values in Lists
        GetMovie();
        GetHall();
        GetSeance();
        GetTicket();
        GetSeat();
    } // Keeping Database Arguments
    private void GetUser()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Users",_connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Users users = new Users();
            users.UserId1 = dataReader[0].ToString();
            users.FirstName1 = dataReader[1].ToString();
            users.LastName1 = dataReader[2].ToString();
            users.Email1 = dataReader[3].ToString();
            users.Password1 = dataReader[4].ToString();
            users.IsAdmin1 = Convert.ToBoolean(dataReader[5]);
            UsersList.Add(users);
        }
        dataReader.Close();
        _connectString.Close();
    } // Reading Values In Database And Keeping It.
    private void GetMovie()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Movies",_connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Movies movies = new Movies();
            movies.MovieId1 = dataReader[0].ToString();
            movies.MovieName1 = dataReader[1].ToString();
            movies.Genre1 = dataReader[2].ToString();
            movies.ReleaseYear1 = dataReader[3].ToString();
            movies.Director1 = dataReader[4].ToString();
            MoviesList.Add(movies);
        }
        dataReader.Close();
        _connectString.Close();
    }
    private void GetHall()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Halls",_connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Halls halls = new Halls();
            halls.HallId1 = dataReader[0].ToString();
            halls.SeatCount1 = dataReader[1].ToString();
            HallsList.Add(halls);
        }
        dataReader.Close();
        _connectString.Close();
    }
    private void GetSeance()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Seances", _connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Seances seances = new Seances();
            seances.SeanceId1 = dataReader[0].ToString();
            seances.HallId1 = dataReader[1].ToString();
            seances.MovieId1 = dataReader[2].ToString();
            seances.SeanceTime1 = dataReader[3].ToString();
            seances.SeanceDate1 = dataReader[4].ToString();
            SeancesList.Add(seances);
        }
        dataReader.Close();
        _connectString.Close();
    }
    private void GetTicket()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Tickets",_connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Tickets tickets = new Tickets();
            tickets.TicketId1 = dataReader[0].ToString();
            tickets.UserId1 = dataReader[1].ToString();
            tickets.SeanceId1 = dataReader[2].ToString();
            tickets.SeatNumber1 = dataReader[3].ToString();
            TicketsList.Add(tickets);
        }
        dataReader.Close();
        _connectString.Close();
    }
    private void GetSeat()
    {
        _connectString.Open();
        SqlCommand cmd = new SqlCommand("Select * from Seats",_connectString);
        SqlDataReader dataReader = cmd.ExecuteReader();
        while (dataReader.Read())
        {
            Seats seats = new Seats();
            seats.SeatId1 = dataReader[0].ToString();
            seats.HallId1 = dataReader[1].ToString();
            seats.SeatNumber1 = dataReader[2].ToString();
            seats.IsBooked1 = Convert.ToBoolean(dataReader[3]);
            seats.SeanceId1 = dataReader[4].ToString();
            SeatsList.Add(seats);
        }
        dataReader.Close();
        _connectString.Close();
    }
    public void UpdateUser(Users user)
    {

        string save = "Insert Into Users (FirstName, LastName, Email, Password, IsAdmin) values (@firstname,@lastName,@email,@password,@IsAdmin);";
        SqlCommand cmd = new SqlCommand(save, _connectString);
        cmd.Parameters.AddWithValue("@firstname", user.FirstName1);
        cmd.Parameters.AddWithValue("@lastName", user.LastName1);
        cmd.Parameters.AddWithValue("@email", user.Email1);
        cmd.Parameters.AddWithValue("@password", user.Password1);
        cmd.Parameters.AddWithValue("@IsAdmin", user.IsAdmin1);
        _connectString.Open();
        cmd.ExecuteNonQuery();
        _connectString.Close();
    } //Process Add User
    public void FindTicket(Users user,string choose)
    {
        _connectString.Open();
        string save = "SELECT S.SeanceDate, S.SeanceTime, S.HallId, M.MovieName, T.SeatNumber, T.IsConfirm, T.TicketID\n" +
                      "FROM Seances AS S \nINNER JOIN Movies AS M ON S.MovieID = M.MovieID \n" +
                      "INNER JOIN Tickets AS T ON S.SeanceID = T.SeanceID \n" +
                      "WHERE T.UserID = @id;\n";
        SqlCommand cmd = new SqlCommand(save, _connectString);
        cmd.Parameters.AddWithValue("@id",user.UserId1 );

        SqlDataReader reader = cmd.ExecuteReader();
        
        if (choose == "request") //Find Request Tickets
        {
            while (reader.Read())
            {
                string seanceDate = reader[0].ToString();
                string seanceTime = reader[1].ToString();
                string hallId = reader[2].ToString();
                string movieName = reader[3].ToString();
                string seatNumber = reader[4].ToString();
                bool isConfirm = Convert.ToBoolean(reader[5]);
                string ticketId = reader[6].ToString();
                if (isConfirm == false)
                {
                    string output = $"Id: {ticketId} \t| Film Adı: {movieName}\t| Seans: {seanceDate.Substring(0, 10)} {seanceTime}\t| Salon: {hallId}\t| Koltuk: {seatNumber}";
                    Console.WriteLine(output);
                }
            } 
        }
        else // Find Current Ticket
        {
            while (reader.Read())
            {
                string seanceDate = reader[0].ToString();
                string seanceTime = reader[1].ToString();
                string hallId = reader[2].ToString();
                string movieName = reader[3].ToString();
                string seatNumber = reader[4].ToString();
                bool isConfirm = Convert.ToBoolean(reader[5]);
                if (isConfirm)
                {
                    string output = $"Film Adı: {movieName}\t| Seans: {seanceDate.Substring(0, 10)} {seanceTime}\t| Salon: {hallId}\t| Koltuk: {seatNumber}";
                    Console.WriteLine(output);
                }
            }
        }
        reader.Close();
        cmd.ExecuteNonQuery();
        _connectString.Close(); 
    } // Process (Find Tickets)
    public void NewTickets(Tickets t)
    {
        string save = "Insert Into Tickets (userid, seanceid, seatnumber,IsConfirm) values (@userid,@seanceid,@seatnumber,0);";
        SqlCommand cmd = new SqlCommand(save, _connectString);
        cmd.Parameters.AddWithValue("@userid", t.UserId1);
        cmd.Parameters.AddWithValue("@seanceid", t.SeanceId1);
        cmd.Parameters.AddWithValue("@seatnumber", t.SeatNumber1);
        UpdateSeat(t.SeatNumber1,t.SeanceId1); //Call Method
        Console.WriteLine("Bilet alma işlemi başarıyla tamamlanmıştır. " +
                          "\n Admin Onayladıktan Sonra Biletlerim Sekmesinden Biletinizi Görebilirsiniz." +
                          "\n İyi seyirler dileriz :)");
        _connectString.Open();
        cmd.ExecuteNonQuery();
        _connectString.Close();
    } // Process (Creat new Ticket)
    public void UpdateTicket(Tickets t)
    {
        string save = "Update Tickets Set IsConfirm= '1' where TicketID=@ID;";

        SqlCommand cmd = new SqlCommand(save, _connectString);
        cmd.Parameters.AddWithValue("@ID", t.TicketId1);
        _connectString.Open();
        cmd.ExecuteNonQuery();
        _connectString.Close();
    } //Process (Update Ticket), Confirm Ticket
    public void UpdateSeat(string SeatNo, string Seance)
    {
        string save = "UPDATE Seats SET IsBooked = 1  WHERE SeatNumber= @N AND SeanceID=@S;";
        SqlCommand cmd = new SqlCommand(save, _connectString);
        cmd.Parameters.AddWithValue("@N", SeatNo);
        cmd.Parameters.AddWithValue("@S", Seance);
        _connectString.Open();
        cmd.ExecuteNonQuery();
        _connectString.Close();
    } //Process (Update Seat), Buy Ticket
}

