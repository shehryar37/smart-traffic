using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin
{
    public partial class RejectedUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<tblUser> users = new List<tblUser>();

            if (!IsPostBack)
            {
                using (DatabaseDataContext db = new DatabaseDataContext())
                {
                    users = db.tblUsers.Where(x => x.IsVisible == false && x.IsVerified == false).ToList();

                    users.Reverse();

                    //Populates the Panels
                    ControlManager.populateControl(users, rUsers);

                    tblUser user = db.tblUsers.Where(x => x.UserID == SessionManager.UserID).FirstOrDefault();

                    if (user.UserTypeID == 2)
                    {
                        Response.Redirect("Index.aspx");
                    }
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

        protected void rUsers_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

            foreach (RepeaterItem item in rUsers.Items)
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rUsers.Items)
            {
                LinkButton button = item.FindControl("btnDelete") as LinkButton;

                if (button.GetHashCode() == hash)
                {
                    Label label = item.FindControl("lblUserID") as Label;
                    long UserID = Convert.ToInt64(label.Text);

                    using (DatabaseDataContext db = new DatabaseDataContext())
                    {
                        tblUser user = db.tblUsers.Where(x => x.UserID == UserID).FirstOrDefault();

                        db.tblUsers.DeleteOnSubmit(user);

                        List<tblUser> users = db.tblUsers.Where(x => x.IsVisible == false && x.IsVerified == false).ToList();

                        users.Reverse();

                        //Populates the Panels
                        ControlManager.populateControl(users, rUsers);
                    }
                }

                break;
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int hash = sender.GetHashCode();

            foreach (RepeaterItem item in rUsers.Items)
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
                        user.IsVisible = true;

                        db.SubmitChanges();

                        EmailManager.SendEmail(user);

                        List<tblUser> users = db.tblUsers.Where(x => x.IsVisible == false && x.IsVerified == false).ToList();

                        users.Reverse();

                        //Populates the Panels
                        ControlManager.populateControl(users, rUsers);
                    }

                    break;
                }
            }
        }

        
    }
}