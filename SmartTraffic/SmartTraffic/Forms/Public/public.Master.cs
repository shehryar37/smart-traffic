using System;
using SmartTraffic.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class _public : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            
            if (SessionManager.UserID == 0) {
                mvLoginLogout.ActiveViewIndex = 0;
            } else {
                mvLoginLogout.ActiveViewIndex = 1;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e) {
            using (DatabaseDataContext con = new DatabaseDataContext()) {
                tblSession session = con.tblSessions.Where(x => x.SessionID == SessionManager.SessionID).FirstOrDefault();

                SessionManager.UserID = 0;
                SessionManager.SessionID = 0;

                session.SessionEnd = DateTime.Now;
                con.SubmitChanges();
            }

            mvLoginLogout.ActiveViewIndex = 0;
        }

        protected void timerLocation_Tick(object sender, EventArgs e)
        {
            if(SessionManager.SessionID != 0)
            {
                LocationManager.getLocation(SessionManager.SessionID);
            }
            
        }
    }
}