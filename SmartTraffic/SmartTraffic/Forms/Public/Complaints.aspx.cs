using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class Complaints : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                clearAllPlaceholders();

                mvComplaint.ActiveViewIndex = 0;
            }

            using (DatabaseDataContext con = new DatabaseDataContext()) {
                var list = con.tblCategories.ToList();
                ControlManager.populateControl(list, ddlcategory, "CategoryName", "CategoryID");
            }
        }

        // On clicking the submit button of complaint.
        protected void btnsubmit_Click(object sender, EventArgs e) {
            Utilities.clearAllPlaceHolders(viewComplaints);

            using (DatabaseDataContext con = new DatabaseDataContext()) {
                try {
                    #region checks

                    if (SessionManager.UserID == 0) {
                        showError("You must be logged in to submit a complaint!");
                        clearAllViews();
                        return;
                    }

                    string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                    bool IsCaptchaValid = (ReCaptcha.Validate(EncodedResponse) == "true" ? true : false);

                    if (!IsCaptchaValid) {
                        showError("Prove that you are not a robot!", 0);
                        return;
                    }

                    if (string.IsNullOrEmpty(txtTitle.Text) || string.IsNullOrEmpty(txtdescription.Text)) {
                        showError("Fill in all text boxes!");
                        return;
                    }

                    #endregion

                    tblComplaint complaint = new tblComplaint() {
                        ComplaintDate = DateTime.Now,
                        ComplaintTitle = txtTitle.Text,
                        ComplaintDescription = txtdescription.Text,
                        CategoryID = Convert.ToInt32(ddlcategory.SelectedValue),
                        UserID = SessionManager.UserID,
                        ComplaintStatus = "Unresolved",
                        IsSeen = false
                    };

                    con.tblComplaints.InsertOnSubmit(complaint);
                    con.SubmitChanges();

                    showSuccess("Complaint submitted! Your complaint ID is: <b>" + complaint.ComplaintID + "</b>");
                    clearAllViews();

                    NotificationManager.complaintSent();
                } catch (Exception ex) {
                    showError("Error: " + ex);
                    clearAllViews();
                }
            }
        }

        // Showing a success message
        private void showSuccess(string success) {
            SuccessPlaceholder.Visible = true;
            lblSuccess.Text = success;
        }

        // Showing a success message
        private void showSuccess(string error, int view) {
            switch (view) {
                case 0:
                    SuccessPlaceholder.Visible = true;
                    lblSuccess.Text = error;
                    break;
                case 1:
                    errorPlaceholder_Tracker.Visible = true;
                    lblError_Tracker.Text = error;
                    break;
            }
        }

        // Showing an error message
        private void showError(string error) {
            ErrorPlaceholder.Visible = true;
            lblError.Text = error;
        }

        // Showing an error message
        private void showError(string error, int view) {
            switch (view) {
                case 0:
                    ErrorPlaceholder.Visible = true;
                    lblError.Text = error;
                    break;
                case 1:
                    errorPlaceholder_Tracker.Visible = true;
                    lblError_Tracker.Text = error;
                    break;
            }
        }
        
        // Check the current status of a complaint from tracker view[1]
        protected void btnCheck_Click(object sender, EventArgs e) {
            Utilities.clearAllPlaceHolders(viewTracker);

            #region checks
            if (string.IsNullOrEmpty(txtCheckComplaintID.Text)) {
                showError("Please fill in the text box!", 1);
                return;
            }

            if (SessionManager.UserID == 0) {
                showError("You must be logged in to use this feature!", 1);
                clearAllViews();
                return;
            }
            #endregion

            using (DatabaseDataContext db = new DatabaseDataContext()) {
                try {
                    tblComplaint complaint = db.tblComplaints.Where(x => x.ComplaintID == Convert.ToInt32(txtCheckComplaintID.Text)).FirstOrDefault();

                    txtDetTitle.Text = complaint.ComplaintTitle.ToString();
                    txtDetCategory.Text = complaint.tblCategory.CategoryName.ToString();
                    txtDetDescription.Text = complaint.ComplaintDescription.ToString();
                    txtDetDate.Text = complaint.ComplaintDate.ToString();
                    txtDetStatus.Text = complaint.ComplaintStatus.ToString();

                    // Go to detail of a specific complaint.
                    mvComplaint.ActiveViewIndex = 2;
                } catch (NullReferenceException) {
                    showError("No record found!", 1);
                    clearAllViews();
                    return;
                }
            }
        }

        // Go to complaints tracker
        protected void lbOpComplaintTrack_Click(object sender, EventArgs e) {
            mvComplaint.ActiveViewIndex = 1;
            clearAllViews();
        }

        // Go to complaints tracker
        protected void btnGoBack_Click(object sender, EventArgs e) {
            mvComplaint.ActiveViewIndex = 1;
            clearAllViews();
        }

        protected void clearAllViews() {
            Utilities.clearAllTextBoxes(viewComplaints);
            Utilities.clearAllTextBoxes(viewComplaintDetails);
            Utilities.clearAllTextBoxes(viewTracker);
        }

        protected void clearAllPlaceholders() {
            Utilities.clearAllPlaceHolders(viewTracker);
            Utilities.clearAllPlaceHolders(viewComplaints);
            Utilities.clearAllPlaceHolders(viewComplaintDetails);
        }
    }
}