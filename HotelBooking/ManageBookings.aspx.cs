using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace HotelBookingSite
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["HotelDbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookingData();
            }
        }

        // Fetch data from database
        private void BindBookingData(string searchName = "")
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Book";
                if (!string.IsNullOrEmpty(searchName))
                {
                    query += " WHERE Name LIKE @name";
                }
                query += " ORDER BY BookingID DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(searchName))
                    {
                        cmd.Parameters.AddWithValue("@name", "%" + searchName + "%");
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindBookingData(txtSearchName.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            BindBookingData();
        }

        // Delete Logic
        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "DELETE FROM Book WHERE BookingID = @id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", bookingId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            BindBookingData(); // Refresh grid after delete
        }
    }
}