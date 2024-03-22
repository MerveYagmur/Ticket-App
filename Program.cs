using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TicketCaseApp;
class Program
{ 
    public static void ShowMenu() 
    {
        Console.Clear();
        Console.WriteLine("\n\n Cinema Bileti Uygulamasına Hoşgeldiniz!" + "\n***************************************");
        Console.WriteLine(" 1:Giriş Yap");
        Console.WriteLine(" 2:Kayıt Ol");
        Console.WriteLine(" 3:Vizyondaki Filmleri Göster");
        Console.WriteLine(" 4:Uygulamadan Çıkış Yap");
        Console.WriteLine("\n***************************************\n");
        Console.Write(" Yukarıdaki İşlemlerden İstediğinizi Seçiniz:");

        var choose = Console.ReadLine(); //User's choice
        switch (choose)
        {
            case "1":
                Login();
                break;
            case "2":
                SignUp();
                break;
            case "3":
                Console.Clear();
                MovieList();
                Console.WriteLine("Ana Menüye Dönmek İçin Bir Tuşa Basınız:");
                Console.ReadLine();
                ShowMenu();
                break;
            case "4":
                Console.Clear();
                System.Environment.Exit(1);
                break;
            default:
                Console.WriteLine("Geçersiz Karakter Girişi Yaptınız!" + " \n Lütfen Tekrar Giriş Yapın.");
                ShowMenu();
                break;
        }
    } //Show Main Menu Screen
    public static void Login() 
    {
        Console.Clear();
        Console.WriteLine("\n \n Giriş Yap" +"\n****************");
        Console.Write("Email: ");
        string email = Console.ReadLine();
        Console.Write("Password: ");
        string password = Console.ReadLine();
        bool current = false;
        Console.Clear();

        foreach (var people in new Database().UsersList)
        {
            if (people.Email1 == email && people.Password1 == password)
            {
                current = true;
                switch (people.IsAdmin1)
                {
                    case true:
                        Console.WriteLine($"Admin Girişi Başarılı. Hoşgeldin {people.FirstName1} {people.LastName1}");
                        Console.WriteLine("Admin Paneline Geçiş Yapmak İçin Bir Tuşa Basınız:");
                        Console.ReadLine();
                        AdminPanel(people);
                        break;
                    case false:
                        Console.WriteLine($"Üye Girişi Başarılı. Hoşgeldin {people.FirstName1} {people.LastName1}");
                        Console.WriteLine("Üye Paneline Geçiş Yapmak İçin Bir Tuşa Basınız:");
                        Console.ReadLine();
                        UserPanel(people);
                        break;
                }
                break;
            }
        }
        if (current==false)
        {
            Console.WriteLine("Hatalı Giriş Yaptınız!" + "\nLütfen Aşağıdaki Girişlerden Birini Seçiniz." +
                              "\n \t *************************************************");
            Console.WriteLine("1-Ana Menü" + "\n2-Giriş Yap\n");
            Console.Write("Seçiminiz:");
            var choose = Console.ReadLine();
            switch (choose)
            {
                case "1":
                    ShowMenu();
                    break;
                case "2":
                    Login();
                    break;
                default:
                    Console.WriteLine("Lütfen Geçerli Bir Giriş Yapınız.");
                    break;
            }
        }
    } //Show Login Screen
    public static void SignUp() 
    {
        Console.Clear();
        Console.WriteLine("\n Kayıt Ol" + "\n*****************");
        
        var invalidUser = true;
        while (invalidUser)
        {
            Console.Write("Firstname: ");
            var firstname = Console.ReadLine();
            Console.Write("Lastname: ");
            var lastname = Console.ReadLine();
            Console.Write("Email: ");
            var email = Console.ReadLine();
            Console.Write("Password: ");
            var password = Console.ReadLine();
            Console.Write("Password Again: ");
            var password2 = Console.ReadLine();

            var emailValidation = true;
            if (password == password2)
            {
                foreach (var currentUser in new Database().UsersList)
                {
                    if (email == currentUser.Email1)
                    {
                        emailValidation = false;
                        invalidUser = true;
                        Console.Clear();
                        Console.WriteLine($"Bu Email Kullanılmaktadır! : {email}");
                        break;
                    }
                }
                if (emailValidation)
                {
                    invalidUser = false;
                    var newUser = new Users()
                        { FirstName1 = firstname, LastName1 = lastname, Email1 = email, Password1 = password, IsAdmin1 = false};
                    Database data = new Database();
                    data.UpdateUser(newUser); //Calling This Method From The "Database" Class.
                    Console.Clear();
                    Console.WriteLine($"Başarılı Kayıt! Hoşgeldiniz {firstname} {lastname}\n"+ "****************");
                    Console.WriteLine("Giriş Menüsüne Dönmek İçin Bir Tuşa Basınız:");
                    Console.ReadLine();
                    Login();
                }
            }
            else
            {
                Console.Clear();
                Console.WriteLine("Şifreler Uyuşmuyor!\n");
            }
        }
    } //Show Sign-Up Screen
    public static void MovieList()
    {
        Console.WriteLine("Vizyondaki Filmler" + "*******************");
        foreach (var m in new Database().MoviesList)
        {
            string no = m.MovieId1;
            Console.WriteLine($"{no}."+ "Film Adı:" + m.MovieName1+ "\t|" + "Türü:" + m.Genre1 + "\t|" +
                              "Yönetmeni:" + m.Director1);
        }
    } //Show Movie List
    public static void UserPanel(Users people)
    {
        Console.Clear();
        Console.WriteLine("\n***************************************");
        Console.WriteLine(" 1:Biletlerim");
        Console.WriteLine(" 2:Yeni Bilet");
        Console.WriteLine(" 3:Ana Menü");
        Console.WriteLine(" 4:Uygulamadan Çıkış Yap");
        Console.WriteLine("\n***************************************\n");
        Console.Write(" Yukarıdaki İşlemlerden İstediğinizi Seçiniz:");
        
        var choose = Console.ReadLine();
        switch (choose)
        {
            case "1":
                MyTickets(people);
                break;
            case "2":
                BuyTicket(people);
                break;
            case "3":
                ShowMenu();
                break;
            case "4":
                Console.Clear();
                System.Environment.Exit(1);
                break;
            default:
                Console.WriteLine("Geçersiz Karakter Girişi Yaptınız!" + " \n Lütfen Tekrar Giriş Yapın.");
                UserPanel(people);
                break;
        }
    } //Show User Panel
    public static void MyTickets(Users people)
    {
        Console.Clear();
        Console.WriteLine("Biletlerim" + "\n*******************");
        Database data = new Database();
        string choose = "";
        data.FindTicket(people,choose);//Calling This Method From The "Database" Class.
        Console.WriteLine("Üye Paneline Dönmek İçin Bir Tuşa Basınız:");
        Console.ReadLine();

        if (people.IsAdmin1 == true) //Because Two Panels Call This Method
        {
            AdminPanel(people);
        }
        else
        {
            UserPanel(people);
        }
    } //Show Tickets
    public static void BuyTicket(Users people)
    {
        Database data = new Database();
        Seances MovieInfo = new Seances(); //Used To Access "Seance ID" And "Hall ID"
        Tickets NewTicket = new Tickets(); //Used To Save New Ticket Informations
        NewTicket.UserId1 = people.UserId1;
        Console.Clear();
        Console.WriteLine("Yeni Bilet Almak İçin" +"*******************");
        MovieList();//Call Method
        Console.Write("Bir Film Seçiniz:");
        MovieInfo.MovieId1=Console.ReadLine();
        Console.Clear();
        
        foreach (var s in new Database().SeancesList)//Scanning Of "SeancesList"
        {
            if (MovieInfo.MovieId1 == s.MovieId1)
            {
                string no=s.SeanceId1;
                Console.WriteLine($"Seans: {no}"+ "\t|" + "Bilgiler: " +"Salon: " + s.HallId1 + "\t|" 
                                  + "Gün:" + s.SeanceDate1.Substring(0,10) + "\t|" 
                                  + "Saat: " + s.SeanceTime1);
            }
        }
        Console.Write("Seanslardan birini seçiniz:");
        NewTicket.SeanceId1=MovieInfo.SeanceId1 = Console.ReadLine();
        Console.Clear();
        
        int count = 0; // Variable Is Keeping Count Of "seat".
        foreach (var t in new Database().SeatsList)//Scanning Of "SeancesList"
        {
            if (t.IsBooked1==false && MovieInfo.SeanceId1 == t.SeanceId1)
            {
                Console.Write("|" + t.SeatNumber1 + "|\t");
                count++;
                if (count == 5)
                {
                    Console.WriteLine(); 
                    count = 0;
                }
            }
        }

        Console.WriteLine("\n*************************");
        Console.Write("\n Koltuk Numaranızı seçiniz:");
        NewTicket.SeatNumber1 = Console.ReadLine();
        
        data.NewTickets(NewTicket);//Calling This Method From The "Database" Class.
        Console.WriteLine("Üye Paneline Dönmek İçin Bir Tuşa Basınız:");
        Console.ReadLine();
        UserPanel(people);
    } // Buy Ticket Screen
    public static void AdminPanel(Users people)
    {
        Console.Clear();
        Console.WriteLine("\n***************************************");
        Console.WriteLine(" 1:Biletlerim");
        Console.WriteLine(" 2:Bilet İstekleri");
        Console.WriteLine(" 3:Üyeleri Listele");
        Console.WriteLine(" 4:Ana Menü");
        Console.WriteLine(" 5:Uygulamadan Çıkış Yap");
        Console.WriteLine("\n***************************************\n");
        Console.Write(" Yukarıdaki işlemlerden istediğinizi seçiniz:");
        var choose = Console.ReadLine();
        switch (choose)
        {
            case "1":
                MyTickets(people);
                break;
            case "2":
                RequestTicket(people);
                break;
            case "3":
                UserList(people);
                break;
            case "4":
                ShowMenu();
                break;
            case "5":
                Console.Clear();
                System.Environment.Exit(1);
                break;
            default:
                Console.WriteLine("Geçersiz Karakter Girişi Yaptınız!" +
                                  " \n Lütfen Tekrar Giriş Yapın.");
                AdminPanel(people);
                break;
        }
    } //Show Admin Panel
    public static void UserList(Users people)
    {
        Console.Clear();
        Console.WriteLine("Üyeler" + "\n*******************");
        foreach (var u in new Database().UsersList)
        {
            Console.WriteLine("Üye Adı:" + u.FirstName1+ " "+ u.LastName1+ "\t|" + "Email:" + u.Email1);
        }
        Console.WriteLine("Ana Menüye Dönmek İçin Bir Tuşa Basınız:");
        Console.ReadLine();   
        AdminPanel(people);
    } // Show User List
    public static void RequestTicket(Users people)
    {
        Console.Clear();
        Console.WriteLine("Bekleyen İstekler");
        Console.WriteLine("*******************");
        string choose = "request"; //FindTicket(): (List Request Ticket) + (List Current Ticket)
        bool request = true;
        string loop = "";//Variable Is Keeping  Request Of "Continue Confirm".
        Tickets t = new Tickets();
        var data = new Database();
        foreach (var u in new Database().UsersList)
        {
            data.FindTicket(u,choose); //Calling This Method From The "Database" Class.
        }
        while (request)
        {
            Console.Write("Onaylamak İstediğiniz Biletin Id sini Giriniz: ");
            t.TicketId1 = Console.ReadLine();
            data.UpdateTicket(t); //Calling This Method From The "Database" Class.
            Console.WriteLine("Bilet Onaylandı!");
            Console.Write("Onaylamaya Devam Etmek İstiyorsanız 1'e Basınız:" + "\nİstemiyorsanız Herhangi Bir Tuşa Basınız:");
            loop = Console.ReadLine();
            if (loop != "1" )
            {
                break;
            }
        }
        AdminPanel(people);
    }// Process "Confirm Ticket"
    
    static void Main(string[] args)
    {
        ShowMenu();
    }
}

