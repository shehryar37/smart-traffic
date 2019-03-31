using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin {
    public partial class Feedback : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            List<tblFeedback> feedbacks = new List<tblFeedback>();

            if (!IsPostBack) {
                mvFeedback.ActiveViewIndex = 0;

                using (DatabaseDataContext db = new DatabaseDataContext()) {
                    feedbacks = db.tblFeedbacks.ToList();

                    feedbacks.Reverse();

                    //Populates the Panels
                    ControlManager.populateControl(feedbacks, rFeedback);
                }
            }
        }

        protected void btnDetails_Click(object sender, EventArgs e) {
            mvFeedback.ActiveViewIndex = 1;

            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rFeedback.Items) {
                LinkButton button = item.FindControl("btnDetails") as LinkButton;

                if (button.GetHashCode() == hash) {
                    TableCell tc = item.FindControl("tcFeedbackID") as TableCell;
                    int feedbackID = Convert.ToInt32(tc.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext()) {
                        tblFeedback feedback = db.tblFeedbacks.Where(x => x.FeedbackID == feedbackID).FirstOrDefault();
                        tblUser user = db.tblUsers.Where(x => x.UserID == feedback.UserID).FirstOrDefault();

                        lblFeedbackID.Text = feedback.FeedbackID.ToString();
                        lblUserID.Text = user.UserID.ToString();
                        lblFeedbackDate.Text = feedback.FeedbackDate.ToString();
                        txtFeedbackDescription.Text = feedback.FeedbackDescription.ToString();

                        feedback.IsSeen = true;
                        db.SubmitChanges();
                    }
                }
            }
        }

        protected void rSessionHistories_ItemDataBound(object sender, RepeaterItemEventArgs e) { }

        protected void btnBack_Click(object sender, EventArgs e) {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                List<tblFeedback> emergencies = db.tblFeedbacks.ToList();
                emergencies.Reverse();

                //Populates the Panels
                ControlManager.populateControl(emergencies, rFeedback);
            }

            mvFeedback.ActiveViewIndex = 0;
        }
    }
}