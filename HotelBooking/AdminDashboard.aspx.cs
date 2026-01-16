using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadRoomStats();
            }
        }
        private void LoadRoomStats()
        {
            // Example data (In the future, you will get these from your Database)
            int acRooms = 45;
            int nonAcRooms = 30;
            int totalRooms = acRooms + nonAcRooms;

            // Display values in the Literals on the page
            litAcRooms.Text = acRooms.ToString();
            litNonAcRooms.Text = nonAcRooms.ToString();
            litTotalRooms.Text = totalRooms.ToString();
        }
    }
}