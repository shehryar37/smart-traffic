using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace SmartTraffic
{
    public static class EmailManager
    {
        public static void SendEmail(tblUser user)
        {
            MailMessage message = new MailMessage();
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;

            message.From = new MailAddress("smarttraffic123@gmail.com");
            message.To.Add(user.UserEmail);
            message.Subject = "Account Verification Email";
            message.Body = "Dear " + user.UserFName + " " + user.UserLName + ",<br><br>Your account has successfully been verified!<br><br>Regards,<br>Smart Traffic Management Team";
            message.IsBodyHtml = true;

            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential("smarttraffic123@gmail.com", "@smart123");
            client.Send(message);
        }
    }
}