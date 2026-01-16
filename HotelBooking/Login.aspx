<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelBooking.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <title>Login | Destiny Hotel</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700;900&display=swap');

        .login-wrapper {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/hotelview1.jpg'); 
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            color: white;
        }

        .top-nav {
            display: flex;
            justify-content: space-between;
            padding: 30px 8%;
            align-items: center;
        }

        .logo { font-size: 28px; letter-spacing: 3px; color: white; }
        .logo strong { font-weight: 900; color: #00cba9; }

        .top-nav .menu a { color: white; text-decoration: none; margin-left: 25px; font-size: 14px; }

        .main-content {
            display: flex;
            flex: 1;
            align-items: center;
            padding: 0 8%;
        }

        .text-side { flex: 1.2; padding-right: 50px; }
        .text-side h1 { font-size: 80px; margin: 0; font-weight: bold; }
        .text-side h2 { font-size: 24px; margin-bottom: 20px; font-weight: normal; }
        .text-side p { line-height: 1.6; font-size: 14px; max-width: 550px; opacity: 0.9; }

        .btn-learn {
            margin-top: 30px;
            background: transparent;
            border: 2px solid white;
            color: white;
            padding: 10px 30px;
            border-radius: 20px;
            cursor: pointer;
        }

        .form-side { flex: 0.8; display: flex; justify-content: flex-end; }

        .login-card {
            background: white;
            border-radius: 25px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            color: #333;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            display: flex;
            flex-direction: column;
        }

        .login-header {
            font-size: 36px;
            font-weight: 900;
            color: #333;
            letter-spacing: 4px;
            margin: 0 0 5px 0;
            text-align: center;
            text-transform: uppercase;
        }

        .elegant-line {
            width: 50px;
            height: 4px;
            background: #00cba9;
            margin: 0 auto 40px;
            border-radius: 2px;
        }

        .input-group { 
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 8px;
        }

        .icon {
            color: #00cba9;
            font-size: 18px;
            margin-right: 15px;
            width: 25px;
            text-align: center;
        }

        .input-stack { flex: 1; text-align: left; }
        .input-stack label { font-size: 11px; color: #999; display: block; font-weight: 600; margin-bottom: 2px; }

        /* Styling for TextBox and DropDownList */
        .input-stack input, .role-dropdown {
            border: none;
            width: 100%;
            outline: none;
            background: transparent;
            font-size: 15px;
            color: #333;
            font-family: 'Poppins', sans-serif;
        }

        .btn-login-teal {
            background: #00cba9;
            color: white;
            border: none;
            width: 100%;
            padding: 15px;
            font-weight: 700;
            letter-spacing: 2px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-login-teal:hover {
            background: #00a88d;
            box-shadow: 0 5px 15px rgba(0, 203, 169, 0.4);
            transform: translateY(-2px);
        }

        .signup-link {
            margin-top: 25px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
        .signup-link a { color: #00cba9; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-wrapper">
            <nav class="top-nav">
                <div class="logo"><strong>DESTINY</strong></div>
                <div class="menu">
                    <a href="WebForm1.aspx">Home</a>
                    <a href="Features.aspx">Features</a>
                    <a href="AboutUs.aspx">About</a>
                    <a href="Contact.aspx">Contact</a>
                </div>
            </nav>

            <div class="main-content">
                <div class="text-side">
                    <h1>Adventure Awaits</h1>
                    <h2>Luxury Escape</h2>
                    <p>
                        From the historic streets of Europe to the sun-drenched coasts of the Mediterranean, your dream destination is just a click away. DESTINY helps you find the perfect place to call home.
                    </p>
                    <button type="button" class="btn-learn">LEARN MORE</button>
                </div>

                <div class="form-side">
                    <div class="login-card">
                        <h2 class="login-header">LOGIN</h2>
                        <div class="elegant-line"></div>

                        <div class="input-group">
                            <i class="fas fa-user-tag icon"></i>
                            <div class="input-stack">
                                <label>SELECT ROLE</label>
                                <asp:DropDownList ID="ddlRole" runat="server" CssClass="role-dropdown">
                                    <asp:ListItem Value="user">User</asp:ListItem>
                                    <asp:ListItem Value="admin">Admin</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="input-group">
                            <i class="fas fa-lock icon"></i>
                            <div class="input-stack">
                                <label>ENTER PASSWORD</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                            </div>
                        </div>

                        <div class="input-group">
                            <i class="fas fa-envelope icon"></i>
                            <div class="input-stack">
                                <label>ENTER EMAIL</label>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="example@mail.com"></asp:TextBox>
                            </div>
                        </div>

                        <div class="input-group">
                            <i class="fas fa-phone icon"></i>
                            <div class="input-stack">
                                <label>ENTER PHONE NO</label>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="0123456789"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="btn-login-teal" OnClick="btnLogin_Click" />

                        <div class="signup-link">
                            Don't have an account? <a href="Register.aspx">Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>