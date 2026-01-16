using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace HotelBookingSite
{
    public partial class HotelBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page on first load
                InitializePage();
            }
        }

        private void InitializePage()
        {
            // Set default values or perform any initialization
            // Set default check-in time to 12:01 PM
            txtCheckInTime.Text = "12:01";

            // Set default check-out time to 11:00 AM
            txtCheckOutTime.Text = "11:00";

            // Set default number of rooms
            txtNoOfRoom.Text = "1";

            // You can add code here to load hotel details from database later
        }

        protected void btnCalculatePrice_Click(object sender, EventArgs e)
        {
            // Calculate total price based on dates and room type
            if (!string.IsNullOrEmpty(txtCheckIn.Text) && !string.IsNullOrEmpty(txtCheckOut.Text))
            {
                DateTime checkIn;
                DateTime checkOut;

                // Try parsing dates safely
                if (DateTime.TryParse(txtCheckIn.Text, out checkIn) && DateTime.TryParse(txtCheckOut.Text, out checkOut))
                {
                    int numberOfNights = (checkOut - checkIn).Days;

                    if (numberOfNights > 0)
                    {
                        // 1. Determine Price Per Night based on Room Type Selection
                        decimal pricePerNight = 0;
                        string selectedRoom = ddlRoomType.SelectedValue; // Ensure you have a DropDownList with this ID

                        // Prices matched from your screenshots
                        if (selectedRoom == "Standard Double Room") pricePerNight = 15000;      //
                        else if (selectedRoom == "Comfort Single Room") pricePerNight = 17000;  //
                        else if (selectedRoom == "Double Fancy Room") pricePerNight = 21000;    //
                        else pricePerNight = 15000; // Default fallback

                        // 2. Get Number of Rooms (Default to 1 if empty)
                        int numberOfRooms = string.IsNullOrEmpty(txtNoOfRoom.Text) ? 1 : int.Parse(txtNoOfRoom.Text);

                        // 3. Calculation Logic
                        decimal subtotal = pricePerNight * numberOfNights * numberOfRooms;
                        decimal cityTax = 0; // You can add tax logic here if needed, currently 0 for simplicity
                        decimal serviceFee = 0;

                        decimal totalBeforeGST = subtotal + cityTax + serviceFee;
                        decimal totalWithGST = totalBeforeGST * 1.18m; // Adding 18% GST as per your requirement

                        // 4. Formatting to Indian Currency (₹)
                        // "N2" formats it with commas and 2 decimal places (e.g., ₹1,25,000.00)
                        txtTotalPrice.Text = "₹" + totalWithGST.ToString("N2");
                    }
                    else
                    {
                        Response.Write("<script>alert('Check-out date must be after check-in date.');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid date format. Please select valid dates.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please select check-in and check-out dates.');</script>");
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            // Validate form fields using your existing validation method
            if (ValidateBookingForm())
            {
                try
                {
                    // 1. Get Values from Frontend based on your control names
                    string name = txtName.Text;
                    string phone = txtPhone.Text;
                    string email = txtEmail.Text;
                    string checkInDate = txtCheckIn.Text;
                    string checkInTime = txtCheckInTime.Text;
                    string checkOutDate = txtCheckOut.Text;
                    string checkOutTime = txtCheckOutTime.Text;
                    string roomType = ddlRoomType.SelectedValue;
                    int numRooms = int.Parse(txtNoOfRoom.Text);

                    // 2. Extract price from the TotalPrice textbox (removing the '₹' symbol)
                    string priceCleaned = txtTotalPrice.Text.Replace("₹", "").Trim();
                    decimal totalWithGST = decimal.Parse(priceCleaned);

                    // 3. Database Insertion
                    string connString = ConfigurationManager.ConnectionStrings["HotelDbConn"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        // Query matches your SQL Table structure: Book(Name, Phoneno, Email, CheckIn, CheckInTime, CheckOut, CheckOutTime, RoomType, NoOfRoom, TotalPrice)
                        string query = @"INSERT INTO Book (Name, Phoneno, Email, CheckIn, CheckInTime, CheckOut, CheckOutTime, RoomType, NoOfRoom, TotalPrice) 
                                        VALUES (@name, @phone, @email, @inDate, @inTime, @outDate, @outTime, @room, @count, @total)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@phone", phone);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@inDate", checkInDate);
                            cmd.Parameters.AddWithValue("@inTime", checkInTime);
                            cmd.Parameters.AddWithValue("@outDate", checkOutDate);
                            cmd.Parameters.AddWithValue("@outTime", checkOutTime);
                            cmd.Parameters.AddWithValue("@room", roomType);
                            cmd.Parameters.AddWithValue("@count", numRooms);
                            cmd.Parameters.AddWithValue("@total", totalWithGST);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }

                    // Success Message
                    Response.Redirect("BookingConfirmation.aspx");
                }
                catch (Exception ex)
                {
                    // Error Handling
                    Response.Write("<script>alert('Error saving booking: " + ex.Message + "');</script>");
                }
            }
        }

        private bool ValidateBookingForm()
        {
            bool isValid = true;

            // Validate check-in date
            if (string.IsNullOrWhiteSpace(txtCheckIn.Text))
            {
                Response.Write("<script>alert('Please select check-in date.');</script>");
                return false;
            }

            // Validate check-in time
            if (string.IsNullOrWhiteSpace(txtCheckInTime.Text))
            {
                Response.Write("<script>alert('Please enter check-in time.');</script>");
                return false;
            }

            // Validate check-out date
            if (string.IsNullOrWhiteSpace(txtCheckOut.Text))
            {
                Response.Write("<script>alert('Please select check-out date.');</script>");
                return false;
            }

            // Validate check-out time
            if (string.IsNullOrWhiteSpace(txtCheckOutTime.Text))
            {
                Response.Write("<script>alert('Please enter check-out time.');</script>");
                return false;
            }

            // Validate room type
            if (string.IsNullOrWhiteSpace(ddlRoomType.SelectedValue))
            {
                Response.Write("<script>alert('Please select a room type.');</script>");
                return false;
            }

            // Validate number of rooms
            if (string.IsNullOrWhiteSpace(txtNoOfRoom.Text))
            {
                Response.Write("<script>alert('Please enter number of rooms.');</script>");
                return false;
            }

            // Validate name
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                Response.Write("<script>alert('Please enter your name.');</script>");
                return false;
            }

            // Validate phone
            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                Response.Write("<script>alert('Please enter your phone number.');</script>");
                return false;
            }

            // Validate email
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                Response.Write("<script>alert('Please enter your email address.');</script>");
                return false;
            }

            // Basic email validation
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return false;
            }

            // Validate total price is calculated
            if (string.IsNullOrWhiteSpace(txtTotalPrice.Text) || txtTotalPrice.Text == "₹0.00")
            {
                Response.Write("<script>alert('Please calculate the total price before booking.');</script>");
                return false;
            }

            return isValid;
        }

        // Method to calculate total price (will be used when database is connected)
        private decimal CalculateTotalPrice(decimal pricePerNight, int numberOfNights, decimal cityTax, decimal serviceFee)
        {
            decimal subtotal = pricePerNight * numberOfNights;
            decimal total = subtotal + cityTax + serviceFee;
            decimal totalWithGST = total * 1.18m; // Adding 18% GST
            return totalWithGST;
        }
    }
}