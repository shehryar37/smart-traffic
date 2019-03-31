using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartTraffic.Forms.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (DatabaseDataContext con = new DatabaseDataContext())
                {
                    // Fetching Visitors on website today.
                    DateTime yesterday = DateTime.UtcNow.AddDays(-1);

                    int count = con.tblSessions.Where(x => x.SessionBegin >= yesterday).Count();
                    lblWebsiteHitsToday.Text = count.ToString();

                    yesterday.AddDays(-1);
                    count = con.tblSessions.Where(
                        x => x.SessionBegin > yesterday
                        && x.SessionBegin < yesterday.AddDays(1)).Count();

                    lblWebsiteHitsLast.Text = count.ToString();

                    // Fetching Feedbacks on website today.
                    yesterday = DateTime.UtcNow.AddDays(-1);

                    count = con.tblFeedbacks.Where(x => x.FeedbackDate > yesterday).Count();
                    lblFeedbacksToday.Text = count.ToString();

                    yesterday.AddDays(-1);
                    count = con.tblFeedbacks.Where(
                        x => x.FeedbackDate > yesterday
                        && x.FeedbackDate < yesterday.AddDays(1)).Count();

                    lblFeedbacksLast.Text = count.ToString();

                    // Fetching Complaints on website today.
                    yesterday = DateTime.UtcNow.AddDays(-1);

                    count = con.tblComplaints.Where(x => x.ComplaintDate > yesterday).Count();
                    lblComplaintsToday.Text = count.ToString();

                    yesterday.AddDays(-1);
                    count = con.tblComplaints.Where(
                        x => x.ComplaintDate > yesterday
                        && x.ComplaintDate < yesterday.AddDays(1)).Count();

                    lblComplaintsLast.Text = count.ToString();

                    // Fetching Emergencies on website today.
                    yesterday = DateTime.Today;
                    yesterday.AddDays(-1);

                    count = con.tblEmergencies.Where(x => x.EmergencyDate > yesterday).Count();
                    lblEmergenciesToday.Text = count.ToString();

                    yesterday.AddDays(-1);
                    count = con.tblEmergencies.Where(
                        x => x.EmergencyDate > yesterday
                        && x.EmergencyDate < yesterday.AddDays(1)).Count();

                    lblEmergenciesLast.Text = count.ToString();

                    // Fetching the recent feedback.
                    List<tblFeedback> feedbacks = con.tblFeedbacks.ToList();
                    feedbacks.Reverse();

                    // Displaying the recent complaint on the card.
                    //tblComplaint complaint = complaints.FirstOrDefault();
                    //lblRecentComplaint.Text = complaint.ComplaintDescription;

                    // Populating the users card repeater
                    List<tblUser> user = con.tblUsers.Where(x => x.IsVisible != false).ToList();
                    
                    if(user.Count > 5)
                    {
                        if(5 < user.Count - 1)
                        {
                            user.RemoveRange(5, user.Count - 1);
                        }
                        
                    }

                    ControlManager.populateControl(user, rUsers);

                    // Populating the complaints card repeater
                    var complaints = con.tblComplaints.Select(t => new {
                        t.ComplaintStatus,
                        t.ComplaintTitle,
                        t.tblCategory.CategoryName
                    }).ToList();

                    if (complaints.Count > 5)
                    {
                        if (5 < complaints.Count - 1)
                        {
                            complaints.RemoveRange(5, complaints.Count - 1);
                        }
                    }

                    ControlManager.populateControl(complaints, rComplaints);
                }
            }
        }
    }
}