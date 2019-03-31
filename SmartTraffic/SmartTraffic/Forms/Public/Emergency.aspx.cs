using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class Emergencyhelp : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                hideAllPlaceholders();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            using (DatabaseDataContext con = new DatabaseDataContext()) {
                #region checks
                hideAllPlaceholders();

                if (SessionManager.UserID == 0) {
                    showError("You must be logged in to use this feature!");
                    Utilities.clearAllTextBoxes(viewMain);
                    return;
                }

                string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                bool IsCaptchaValid = (ReCaptcha.Validate(EncodedResponse) == "true" ? true : false);

                if (!IsCaptchaValid) {
                    showError("Prove that you are not a robot!");
                    return;
                }

                if (string.IsNullOrEmpty(txtEmergTitle.Text)) {
                    showError("Emergency title is empty!");
                    return;
                }

                #endregion

                tblSession session = con.tblSessions.Where(x => x.SessionID == SessionManager.SessionID).FirstOrDefault();

                try {
                    tblEmergency emergency = new tblEmergency {
                        EmergencyTitle = txtEmergTitle.Text,
                        EmergencyLatitude = session.SessionLatitude,
                        EmergencyLongitude = session.SessionLongitude,
                        EmergencyStatus = "Pending",
                        IsSeen = false,
                        EmergencyDate = DateTime.UtcNow,
                        UserID = SessionManager.UserID
                    };

                    con.tblEmergencies.InsertOnSubmit(emergency);
                    con.SubmitChanges();

                    showSuccess("Emergency notification has been issued successfully!");
                    Utilities.clearAllTextBoxes(viewMain);

                    NotificationManager.emergencySent();
                } catch (Exception ex) {
                    showError("Error: " + ex);
                    Utilities.clearAllTextBoxes(viewMain);
                }
            }
        }

        // Showing a success message
        private void showSuccess(string success) {
            SuccessPlaceholder.Visible = true;
            lblSuccess.Text = success;
        }

        // Showing an error message
        private void showError(string error) {
            ErrorPlaceholder.Visible = true;
            lblError.Text = error;
        }

        // Hiding all placeholders
        private void hideAllPlaceholders() {
            SuccessPlaceholder.Visible = false;
            ErrorPlaceholder.Visible = false;
        }
    }
}