using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Public
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionManager.UserID == 0)
                {
                    Response.Redirect("LoginRegister.aspx");
                }
            }

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var list = db.tblNotifications.Where(x => x.UserID == SessionManager.UserID).SortBy("notificationID").ToList();

                list.Reverse();

                ControlManager.populateControl(list, rNotifications);
            }
        }
    }
}