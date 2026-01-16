using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string role = ddlRole.SelectedValue;

            // Simple Role-Based Redirection
            if (role == "admin")
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                Response.Redirect("WebForm1.aspx");
            }
        }
    }
}