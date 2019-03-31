using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<tblUser> users = new List<tblUser>();

            if (!IsPostBack)
            {
                using (DatabaseDataContext db = new DatabaseDataContext())
                {
                    users = db.tblUsers.Where(x => x.IsVisible && x.IsVerified == false).ToList();

                    users.Reverse();

                    //Populates the Panels
                    ControlManager.populateControl(users, rRequests);
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

        protected void rRequests_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label label = e.Item.FindControl("lblUserID") as Label;
            DropDownList ddl = e.Item.FindControl("ddlUserType") as DropDownList;

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                long UserID = Convert.ToInt64(label.Text);

                var UserTypes = db.tblUserTypes.Where(x => x.UserTypeID != 1).ToList();

                var SelectedUserType = db.tblUsers.Where(x => x.UserID == UserID).Select(s => new
                {
                    s.UserTypeID
                }
                ).FirstOrDefault();

                ControlManager.populateControl(UserTypes, ddl, "UserTypeName", "UserTypeID");

                ddl.SelectedValue = SelectedUserType.UserTypeID.ToString();

            }
        }

        protected void btnProof_Click(object sender, EventArgs e)
        {
            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rRequests.Items)
            {
                Button button = item.FindControl("btnProof") as Button;

                if (button.GetHashCode() == hash)
                {
                    Label label = item.FindControl("lblUserID") as Label;
                    long UserID = Convert.ToInt64(label.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext())
                    {
                        string path = db.tblUsers.Where(x => x.UserID == UserID).FirstOrDefault().UserProof.ToString();

                        overlays.Attributes.CssStyle.Remove("display");
                        overlays.Attributes.CssStyle.Add("display", "block");

                        image.ImageUrl = "~/Forms/Proof/" + path;
                    }
                }
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rRequests.Items)
            {
                LinkButton button = item.FindControl("btnReject") as LinkButton;

                if (button.GetHashCode() == hash)
                {
                    Label label = item.FindControl("lblUserID") as Label;
                    long UserID = Convert.ToInt64(label.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext())
                    {
                        tblUser user = db.tblUsers.Where(x => x.UserID == UserID).FirstOrDefault();
                        user.IsVisible = false;

                        db.SubmitChanges();

                        List<tblUser> users = db.tblUsers.Where(x => x.IsVisible && x.IsVerified == false).ToList();

                        //Populates the Panels
                        ControlManager.populateControl(users, rRequests);


                        users.Reverse();
                    }
                }

                break;
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rRequests.Items)
            {
                LinkButton button = item.FindControl("btnAccept") as LinkButton;

                if (button.GetHashCode() == hash)
                {
                    Label label = item.FindControl("lblUserID") as Label;
                    long UserID = Convert.ToInt64(label.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext())
                    {
                        tblUser user = db.tblUsers.Where(x => x.UserID == UserID).FirstOrDefault();
                        user.IsVerified = true;

                        db.SubmitChanges();

                        EmailManager.SendEmail(user);

                        List<tblUser> users = db.tblUsers.Where(x => x.IsVisible && x.IsVerified == false).ToList();
                        users.Reverse();

                        //Populates the Panels
                        ControlManager.populateControl(users, rRequests);
                    }

                    break;
                }
            }
        }

    }
}