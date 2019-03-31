using SmartTraffic.Forms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic {
    public partial class LoginRegister : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                hideAllPlaceholders();
                mvMain.ActiveViewIndex = 0;     // Show login view when first visiting.

                using (DatabaseDataContext db = new DatabaseDataContext()) {
                    // Populating the dropdown of User type.
                    var list = db.tblUserTypes.Where(x => x.UserTypeName != "Official").ToList();
                    ControlManager.populateControl(list, ddlUserType, "UserTypeName", "UserTypeID");
                }
            }
        }

        // Login button in view 0 of mvMain
        protected void btnLogin_Click(object sender, EventArgs e) {
            hideAllPlaceholders();

            using (DatabaseDataContext con = new DatabaseDataContext()) {
                // Check if the user exists

                string password = SecurityManager.encrypt(txtLoginPassword.Text, txtLoginEmail.Text);

                List<tblUser> users = con.tblUsers.Where(
                    x => x.UserEmail.Equals(txtLoginEmail.Text)
                    && x.IsVerified.Equals(true)
                    && x.IsVisible.Equals(true)
                ).ToList();

                tblUser user = users.Where(x => SecurityManager.decrypt(x.UserPassword, x.UserEmail).Equals(txtLoginPassword.Text)).FirstOrDefault();

                if (user != null) {
                    Session["user"] = user;

                    SessionManager.UserID = user.UserID;

                    // Inserting data on current session.
                    tblSession userSession = new tblSession {
                        UserID = user.UserID,
                        SessionBegin = DateTime.Now,
                        SessionLatitude = 0,
                        SessionLongitude = 0
                    };

                    con.tblSessions.InsertOnSubmit(userSession);
                    con.SubmitChanges();

                    // Storing the session object for later use at Logout.
                    SessionManager.SessionID = userSession.SessionID;

                    // Showing index depending on type of user.
                    if (user.UserTypeID == 3 || user.UserTypeID == 4) {
                        // If the user is a vehicle owner/ped, send them to public Index.
                        Response.Redirect("Index.aspx");
                    } else if (user.UserTypeID == 1 || user.UserTypeID == 2) {
                        // If user is Official, send them to Admin Index
                        Response.Redirect("~/Forms/Admin/Index.aspx");
                    } else {
                        showError("Error!", 0);
                        Utilities.clearAllTextBoxes(viewLogin);
                    }
                } else {
                    showError("Incorrect username / password!", 0);
                    Utilities.clearAllTextBoxes(viewLogin);
                }
            }
        }

        // Register button in register view[1] of mvMain.
        protected void btnRegister_Click(object sender, EventArgs e) {
            hideAllPlaceholders();
            
            using (DatabaseDataContext con = new DatabaseDataContext()) {
                #region checks

                // Checking if user has clicked on captcha
                string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                bool IsCaptchaValid = (ReCaptcha.Validate(EncodedResponse) == "true" ? true : false);

                if (!IsCaptchaValid) {
                    showError("Prove that you are not a robot!", 1);
                    return;
                }

                // Checks for existing records with the same Email and Phonenumber
                if (con.tblUsers.Where(x => x.UserEmail.Equals(txtEmail.Text)).FirstOrDefault() != null) {
                    showError("A user with this email already exists!", 1);
                    return;
                } else if (con.tblUsers.Where(x => x.UserContact.Equals(txtContact.Text)).FirstOrDefault() != null) {
                    showError("A user with this Phone number already exists!", 1);
                    return;
                }

                // Checking the lenghts of inputs
                if (txtPassword.Text.Length > 15) {
                    showError("Password size is too large!", 1);
                    return;
                } else if (txtContact.Text.Length > 15) {
                    showError("Enter a valid Phone number!", 1);
                    return;
                }

                // Checking if there is a proof file or not.
                if (!imgProof.HasFile) {
                    showError("No proof file found!", 1);
                    return;
                }

                // Checking if the proof is a .jpg or .png image.
                if (!Utilities.isImage(Path.GetExtension(imgProof.FileName))) {
                    showError("Proof is not an image!", 1);
                    return;
                }

                // Checking if any of the textboxes are empty
                if (string.IsNullOrEmpty(txtFName.Text) || string.IsNullOrEmpty(txtLName.Text) 
                    || string.IsNullOrEmpty(txtContact.Text) || string.IsNullOrEmpty(txtEmail.Text)
                    || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtAddress.Text)) {
                    showError("Fill in all textboxes!", 1);
                    return;
                }

                #endregion

                tblUser user = new tblUser {
                    UserFName = txtFName.Text,
                    UserLName = txtLName.Text,
                    UserEmail = txtEmail.Text,
                    UserPassword = SecurityManager.encrypt(txtPassword.Text, txtEmail.Text),
                    UserContact = txtContact.Text,
                    UserAddress = txtAddress.Text,
                    UserRegDateTime = DateTime.UtcNow,
                    UserTypeID = Convert.ToInt32(ddlUserType.SelectedValue),
                    UserProof = txtContact.Text + Path.GetExtension(imgProof.FileName),
                    IsVerified = false,
                    IsVisible = true
                };
                
                try {
                    // Default save path of the image.
                    string savePath = Server.MapPath("~/Forms/Proof");
                    
                    // Specify the path with saved file name.
                    string imgPath = Path.Combine(savePath, user.UserProof);

                    // Actually saving the proof image on server after the object has been successfully submitted.
                    imgProof.SaveAs(imgPath);

                    // Saving the object of the user.
                    con.tblUsers.InsertOnSubmit(user);
                    con.SubmitChanges();
                } catch (Exception ex) {
                    showError("Error: " + ex, 1);
                }

                // If user has been created, show success message.
                showSuccess("User " + txtFName.Text + "'s registration has been submitted! <a href=\"LoginRegister.aspx\">Click Here</a> to go to login page", 1);
                
                NotificationManager.requestSent();

                Utilities.clearAllTextBoxes(viewRegister);
            }
        }

        // For showing any success message to the user.
        private void showSuccess(string success, int view) {
            if (view == 0) {
                SuccessPlaceholder.Visible = true;
                lblSuccess.Text = success;
            } else if (view == 1) {
                regSuccessPlaceholder.Visible = true;
                reglblSuccess.Text = success;
            }
        }

        // For showing any error message to the user.
        private void showError(string error, int view) {
            // If view is 0, the error is for Login view. Otherwise, it is for Register view.
            if (view == 0) {
                ErrorPlaceholder.Visible = true;
                lblError.Text = error;
            } else if (view == 1) {
                regErrorPlaceholder.Visible = true;
                reglblError.Text = error;
            }
        }

        private void hideAllPlaceholders() {
            Utilities.clearAllPlaceHolders(viewLogin);
            Utilities.clearAllPlaceHolders(viewRegister);
        }

        // Click here linkButton in view 0. It takes user to view 1 for registration.
        protected void lbClickRegister_Click(object sender, EventArgs e) {
            hideAllPlaceholders();
            mvMain.ActiveViewIndex = 1;
        }

        // Click here linkButton in view 1. It takes user to view 0 for login.
        protected void lbClickLogin_Click(object sender, EventArgs e) {
            hideAllPlaceholders();
            mvMain.ActiveViewIndex = 0;
        }

    }
}