using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin
{
    public partial class Alerts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendAlert_Click(object sender, EventArgs e)
        {
            NotificationManager.alertSent(txtDescription.Text);

            txtDescription.Text = "";
        }
    }
}