using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class admin : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (SessionManager.UserID != 0) {
                using (DatabaseDataContext con = new DatabaseDataContext()) {
                    tblUser user = con.tblUsers.Where(x => x.UserID == SessionManager.UserID).FirstOrDefault();
                    lblUser.Text = user.UserFName;

                    if (user.UserTypeID == 1)
                    {
                        mvSideBar.ActiveViewIndex = 0;
                    } else if (user.UserTypeID == 2)
                    {
                        mvSideBar.ActiveViewIndex = 1;
                    } else
                    {
                        Response.Redirect("~/Forms/Public/LoginRegister.aspx");
                    }
                }
            } else {
                Response.Redirect("~/Forms/Public/LoginRegister.aspx");
            }

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var list = db.tblNotifications.Where(x => !x.UserID.HasValue).SortBy("notificationID").ToList();

                list.Reverse();

                ControlManager.populateControl(list, rNotifications);
            }

            lNotifications.Text = NotificationManager.unseenNotificationCountAdmin();

            aNotifications.ServerClick += ANotifications_ServerClick;
        }

        protected void lbLogout_Click(object sender, EventArgs e) {
            using (DatabaseDataContext con = new DatabaseDataContext()) {
                tblSession session = con.tblSessions.Where(x => x.SessionID == SessionManager.SessionID).FirstOrDefault();

                SessionManager.UserID = 0;
                SessionManager.SessionID = 0;

                if (session != null) {
                    session.SessionEnd = DateTime.Now;
                    con.SubmitChanges();
                }
                
                Response.Redirect("~/Forms/Public/LoginRegister.aspx");
            }
        }

        private void ANotifications_ServerClick(object sender, EventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                List<tblNotification> notifications = db.tblNotifications.Where(x => !x.UserID.HasValue).ToList();

                foreach (tblNotification notification in notifications)
                {
                    notification.IsSeen = true;
                    db.SubmitChanges();
                }
            }

            if (notificationList.Visible)
            {
                notificationList.Visible = false;
                notificationContainer.Attributes.Remove("class");
                aNotifications.Attributes.Remove("aria-expanded");
            }
            else
            {

                notificationContainer.Attributes.Add("class", "open");
                aNotifications.Attributes.Add("aria-expanded", "true");
                notificationList.Visible = true;
            }

            lNotifications.Text = NotificationManager.unseenNotificationCountAdmin();
        }
    }
}