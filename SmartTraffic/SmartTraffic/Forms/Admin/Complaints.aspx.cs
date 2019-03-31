using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin
{
    public partial class Complaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<tblComplaint> complaints = new List<tblComplaint>();

            if (!IsPostBack)
            {
                mvComplaints.ActiveViewIndex = 0;
                using (DatabaseDataContext db = new DatabaseDataContext())
                {
                    complaints = db.tblComplaints.SortBy("ComplaintDate").ToList();

                    //Populates the Panels
                    ControlManager.populateControl(complaints, rComplaints);
                }
            }
        }

        protected void rComplaints_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            TableCell tc = e.Item.FindControl("tcCategory") as TableCell;
            TableCell label = e.Item.FindControl("tcComplaintID") as TableCell;

            int ComplaintID = Convert.ToInt32(label.Text);

            using(DatabaseDataContext db = new DatabaseDataContext())
            {
                int CategoryID = db.tblComplaints.Where(x => x.ComplaintID == ComplaintID).FirstOrDefault().CategoryID;
                string CategoryName = db.tblCategories.Where(x => x.CategoryID == CategoryID).FirstOrDefault().CategoryName;

                tc.Text = CategoryName;
            }
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            mvComplaints.ActiveViewIndex = 1;

            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rComplaints.Items)
            {
                LinkButton button = item.FindControl("btnDetails") as LinkButton;

                if (button.GetHashCode() == hash)
                {
                    TableCell tc = item.FindControl("tcComplaintID") as TableCell;
                    int ComplaintID = Convert.ToInt32(tc.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext())
                    {
                        tblComplaint complaint = db.tblComplaints.Where(x => x.ComplaintID == ComplaintID).FirstOrDefault();

                        tblCategory category = db.tblCategories.Where(x => x.CategoryID == complaint.CategoryID).FirstOrDefault();

                        tblUser user = db.tblUsers.Where(x => x.UserID == complaint.UserID).FirstOrDefault();

                        lblComplaintID.Text = complaint.ComplaintID.ToString();
                        lblUserID.Text = user.UserID.ToString();
                        lblComplaintTitle.Text = complaint.ComplaintTitle;
                        lblUserName.Text = user.UserFName + " " + user.UserLName;
                        lblComplaintCategory.Text = category.CategoryName;
                        lblUserAddress.Text = user.UserAddress;
                        txtComplaintDescription.Text = complaint.ComplaintDescription;
                        lblUserContact.Text = user.UserContact + "<br />" + user.UserEmail;

                        ddlStatus.SelectedValue = complaint.ComplaintStatus;

                        complaint.IsSeen = true;
                        db.SubmitChanges();

                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            //SHOW TOAST MESSAGE

            int ComplaintID = Convert.ToInt32(lblComplaintID.Text);

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                tblComplaint complaint = db.tblComplaints.Where(x => x.ComplaintID == ComplaintID).FirstOrDefault();

                complaint.ComplaintStatus = ddlStatus.SelectedValue;
                db.SubmitChanges();

                List<tblComplaint> complaints = db.tblComplaints.SortBy("ComplaintDate").ToList();

                // Populates the Panels
                ControlManager.populateControl(complaints, rComplaints);
            }

            //Resets the DropDownList
            ddlStatus.SelectedIndex = 0;

            mvComplaints.ActiveViewIndex = 0;
        }
    }
}