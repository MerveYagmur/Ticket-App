using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace TicketCaseApp;

internal class Users
{
    public string UserId1
    {
        get => UserId;
        set => UserId = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string FirstName1
    {
        get => FirstName;
        set => FirstName = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string LastName1
    {
        get => LastName;
        set => LastName = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string Email1
    {
        get => Email;
        set => Email = value ?? throw new ArgumentNullException(nameof(value));
    }
    public string Password1
    {
        get => Password;
        set => Password = value ?? throw new ArgumentNullException(nameof(value));
    }
    public bool IsAdmin1
    {
        get => IsAdmin;
        set => IsAdmin = value;
    }

    string UserId;
    string FirstName;
    string LastName;
    string Email;
    string Password;
    bool IsAdmin;
}
