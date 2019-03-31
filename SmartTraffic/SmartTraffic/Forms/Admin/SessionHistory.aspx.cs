using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin {
    public partial class SessionHistory : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            List<tblSession> sessionHistories = new List<tblSession>();

            if(!IsPostBack) {
                mvSessionHistory.ActiveViewIndex = 0;

                using (DatabaseDataContext db = new DatabaseDataContext()) {
                    sessionHistories = db.tblSessions.ToList();

                    //Populates the Panels
                    ControlManager.populateControl(sessionHistories, rSessionHistories);

                    tblUser user = db.tblUsers.Where(x => x.UserID == SessionManager.UserID).FirstOrDefault();

                    if (user.UserTypeID == 2)
                    {
                        Response.Redirect("Index.aspx");
                    }
                }
            }
        }

        protected void rComplaints_ItemDataBound(object sender, RepeaterItemEventArgs e) { }

        protected void btnDetails_Click(object sender, EventArgs e) {
            mvSessionHistory.ActiveViewIndex = 1;

            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rSessionHistories.Items) {
                LinkButton button = item.FindControl("btnDetails") as LinkButton;

                if (button.GetHashCode() == hash) {
                    TableCell tc = item.FindControl("tcSessionID") as TableCell;
                    int SessionID = Convert.ToInt32(tc.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext()) {
                        tblSession session = db.tblSessions.Where(x => x.SessionID == SessionID).FirstOrDefault();
                        tblUser user = db.tblUsers.Where(x => x.UserID == session.UserID).FirstOrDefault();

                        lblSessionID.Text = session.SessionID.ToString();
                        lblUserID.Text = user.UserID.ToString();
                        lblSessionStart.Text = session.SessionBegin.ToString();
                        lblSessionLatitude.Text = session.SessionLatitude.ToString();
                        lblSessionLongitude.Text = session.SessionLongitude.ToString();

                        // SessionEnd can be empty because it has ALLOW NULL property in database.
                        try {
                            lblSessionEnd.Text = session.SessionEnd.ToString();
                        } catch (NullReferenceException) {
                            lblSessionEnd.Text = "-";
                        }
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e) {
            mvSessionHistory.ActiveViewIndex = 0;
        }
        
    }
}