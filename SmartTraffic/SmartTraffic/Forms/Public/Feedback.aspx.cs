using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class Feedback : System.Web.UI.Page {
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
                    return;
                }

                string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                bool IsCaptchaValid = (ReCaptcha.Validate(EncodedResponse) == "true" ? true : false);

                if (!IsCaptchaValid) {
                    showError("Prove that you are not a robot!");
                    return;
                }

                if (string.IsNullOrEmpty(txtFeeddescription.Text)) {
                    showError("Description is empty!");
                    return;
                }

                #endregion
                try {
                    tblFeedback feedback = new tblFeedback {
                        FeedbackDescription = txtFeeddescription.Text,
                        FeedbackDate = DateTime.Now,
                        IsSeen = false,
                        UserID = SessionManager.UserID
                    };

                    con.tblFeedbacks.InsertOnSubmit(feedback);
                    con.SubmitChanges();

                    showSuccess("Feeback submitted!");
                    Utilities.clearAllTextBoxes(viewMain);

                    NotificationManager.feedbackSent();

                } catch (Exception ex) {
                    showError("Error: " + ex);
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