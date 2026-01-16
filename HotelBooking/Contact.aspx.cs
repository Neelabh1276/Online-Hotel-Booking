using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Here you would typically send an email using SMTP
            // For now, we'll just show a success alert

            // Clear fields
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";

            Response.Write("<script>alert('Thank you for contacting us! We will get back to you shortly.');</script>");
        }
    }
}