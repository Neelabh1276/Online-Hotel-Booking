using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking
{
    public partial class ManageRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomData();
            }
        }

        private void BindRoomData()
        {
            // Dummy Data Structure (Replace this part with your SQL Database Query)
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] {
                new DataColumn("RoomID"), new DataColumn("RoomNo"),
                new DataColumn("Type"), new DataColumn("Price"), new DataColumn("Status")
            });

            // Sample data to visualize the professional UI
            dt.Rows.Add("1", "RM-101", "AC", "15000", "Available");
            dt.Rows.Add("2", "RM-102", "Non-AC", "8500", "Booked");
            dt.Rows.Add("3", "RM-201", "AC", "18000", "Available");
            dt.Rows.Add("4", "RM-304", "Non-AC", "7000", "Cleaning");

            gvRooms.DataSource = dt;
            gvRooms.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            // In a real scenario, you would use: 
            // "SELECT * FROM Rooms WHERE RoomNo LIKE '%" + keyword + "%'"
            BindRoomData();
        }

        protected void gvRooms_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Get data from the clicked row
            GridViewRow row = gvRooms.Rows[e.NewEditIndex];

            hfEditRoomID.Value = row.Cells[0].Text;
            txtEditRoomNo.Text = row.Cells[1].Text;
            txtEditPrice.Text = row.Cells[3].Text.Replace("₹", "").Replace(",", "");

            // Script to trigger the Bootstrap Modal
            string script = "var myModal = new bootstrap.Modal(document.getElementById('editRoomModal')); myModal.show();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);

            e.Cancel = true; // Prevents GridView from entering its default inline edit mode
        }

        protected void gvRooms_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string roomID = gvRooms.Rows[e.RowIndex].Cells[0].Text;

            // Database Logic: DELETE FROM Rooms WHERE RoomID = roomID

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Room deleted from inventory successfully.');", true);
            BindRoomData();
        }

        protected void btnUpdateRoom_Click(object sender, EventArgs e)
        {
            // Collect updated info
            string roomID = hfEditRoomID.Value;
            string newNo = txtEditRoomNo.Text;
            string newType = ddlEditType.SelectedValue;
            string newPrice = txtEditPrice.Text;

            // Database Logic: UPDATE Rooms SET RoomNo=@No, Type=@Type, Price=@Price WHERE RoomID=@ID

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Room Details Updated!');", true);
            BindRoomData();
        }
    }
}