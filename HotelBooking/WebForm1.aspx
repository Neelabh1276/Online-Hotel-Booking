<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HotelBooking.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Booking Application</title>
    <style type="text/css">
        /*CSS DONE BY GOOGLE GEMINI*/
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@900&display=swap');
        body {
            background-image: url('images/Homepage.jpg'); 
            background-size: cover;
            background-attachment: fixed;
            background-repeat:no-repeat;
            background-color:#f8f9fa;
            background-position:center;
            margin:0;
            padding:0;
            width:100%;
            overflow-x:hidden;
            font-family:'Segoe UI',Tahoma,Geneva,Verdana, sans-serif;
        }
        .auto-style3 {
            width: 1395px;
            height: 37px;
            color: white; 
        }
        .navbar{
            display: flex;
            justify-content:space-between;
            align-items:center;
            background-color:white;
            padding:20px 8%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .logo{
        font-family: 'Poppins', sans-serif;
        font-size: 30px; 
        letter-spacing: 3px;
        color: #00cba9; 
        text-transform: uppercase;
        }
        .logo strong{
            font-weight:900;
            color:#00cba9;
        }
        .nav-links{
            display:flex;
            list-style:none;
            margin:0;
            padding:0;
        }
        .nav-links li{
            margin:0 20px;
        }
        .nav-links a{
            text-decoration:none;
            color:#666;
            font-weight:500;
            transition:0.3s;
        }
        .nav-links a:hover{
            color:#007bff;
        }
        .nav-auth{
            display:flex;
            align-items:center;
            grid-gap:15px;
        }
        .btn-login{
            text-decoration:none;
            background-color:#007bff;
            color:white;
            padding:8px 25px;
            border-radius:20px;
            transition:0.3s;
        }
        .btn-login:hover{
            background-color:#0056b3;
        }
        .hero-container{
        background-image: linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.2)), url('images/Homepage.jpg');
        background-size: cover;
        background-position: center;
        height: 450px; 
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        position: relative; 
        width: 100%;

        }
        .hero-text h1{
            font-size:3rem;
            margin-bottom:10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        .search-panel{
        background: white;
        display: flex;
        padding: 10px 25px;
        border-radius: 50px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        position: absolute;
        bottom: -35px;     
        left: 50% !important; 
        transform: translateX(-50%) !important;
        width: 90%;
        max-width: 1000px;
        z-index: 9999;     
        align-items: center;
        margin: 0;
        }
        .input-group{
            flex:1;
            display:flex;
            flex-direction:column;
            text-align:left;
            padding:0 15px;
            border-right:1px solid #eee;
        }
        .input-group:last-of-type {
            border-right:none;
        }
        .input-group label{
            color:#333;
            font-weight:bold;
            font-size:0.8rem;
        }
        .input-group input, .input-group select{
            border:none;
            outline:none;
            color:#666;
            padding-top:5px;
            background:transparent;
        }
        .search-btn {
            background-color:#007bff;
            color:white;
            width:50px;
            height:50px;
            border-radius:50%;
            display:flex;
            justify-content:center;
            text-decoration:none;
            font-size:20px;
            line-height:1;
            border:none;
            padding:0;
            margin:0;
            cursor:pointer;

            transition:0.3s;
        }
        .search-btn:after{
            content:'';
            display:block;
        }
        .search-btn:hover{
            background-color:#0056b3; 
            transform: scale(1.1);
        }
        .popular-section{
        background-color: white; 
        padding:80px 8% 40px 8%;
        width: 100%;
        margin-top:0;
        box-sizing: border-box;
        position: relative;
        z-index: 1;      
        }
        .section-title{
            font-size:24px;
            color:#333;
            margin-bottom:30px;
            font-weight:600;
        }
        .destination-grid{
            display:flex;
            grid-gap:20px;
            height:400px;
            margin-bottom:50px;
        }
        .dest-column{
            flex:1;
            display:flex;
            flex-direction:column;
            grid-gap:20px;
        }
        .dest-row{
            display:flex;
            grid-gap:20px;
            flex:1;
            height:50%;
        }
        .dest-card{
        background-size: cover;
        background-position: center;
        border-radius: 20px;
        flex: 1;
        position: relative;
        }
        .dest-card:hover{
            transform:translateY(-5px);
        }
        .large{
            flex:1.2;
        }
        .medium{
            flex:1;
        }
        .wide{
            flex:1;
        }
        .small{
            flex:1;
        }
        .dest-label{
        position: absolute;
        bottom: 15px;
        left: 15px;
        background: rgba(255, 255, 255, 0.9);
        color: #333;
        padding: 4px 12px;
        border-radius: 15px;
        font-size: 12px;
        font-weight: 500;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="logo">DESTINY</div>
            <ul class="nav-links">
                            <li><a href="WebForm1.aspx">Home</a></li>
                            <li><a href="Room.aspx">Rooms</a></li>
                            <li><a href="AboutUs.aspx">About Us</a></li>
                            <li><a href="Contact.aspx">Contact us</a></li>
                        </ul>
            <div class="nav-auth">
                <a href="Register.aspx" class="btn-signup">Sign Up</a><br />
                <a href="Login.aspx" class="btn-login">Login</a>
            </div>
            </nav>
        <div class="hero-container">
            <div class="hero-content">
                <h1>Book your stay with DESTINY</h1>
                <p><center>Over 1,000 rooms around the world are waiting for you!</center></p>
            </div>
             <div class="search-panel">
                <div class="input-group">
                    <label>Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" placeholder="Where are you going?"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label>Check-Out</label>
                    <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label>Guests</label>
                    <asp:DropDownList ID="ddlGuests" runat="server">
                        <asp:ListItem>1 Guest</asp:ListItem>
                        <asp:ListItem>2 Guests</asp:ListItem>
                        <asp:ListItem>3+ Guests</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="search-btn" OnClick="btnSearch_Click">&#10142;</asp:LinkButton>
                 </div>
                        </div>
            <div class="popular-section">
                <h2 class="section-title">Popular Destinations</h2>
                <div class="destination-grid">
                    <div class="dest-card large" style="background-image: url('images/spain.jpg');">
                        <span class="dest-label">Spain</span>
                    </div>
                    <div class="dest-column">
                        <div class="dest-card medium" style="background-image: url('images/london.jpg');">
                            <span class="dest-label">London</span>
                        </div>
                        <div class="dest-card medium" style="background-image: url('images/lisbon.jpg');">
                            <span class="dest-label">Lisbon</span>
                        </div>
                    </div>
                    <div class="dest-column">
                        <div class="dest-card wide" style="background-image: url('images/croatia.jpg');">
                            <span class="dest-label">Croatia</span>
                        </div>
                        <div class="dest-row">
                            <div class="dest-card small" style="background-image: url('images/bratislava.jpg');">
                            <span class="dest-label">Bratislava</span>
                        </div>
                            <div class="dest-card small" style="background-image: url('images/copenhagen.jpg');">
                            <span class="dest-label">Copenhagen</span>
                        
                    </div>
                </div>
            </div>
            </div>
        </div>
    </form>
</body>
</html>
