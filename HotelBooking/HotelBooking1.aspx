<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelBooking1.aspx.cs" Inherits="HotelBookingSite.HotelBooking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DESTINY - Hotel Booking</title>
    <link href="HotelBooking.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5;
    color: #333;
}

.container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 20px;
}


.header {
    background-color: #ffffff;
    padding: 20px 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.nav-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 32px;
    font-weight: bold;
    color: #00CED1;
   
    letter-spacing: 1px;
}

.nav-menu {
    display: flex;
    gap: 40px;
}

.nav-menu a {
    color: #666;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s;
}

.nav-menu a:hover {
    color: #333;
}

.auth-buttons {
    display: flex;
    gap: 15px;
}

.btn-signup {
    padding: 10px 30px;
    border: 2px solid #2196F3;
    background-color: transparent;
    color: #2196F3;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-signup:hover {
    background-color: #2196F3;
    color: white;
}

.btn-login {
    padding: 10px 30px;
    border: none;
    background-color: #2196F3;
    color: white;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-login:hover {
    background-color: #1976D2;
}


.main-container {
    padding: 40px 0;
}

.content-wrapper {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}


.left-panel {
    padding-right: 40px;
}

.back-button {
    margin-bottom: 30px;
    cursor: pointer;
}

.back-button i {
    font-size: 24px;
    color: #333;
}

.page-title {
    font-size: 32px;
    font-weight: 600;
    margin-bottom: 40px;
    color: #000;
}

.section {
    margin-bottom: 50px;
}

.section-title {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 10px;
}

.section-subtitle {
    color: #666;
    margin-bottom: 25px;
    font-size: 16px;
}


.amenities-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 30px;
}

.amenity-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 15px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
}

.amenity-item i {
    font-size: 20px;
    color: #333;
}

.breakfast-text {
    font-size: 16px;
    color: #333;
    margin-top: 20px;
}


.form-group {
    margin-bottom: 25px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 15px;
    color: #333;
    font-weight: 500;
}

.form-input {
    width: 100%;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 15px;
    transition: border-color 0.3s;
}

.form-input:focus {
    outline: none;
    border-color: #2196F3;
}

.form-input::placeholder {
    color: #999;
}


.bed-selection-group {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.email-input {
    flex: 1;
}

.bed-options {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    gap: 10px;
    margin-top: 10px;
}

.bed-option {
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    text-align: center;
    font-size: 14px;
    color: #666;
}

.bed-option-main {
    padding: 0;
}

.bed-dropdown {
    width: 100%;
    padding: 15px;
    border: 2px solid #2196F3;
    border-radius: 8px;
    font-size: 15px;
    background-color: white;
    cursor: pointer;
}


.total-price-group {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    border: 2px solid #2196F3;
}

.price-display {
    font-size: 20px;
    font-weight: bold;
    color: #2196F3;
    background-color: white;
}

.btn-calculate {
    width: 100%;
    padding: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 10px;
    transition: all 0.3s;
}

.btn-calculate:hover {
    background-color: #45a049;
}


.right-panel {
    padding-left: 40px;
    border-left: 1px solid #e0e0e0;
}

.hotel-card {
    background-color: white;
}

.hotel-image {
    width: 100%;
    height: 350px;
    object-fit: cover;
    border-radius: 12px;
    margin-bottom: 25px;
}

.hotel-info {
    margin-bottom: 30px;
}

.hotel-name {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 10px;
}

.stars {
    color: #666;
    font-size: 20px;
}

.rating {
    display: flex;
    align-items: center;
    gap: 10px;
}

.star {
    color: #FFC107;
    font-size: 14px;
}

.rating-text {
    color: #666;
    font-size: 14px;
}


.booking-details {
    margin-bottom: 30px;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #f0f0f0;
}

.detail-label {
    font-weight: 500;
    color: #333;
}

.detail-value {
    color: #666;
}


.room-info {
    margin-bottom: 25px;
}

.room-type {
    font-size: 20px;
    font-weight: 600;
    color: #333;
}


.price-breakdown {
    margin-bottom: 30px;
}

.price-row {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
}

.price-label {
    color: #666;
    font-size: 15px;
}

.price-value {
    font-weight: 600;
    color: #333;
    font-size: 15px;
}


.book-button-wrapper {
    text-align: center;
}

.btn-book-now {
    width: 100%;
    padding: 18px;
    background-color: #2196F3;
    color: white;
    border: none;
    border-radius: 30px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-book-now:hover {
    background-color: #1976D2;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(33, 150, 243, 0.4);
}


@media (max-width: 1024px) {
    .content-wrapper {
        grid-template-columns: 1fr;
    }

    .right-panel {
        padding-left: 0;
        border-left: none;
        padding-top: 40px;
        border-top: 1px solid #e0e0e0;
    }

    .amenities-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .nav-menu {
        display: none;
    }

    .logo {
        font-size: 24px;
    }

    .amenities-grid {
        grid-template-columns: 1fr;
    }

    .bed-options {
        grid-template-columns: 1fr;
    }

    .content-wrapper {
        padding: 20px;
    }
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="header">
            <div class="container">
                <div class="nav-wrapper">
                    <div class="logo">DESTINY</div>
                    <nav class="nav-menu">
                        <a href="#">Properties</a>
                        <a href="#">Attractions</a>
                        <a href="#">Popular</a>
                    </nav>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="main-container">
            <div class="container">
                <div class="content-wrapper">
                    <!-- Left Panel -->
                    <div class="left-panel">
                        <div class="back-button">
                            <i class="fas fa-arrow-left"></i>
                        </div>
                        
                        <h1 class="page-title">Book Hotel Norrebro</h1>
                        
                        <!-- Step 1: Amenities -->
                        <div class="section">
                            <h2 class="section-title">Step 1:</h2>
                            <p class="section-subtitle">Property amenities</p>
                            
                            <div class="amenities-grid">
                                <div class="amenity-item">
                                    <i class="fas fa-wifi"></i>
                                    <span>Free WiFi</span>
                                </div>
                                <div class="amenity-item">
                                    <i class="fas fa-parking"></i>
                                    <span>Free parking</span>
                                </div>
                                <div class="amenity-item">
                                    <i class="fas fa-car"></i>
                                    <span>Free parking</span>
                                </div>
                                <div class="amenity-item">
                                    <i class="fas fa-info-circle"></i>
                                    <span>Free parking</span>
                                </div>
                                <div class="amenity-item">
                                    <i class="fas fa-key"></i>
                                    <span>Key card access</span>
                                </div>
                                <div class="amenity-item">
                                    <i class="fas fa-snowflake"></i>
                                    <span>Air conditioning</span>
                                </div>
                            </div>
                            
                            <p class="breakfast-text">Breakfast included</p>
                        </div>
                        
                        <!-- Step 2: Booking Details -->
                        <div class="section">
                            <h2 class="section-title">Step 2: Booking Details</h2>
                            
                            <div class="form-group">
                                <label>Check-In Date</label>
                                <asp:TextBox ID="txtCheckIn" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Check-In Time (Default: 12:01 PM)</label>
                                <asp:TextBox ID="txtCheckInTime" runat="server" CssClass="form-input" TextMode="Time" placeholder="12:01 PM"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Check-Out Date</label>
                                <asp:TextBox ID="txtCheckOut" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Check-Out Time (Default: 11:00 AM)</label>
                                <asp:TextBox ID="txtCheckOutTime" runat="server" CssClass="form-input" TextMode="Time" placeholder="11:00 AM"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Room Type</label>
                                <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="form-input">
                                    <asp:ListItem Text="Select Room Type" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Standard Double Room" Value="Standard Double Room"></asp:ListItem>
                                    <asp:ListItem Text="Deluxe Room" Value="Deluxe Room"></asp:ListItem>
                                    <asp:ListItem Text="Suite" Value="Suite"></asp:ListItem>
                                    <asp:ListItem Text="Executive Suite" Value="Executive Suite"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            
                            <div class="form-group">
                                <label>Number of Rooms</label>
                                <asp:TextBox ID="txtNoOfRoom" runat="server" CssClass="form-input" TextMode="Number" placeholder="1" min="1"></asp:TextBox>
                            </div>
                        </div>
                        
                        <!-- Step 3: Personal Data -->
                        <div class="section">
                            <h2 class="section-title">Step 3: Personal data</h2>
                            
                            <div class="form-group">
                                <label>First and Last name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="e.g. Maria Lost"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="+91 98765 43210"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Email address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="your.email@example.com"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label>Bed Type Preference</label>
                                <div class="bed-options">
                                    <div class="bed-option">1 option</div>
                                    <div class="bed-option-main">
                                        <asp:DropDownList ID="ddlBedType" runat="server" CssClass="bed-dropdown">
                                            <asp:ListItem Text="1 king" Value="1king"></asp:ListItem>
                                            <asp:ListItem Text="2 single" Value="2single"></asp:ListItem>
                                            <asp:ListItem Text="1 queen" Value="1queen"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="bed-option"></div>
                                </div>
                            </div>
                            
                            <div class="form-group total-price-group">
                                <label>Total Price (including 18% GST)</label>
                                <asp:TextBox ID="txtTotalPrice" runat="server" CssClass="form-input price-display" ReadOnly="true" placeholder="₹0.00"></asp:TextBox>
                                <asp:Button ID="btnCalculatePrice" runat="server" Text="Calculate Total Price" CssClass="btn-calculate" OnClick="btnCalculatePrice_Click" />
                            </div>
                        </div>
                    </div>
                    
                    <!-- Right Panel -->
                    <div class="right-panel">
                        <div class="hotel-card">
                            <img src="https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=500&fit=crop" alt="Hotel Room" class="hotel-image" />
                            
                            <div class="hotel-info">
                                <h2 class="hotel-name">Hotel Norrebro <span class="stars">***</span></h2>
                                <div class="rating">
                                    <span class="star">★★★★★</span>
                                    <span class="rating-text">5-star in the heart of Copenhagen</span>
                                </div>
                            </div>
                            
                            <div class="booking-details">
                                <div class="detail-row">
                                    <span class="detail-label">Check-in</span>
                                    <span class="detail-value">Friday, 09 December 2022</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Check-out</span>
                                    <span class="detail-value">Monday, 12 December 2022</span>
                                </div>
                            </div>
                            
                            <div class="room-info">
                                <h3 class="room-type">Standard double room</h3>
                            </div>
                            
                            <div class="price-breakdown">
                                <div class="price-row">
                                    <span class="price-label">Price per night</span>
                                    <span class="price-value">₹15,000</span>
                                </div>
                                <div class="price-row">
                                    <span class="price-label">3 nights</span>
                                    <span class="price-value">₹45,000</span>
                                </div>
                                <div class="price-row">
                                    <span class="price-label">City tax</span>
                                    <span class="price-value">₹5,000</span>
                                </div>
                                <div class="price-row">
                                    <span class="price-label">Service fee</span>
                                    <span class="price-value">₹1,500</span>
                                </div>
                            </div>
                            
                            <div class="book-button-wrapper">
                                <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn-book-now" OnClick="btnBookNow_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>