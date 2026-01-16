<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="HotelBooking.ManageRooms" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Manage Rooms | Destiny Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
        
        body { margin: 0; font-family: 'Inter', sans-serif; background-color: #f4f7fe; display: flex; overflow-x: hidden; }
        
        /* Sidebar Styling */
        .sidebar { width: 260px; height: 100vh; background: #111c44; color: white; position: fixed; padding: 30px 20px; z-index: 100; }
        .sidebar h2 { color: #00cba9; font-size: 22px; margin-bottom: 40px; text-align: center; letter-spacing: 2px; font-weight: 800; }
        .nav-item { padding: 15px; color: #a3b1cc; text-decoration: none; display: block; border-radius: 10px; margin-bottom: 5px; transition: 0.3s; font-weight: 500; }
        .nav-item:hover, .nav-item.active { background: rgba(255,255,255,0.1); color: white; }
        
        /* Main Layout */
        .main-content { margin-left: 260px; padding: 40px; width: calc(100% - 260px); min-height: 100vh; }
        .header-flex { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .header-flex h1 { font-size: 28px; color: #2b3674; margin: 0; font-weight: 700; }

        /* Content Card */
        .manage-card { background: white; border-radius: 20px; padding: 30px; box-shadow: 0 10px 30px rgba(0,0,0,0.02); }
        
        /* Search & Actions */
        .action-bar { display: flex; gap: 15px; margin-bottom: 25px; }
        .search-box { padding: 12px 20px; border: 1px solid #e0e5f2; border-radius: 12px; width: 320px; outline: none; transition: 0.3s; }
        .search-box:focus { border-color: #4318ff; box-shadow: 0 0 0 3px rgba(67, 24, 255, 0.1); }
        
        .btn-custom { padding: 12px 24px; border: none; border-radius: 12px; cursor: pointer; font-weight: 600; transition: 0.3s; display: inline-flex; align-items: center; gap: 8px; }
        .btn-search { background: #4318ff; color: white; }
        .btn-add { background: #00cba9; color: white; margin-left: auto; text-decoration: none; }

        /* GridView Styling */
        .custom-grid { width: 100%; border-collapse: collapse; margin-top: 10px; border: none !important; }
        .custom-grid th { text-align: left; padding: 15px; color: #a3b1cc; font-size: 12px; text-transform: uppercase; border-bottom: 1px solid #f4f7fe; letter-spacing: 1px; }
        .custom-grid td { padding: 20px 15px; color: #2b3674; font-weight: 600; border-bottom: 1px solid #f4f7fe; vertical-align: middle; }
        
        .badge-status { padding: 6px 14px; border-radius: 10px; font-size: 12px; font-weight: 700; }
        .badge-ac { background: #e2f9f5; color: #00cba9; }
        .badge-non { background: #fff5e9; color: #ffb547; }

        .action-link { font-size: 18px; margin-right: 15px; transition: 0.2s; background: none; border: none; padding: 0; }
        .edit-link { color: #4318ff; }
        .delete-link { color: #ee5d50; }
        .action-link:hover { transform: scale(1.2); }

        /* Modal Overrides */
        .modal-content { border-radius: 24px; border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.1); }
        .form-control, .form-select { border-radius: 12px; padding: 12px; border: 1px solid #e0e5f2; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2>DESTINY ADMIN</h2>
            <a href="AdminDashboard.aspx" class="nav-item"><i class="fas fa-th-large"></i> &nbsp; Dashboard</a>
            <a href="ManageRooms.aspx" class="nav-item active"><i class="fas fa-bed"></i> &nbsp; Manage Rooms</a>
            <a href="ManageBookings.aspx" class="nav-item"><i class="fas fa-calendar-check"></i> &nbsp; Bookings</a>
            <a href="Login.aspx" class="nav-item" style="margin-top: 250px; color: #ff5f5f;"><i class="fas fa-sign-out-alt"></i> &nbsp; Logout</a>
        </div>

        <div class="main-content">
            <div class="header-flex">
                <h1>Manage Rooms</h1>
                <asp:LinkButton ID="btnAddTrigger" runat="server" CssClass="btn-custom btn-add">
                    <i class="fas fa-plus"></i> Add New Room
                </asp:LinkButton>
            </div>

            <div class="manage-card">
                <div class="action-bar">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search by Room ID or Type..."></asp:TextBox>
                    <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn-custom btn-search" OnClick="btnSearch_Click">
                        <i class="fas fa-search"></i> Search
                    </asp:LinkButton>
                </div>

                <asp:GridView ID="gvRooms" runat="server" AutoGenerateColumns="False" CssClass="custom-grid" 
                    GridLines="None" ShowHeaderWhenEmpty="true" OnRowEditing="gvRooms_RowEditing" OnRowDeleting="gvRooms_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="RoomID" HeaderText="ID" />
                        <asp:BoundField DataField="RoomNo" HeaderText="Room Number" />
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <span class='<%# Eval("Type").ToString() == "AC" ? "badge-status badge-ac" : "badge-status badge-non" %>'>
                                    <%# Eval("Type") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Price / Night" DataFormatString="₹{0:N0}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="action-link edit-link">
                                    <i class="fas fa-pen-to-square"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="action-link delete-link" 
                                    OnClientClick="return confirm('Delete this room from inventory?');">
                                    <i class="fas fa-trash-can"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align:center; padding: 20px; color: #a3b1cc;">No rooms found in inventory.</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <div class="modal fade" id="editRoomModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" style="font-weight:700; color:#2b3674;">Update Room Info</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditRoomID" runat="server" />
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-muted">ROOM NUMBER</label>
                            <asp:TextBox ID="txtEditRoomNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-muted">TYPE</label>
                            <asp:DropDownList ID="ddlEditType" runat="server" CssClass="form-select">
                                <asp:ListItem Value="AC">Air Conditioned (AC)</asp:ListItem>
                                <asp:ListItem Value="Non-AC">Non-Air Conditioned (Non-AC)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-muted">PRICE (INR)</label>
                            <asp:TextBox ID="txtEditPrice" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnUpdateRoom" runat="server" Text="Update Changes" 
                            CssClass="btn w-100 py-3 fw-bold" style="background:#4318ff; color:white; border-radius:12px;" 
                            OnClick="btnUpdateRoom_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>