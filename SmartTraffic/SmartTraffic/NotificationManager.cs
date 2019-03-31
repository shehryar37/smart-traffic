using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SmartTraffic.Forms;

namespace SmartTraffic
{
    public class NotificationManager
    {
        public static void requestSent()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                tblNotification notification = new tblNotification
                {
                    NotificationMessage = "An account verification request has been received!",
                    NotificationLink = "Requests.aspx",
                    NotificationDateTime = DateTime.UtcNow,
                    NotificationType = "A",
                    UserID = null,
                    IsSeen = false
                };

                db.tblNotifications.InsertOnSubmit(notification);

                //Check
                db.SubmitChanges();
            }

        }

        public static void complaintSent()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                tblNotification notification = new tblNotification
                {
                    NotificationMessage = "A new complaint has been received!",
                    NotificationLink = "Complaints.aspx",
                    NotificationDateTime = DateTime.UtcNow,
                    NotificationType = "C",
                    UserID = null,
                    IsSeen = false
                };

                db.tblNotifications.InsertOnSubmit(notification);

                //Check
                db.SubmitChanges();
            }

        }

        public static void emergencySent()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                tblNotification notification = new tblNotification
                {
                    NotificationMessage = "An emergency has been received",
                    NotificationLink = "Emergencies.aspx",
                    NotificationDateTime = DateTime.UtcNow,
                    NotificationType = "E",
                    UserID = null,
                    IsSeen = false
                };

                db.tblNotifications.InsertOnSubmit(notification);

                //Check
                db.SubmitChanges();
            }

        }

        public static void feedbackSent()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                tblNotification notification = new tblNotification
                {
                    NotificationMessage = "New feedback has been received!",
                    NotificationLink = "Feedback.aspx",
                    NotificationDateTime = DateTime.UtcNow,
                    NotificationType = "F",
                    UserID = null,
                    IsSeen = false
                };

                db.tblNotifications.InsertOnSubmit(notification);

                //Check
                db.SubmitChanges();
            }
        }

        public static void alertSent(string description)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                List<tblUser> users = db.tblUsers.Where(x => x.UserTypeID != 1 && x.IsVerified == true && x.UserTypeID != 2).ToList();

                foreach (tblUser user in users)
                {
                    tblNotification notification = new tblNotification
                    {
                        NotificationDateTime = DateTime.UtcNow,
                        NotificationLink = "#",
                        NotificationMessage = description,
                        NotificationType = "B"
                    };

                    db.tblNotifications.InsertOnSubmit(notification);
                    db.SubmitChanges();
                }
            }
        }

        // Gets the number of unread notifications by a user
        public static string unseenNotificationCountAdmin()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                //int count = db.tblNotifications.Where(x => x.UserID == SessionManager.UserID && x.IsSeen == false).ToList().Count;

                int count = db.tblNotifications.Where(x => !x.UserID.HasValue && x.IsSeen == false).ToList().Count;

                return count.ToString();
            }

        }

        // Sets the icon displayed alongside the notification based on the type of notification 
        public static string notificationTimeElapsed(DateTime dateTime)
        {
            TimeSpan timeSpan = DateTime.UtcNow - dateTime;

            MidpointRounding mode = MidpointRounding.ToEven;

            return Math.Round(timeSpan.TotalSeconds, mode) < 60
                ? "A few seconds ago"
                : Math.Round(timeSpan.TotalMinutes, mode) >= 1 && Math.Round(timeSpan.TotalMinutes, mode) < 60
                    ? Math.Round(timeSpan.TotalMinutes, mode) == 1
                                    ? "1 minute ago"
                                    : Math.Round(timeSpan.TotalMinutes, mode).ToString() + " minutes ago"
                    : Math.Round(timeSpan.TotalHours, mode) >= 1 && Math.Round(timeSpan.TotalHours, mode) < 24
                                    ? Math.Round(timeSpan.TotalHours, mode) == 1 ? "An hour ago" : Math.Round(timeSpan.TotalHours, mode) + " hours ago"
                                    : Math.Round(timeSpan.TotalDays, mode) >= 1 && Math.Round(timeSpan.TotalDays, mode) <= 7
                                                    ? Math.Round(timeSpan.TotalDays, mode) == 1
                                                                    ? "Yesterday"
                                                                    : Math.Round(timeSpan.TotalDays, mode) == 7 ? "A week ago" : dateTime.DayOfWeek.ToString()
                                                    : dateTime.Date.ToLongDateString();
        }

        //Gets the difference from when the notification was created till the present time
        public static string notificationType(string type)
        {
            type = type.Trim();

            switch (type)
            {
                case "A":
                    return "account-plus";
                case "B":
                    return "exclamation";
                case "C":
                    return "alert-circle";
                case "E":
                    return "ambulance";
                case "F":
                    return "thumbs-up-down";
                default:
                    return null;
            }
        }
    }
}