<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HotelBooking.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Destiny Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f4f7fe;
            display: flex;
        }

        /* Simple Admin Sidebar */
        .sidebar {
            width: 260px;
            height: 100vh;
            background: #111c44;
            color: white;
            position: fixed;
            padding: 30px 20px;
        }

        .sidebar h2 {
            color: #00cba9;
            font-size: 22px;
            margin-bottom: 40px;
            text-align: center;
        }

        .nav-item {
            padding: 15px;
            color: #a3b1cc;
            text-decoration: none;
            display: block;
            border-radius: 10px;
            transition: 0.3s;
            margin-bottom: 5px;
        }

        .nav-item:hover, .nav-item.active {
            background: rgba(255,255,255,0.1);
            color: white;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 260px;
            padding: 40px;
            width: 100%;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 28px;
            color: #2b3674;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-right: 20px;
        }

        /* Colors for different room types */
        .icon-total { background: #e9edf7; color: #4318ff; }
        .icon-ac { background: #e2f9f5; color: #00cba9; }
        .icon-nonac { background: #fff5e9; color: #ffb547; }

        .stat-info span {
            color: #a3b1cc;
            font-size: 14px;
            font-weight: 600;
        }

        .stat-info h3 {
            margin: 5px 0 0;
            font-size: 24px;
            color: #2b3674;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>DESTINY ADMIN</h2>
        <a href="AdminDashboard.aspx" class="nav-item active"><i class="fas fa-th-large"></i> &nbsp; Dashboard</a>
        <a href="ManageRooms.aspx" class="nav-item"><i class="fas fa-bed"></i> &nbsp; Manage Rooms</a>
        <a href="ManageBookings.aspx" class="nav-item"><i class="fas fa-calendar-check"></i> &nbsp; Bookings</a>
        <a href="WebForm1.aspx" class="nav-item" style="margin-top: auto; color: #ff5f5f;"><i class="fas fa-sign-out-alt"></i> &nbsp; Logout</a>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Main Dashboard</h1>
            <p style="color: #a3b1cc;">Welcome back, Admin</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon icon-total"><i class="fas fa-door-open"></i></div>
                <div class="stat-info">
                    <span>Total Rooms</span>
                    <h3><asp:Literal ID="litTotalRooms" runat="server">0</asp:Literal></h3>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon icon-ac"><i class="fas fa-snowflake"></i></div>
                <div class="stat-info">
                    <span>AC Rooms</span>
                    <h3><asp:Literal ID="litAcRooms" runat="server">0</asp:Literal></h3>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon icon-nonac"><i class="fas fa-fan"></i></div>
                <div class="stat-info">
                    <span>Non-AC Rooms</span>
                    <h3><asp:Literal ID="litNonAcRooms" runat="server">0</asp:Literal></h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>