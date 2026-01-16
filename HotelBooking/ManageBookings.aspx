<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBookings.aspx.cs" Inherits="HotelBookingSite.ManageBookings" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Bookings | Destiny Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', sans-serif; }
        
        body {
            display: flex;
            background-color: #f3f4f6;
            min-height: 100vh;
        }

        /* --- SIDEBAR STYLES --- */
        .sidebar {
            width: 260px;
            background-color: #111827; /* Dark Navy Background */
            color: #fff;
            display: flex;
            flex-direction: column;
            padding: 20px;
            flex-shrink: 0; /* Prevents sidebar from shrinking */
        }


        .brand {
            font-size: 24px;
            font-weight: bold;
            color: #00cba9; /* Cyan color like in your screenshot */
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: #9ca3af;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: all 0.3s;
            font-size: 16px;
        }

        .menu-item i {
            margin-right: 15px;
            width: 20px;
            text-align: center;
        }

        .menu-item:hover {
            background-color: #1f2937;
            color: #fff;
        }

        /* Active State for 'Bookings' Tab */
        .menu-item.active {
            background-color: #1f2937; /* Slightly lighter dark background */
            color: #fff;
            border-left: 4px solid #06b6d4; /* Cyan accent border */
        }

        .logout {
            margin-top: auto; /* Pushes logout to bottom */
            color: #ef4444;
        }
        
        .logout:hover {
            background-color: #fee2e2;
            color: #dc2626;
        }

        /* --- MAIN CONTENT STYLES --- */
        .main-content {
            flex: 1;
            padding: 30px;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 600;
            color: #00cba9;
        }

        .container-box {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        /* Search Section */
        .search-box {
            margin-bottom: 25px;
            display: flex;
            gap: 15px;
        }

        .input-style {
            padding: 10px 15px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            width: 300px;
            outline: none;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: background 0.2s;
        }

        .btn-search { background-color: #4f46e5; color: white; } /* Indigo button */
        .btn-search:hover { background-color: #4338ca; }

        .btn-reset { background-color: #e5e7eb; color: #374151; }
        .btn-reset:hover { background-color: #d1d5db; }

        .btn-delete { 
            background-color: #fee2e2; 
            color: #ef4444; 
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
        }
        .btn-delete:hover { background-color: #fecaca; }

        /* GridView Styling */
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .grid-view th {
            background-color: #f9fafb;
            color: #6b7280;
            font-weight: 600;
            text-align: left;
            padding: 16px;
            border-bottom: 1px solid #e5e7eb;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
        }

        .grid-view td {
            padding: 16px;
            border-bottom: 1px solid #f3f4f6;
            color: #1f2937;
        }

        .grid-view tr:last-child td { border-bottom: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="display: flex; width: 100%;">
        
        <div class="sidebar">
            <div class="brand">Destiny Admin</div>
            
            <a href="AdminDashboard.aspx" class="menu-item">
                <i class="fas fa-th-large"></i> Dashboard
            </a>
            
            <a href="ManageRooms.aspx" class="menu-item">
                <i class="fas fa-bed"></i> Manage Rooms
            </a>
            
            <a href="ManageBookings.aspx" class="menu-item active">
                <i class="fas fa-calendar-check"></i> Bookings
            </a>

            <a href="Login.aspx" class="menu-item logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>

        <div class="main-content">
            <div class="page-header">
                <h1 class="page-title">Manage Bookings</h1>
                <p style="color: #6b7280; margin-top: 5px;">View and manage guest reservations</p>
            </div>

            <div class="container-box">
                <div class="search-box">
                    <asp:TextBox ID="txtSearchName" runat="server" placeholder="Search by Guest Name..." CssClass="input-style"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-search" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnClear_Click" />
                </div>

                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="grid-view" 
                    DataKeyNames="BookingID" OnRowDeleting="gvBookings_RowDeleting" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Guest Name" />
                        <asp:BoundField DataField="Phoneno" HeaderText="Phone" />
                        <asp:BoundField DataField="CheckIn" HeaderText="Check-In" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="CheckOut" HeaderText="Check-Out" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="RoomType" HeaderText="Room Type" />
                        <asp:BoundField DataField="NoOfRoom" HeaderText="Qty" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total (Incl. GST)" DataFormatString="₹{0:N2}" />
                        
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                    CssClass="btn-delete" OnClientClick="return confirm('Delete this booking permanently?');">
                                    <i class="fas fa-trash-alt"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align:center; padding: 20px; color: #6b7280;">
                            <i class="fas fa-folder-open" style="font-size: 24px; margin-bottom: 10px;"></i><br />
                            No bookings found.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

    </form>
</body>
</html>