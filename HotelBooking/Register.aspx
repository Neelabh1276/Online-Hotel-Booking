<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HotelBooking.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /*CSS DONE BY GOOGLE GEMINI*/
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;700&display=swap');

        body {
            margin: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #e8f5e9; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .main-card {
            background: white;
            width: 1000px;
            height: 650px;
            border-radius: 40px;
            display: flex;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.05);
        }

       
        .form-container {
            flex: 1;
            padding: 50px 70px;
            display: flex;
            flex-direction: column;
        }

        .header-section h2 { font-size: 40px; letter-spacing:-1px; margin: 0; font-weight: 800; color: #1a1a1a; }
        .header-section p { color: #888; margin-top: 5px; font-size: 14px; }
        .header-section .sub-text{
            color: #666; 
            margin-top: 8px; 
            font-size: 15px; 
            font-weight: 600; 
            letter-spacing: 0.2px;
        }
        .header-section .sub-text span{
            color:#00cba9;
            font-weight:700;
        }
        .input-wrap { margin-top: 35px; }

        .field { margin-bottom: 18px; }
        .field label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; color: #444; }
        
        .custom-input {
            width: 100%;
            padding: 12px 18px;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            background: #fdfdfd;
            font-size: 14px;
            transition: 0.3s;
            outline: none;
        }
        .custom-input:focus { border-color: #4caf50; background: #fff; }

      
        .visual-container {
            flex: 1;
            background: #f1f8f1;
            margin: 15px;
            border-radius: 30px;
            background-image: url('https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .floating-box {
            position: absolute;
            bottom: 30px;
            left: 30px;
            right: 30px;
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 20px;
        }
        
.btn-submit {
    display: inline-block;
    background-color: #00cba9; 
    color: white;
    padding: 15px 40px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 700;
    font-size: 16px;
    transition: 0.3s;
    box-shadow: 0 10px 20px rgba(0, 203, 169, 0.2);
}

.btn-submit:hover {
    background-color: #00a88d;
    transform: translateY(-2px);
}


.field label {
    font-size: 11px;
    letter-spacing: 1px;
    color: #999;
}
.bg-slideshow{
position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1; 
    list-style: none;
    margin: 0;
    padding: 0;
}
.bg-slideshow li{
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    opacity: 0;
    z-index: 0;
    animation: imageAnimation 36s linear infinite;
}
.bg-slideshow li:nth-child(1) { 
    background-image: url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=2070'); 
}
.bg-slideshow li:nth-child(2) { 
    background-image: url('https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080');
    animation-delay: 12s; 
}
.bg-slideshow li:nth-child(3) { 
    background-image: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?q=80&w=2070');
    animation-delay: 24s; 
}


@keyframes imageAnimation { 
    0% { opacity: 0; animation-timing-function: ease-in; }
    8% { opacity: 1; transform: scale(1.05); animation-timing-function: ease-out; }
    17% { opacity: 1; transform: scale(1.1); }
    25% { opacity: 0; transform: scale(1.1); }
    100% { opacity: 0; }
}


.bg-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.2);
    z-index: -1;
}
    </style>
</head>
<body>
    <ul class="bg-slideshow">
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <div class="bg-overlay"></div>
    <form id="form1" runat="server">
        <div class="main-card">
            <div class="form-container">
                <div class="header-section">
                    <h2>Sign UP</h2>
                    <p class="sub-text">Welcome to <span>DESTINY</span>-Let's create an account</p>
                </div>

                <div class="input-wrap">
                    <div class="field">
    <label>NAME</label>
    <asp:TextBox ID="txtName" runat="server" CssClass="custom-input" placeholder="abcd"></asp:TextBox>
</div>

<div class="field">
    <label>USERNAME</label>
    <asp:TextBox ID="txtUser" runat="server" CssClass="custom-input" placeholder="abcd123"></asp:TextBox>
</div>

<div class="field">
    <label>E-MAIL</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="custom-input" placeholder="abcd123@gmail.com"></asp:TextBox>
</div>

<div class="field">
    <label>PHONE NO</label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="custom-input" placeholder="0123456789"></asp:TextBox>
</div>

<div class="field">
    <label>PASSWORD</label>
    <asp:TextBox ID="txtPass" runat="server" CssClass="custom-input" TextMode="Password"></asp:TextBox>
</div>

<div style="margin-top: 30px; text-align: center;">
    <asp:LinkButton ID="btnRegSubmit" runat="server" CssClass="btn-submit" OnClick="btnRegSubmit_Click">
        Create Account
    </asp:LinkButton>
</div>
                   </div>
            </div>

            <div class="visual-container">
                <div class="floating-box">
                    <h4 style="margin:0; font-size:16px;">Find Your Fitting Places</h4>
                    <p style="margin:5px 0 0 0; font-size:12px; color:#666;">Helping to achieve the Best Experiences.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
