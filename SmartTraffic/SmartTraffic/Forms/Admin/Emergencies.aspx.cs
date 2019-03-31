using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin {
    public partial class Emergencies : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            List<tblEmergency> emergencies = new List<tblEmergency>();

            if (!IsPostBack) {
                mvEmergencies.ActiveViewIndex = 0;

                using (DatabaseDataContext db = new DatabaseDataContext()) {
                    emergencies = db.tblEmergencies.ToList();
                    emergencies.Reverse();

                    //Populates the Panels
                    ControlManager.populateControl(emergencies, rEmergencies);
                }
            }

            var control = Request.Params.Get("__EVENTTARGET");
            var argument = Request.Params.Get("__EVENTARGUMENT");

            if (control == "overlays" && argument == "Click")
            {
                overlays.Attributes.CssStyle.Remove("display");
                overlays.Attributes.CssStyle.Add("display", "none");
            }
        }

        protected void btnDetails_Click(object sender, EventArgs e) {
            mvEmergencies.ActiveViewIndex = 1;

            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rEmergencies.Items) {
                LinkButton button = item.FindControl("btnDetails") as LinkButton;

                if (button.GetHashCode() == hash) {
                    TableCell tc = item.FindControl("tcEmergencyID") as TableCell;
                    int EmergencyID = Convert.ToInt32(tc.Text);
                    
                    using (DatabaseDataContext db = new DatabaseDataContext()) {
                        tblEmergency emergency = db.tblEmergencies.Where(x => x.EmergencyID == EmergencyID).FirstOrDefault();
                        tblUser user = db.tblUsers.Where(x => x.UserID == emergency.UserID).FirstOrDefault();

                        lblEmergencyID.Text = emergency.EmergencyID.ToString();
                        lblUserID.Text = user.UserID.ToString();
                        lblTitle.Text = emergency.EmergencyTitle.ToString();

                        ddlStatus.SelectedValue = emergency.EmergencyStatus;

                        emergency.IsSeen = true;
                        db.SubmitChanges();
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e) {

            int EmergencyID = Convert.ToInt32(lblEmergencyID.Text);

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                tblEmergency emergency = db.tblEmergencies.Where(x => x.EmergencyID  == EmergencyID).FirstOrDefault();

                emergency.EmergencyStatus = ddlStatus.SelectedValue;
                db.SubmitChanges();

                List<tblEmergency> emergencies = db.tblEmergencies.ToList();
                emergencies.Reverse();

                //Populates the Panels
                ControlManager.populateControl(emergencies, rEmergencies);
            }

            mvEmergencies.ActiveViewIndex = 0;
        }

        protected void btnViewMap_Click(object sender, EventArgs e)
        {
            overlays.Attributes.CssStyle.Remove("display");
            overlays.Attributes.CssStyle.Add("display", "block");
        }
    }
}