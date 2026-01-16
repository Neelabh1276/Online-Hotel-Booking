<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HotelBooking.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap');

        :root {
            --primary: #00cba9;
            --primary-dark: #00a88d;
            --dark: #111c44;
            --light: #f8f9fa;
            --text-gray: #6b7280;
        }

        body { margin: 0; font-family: 'Inter', sans-serif; background-color: var(--light); color: #1f2937; overflow-x: hidden; }

        /* --- Navbar --- */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 20px 8%; position: absolute; width: 84%; top: 0; z-index: 1000; }
        .logo { font-weight: 800; font-size: 26px; color: white; letter-spacing: 2px; }
        .nav-links a { margin-left: 30px; text-decoration: none; color: white; font-size: 14px; font-weight: 500; opacity: 0.85; transition: 0.3s; text-transform: uppercase; letter-spacing: 1px; }
        .nav-links a:hover, .nav-links a.active { opacity: 1; color: var(--primary); }
        .btn-nav { padding: 10px 24px; border-radius: 2px; font-weight: 600; text-decoration: none; font-size: 14px; transition: 0.3s; text-transform: uppercase; letter-spacing: 1px; }
        .btn-login { background: var(--primary); color: white; border: none; }
        .btn-login:hover { background: var(--primary-dark); box-shadow: 0 5px 15px rgba(0, 203, 169, 0.3); }

        /* --- Hero Section --- */
        .hero {
            height: 60vh;
            background: linear-gradient(rgba(17, 28, 68, 0.7), rgba(17, 28, 68, 0.7)), url('https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?q=80&w=2070');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding-top: 60px;
        }

        .hero h1 { font-family: 'Playfair Display', serif; font-size: 56px; margin-bottom: 15px; animation: fadeInUp 0.8s ease; }
        .hero p { font-size: 18px; opacity: 0.9; max-width: 500px; margin: 0 auto; animation: fadeInUp 1s ease; font-weight: 300; }

        /* --- Contact Container --- */
        .contact-section { padding: 80px 8%; position: relative; margin-top: -80px; z-index: 10; }
        
        .contact-grid { 
            display: grid; 
            grid-template-columns: 1fr 1.5fr; 
            gap: 40px; 
            max-width: 1200px; 
            margin: 0 auto; 
        }

        /* --- Info Cards (Left Side) --- */
        .info-card {
            background: var(--dark);
            color: white;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .info-title { font-family: 'Playfair Display', serif; font-size: 32px; margin-bottom: 30px; }
        .info-text { opacity: 0.8; line-height: 1.6; margin-bottom: 40px; font-weight: 300; }

        .info-item { display: flex; align-items: flex-start; margin-bottom: 30px; }
        .info-icon { 
            width: 50px; height: 50px; 
            background: rgba(255,255,255,0.1); 
            border-radius: 50%; 
            display: flex; align-items: center; justify-content: center; 
            margin-right: 20px; 
            font-size: 20px; 
            color: var(--primary);
            transition: 0.3s;
        }
        .info-item:hover .info-icon { background: var(--primary); color: white; }
        
        .info-content h4 { margin: 0 0 5px; font-size: 16px; font-weight: 600; }
        .info-content p { margin: 0; font-size: 14px; opacity: 0.7; }

        /* --- Form (Right Side) --- */
        .form-card {
            background: white;
            padding: 50px;
            border-radius: 4px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
        }

        .form-title { color: var(--dark); font-size: 28px; margin-bottom: 30px; font-weight: 700; font-family: 'Playfair Display', serif; }

        .form-group { margin-bottom: 25px; position: relative; }
        .form-label { font-size: 12px; font-weight: 600; color: var(--text-gray); text-transform: uppercase; margin-bottom: 8px; display: block; letter-spacing: 1px; }
        
        .form-control {
            width: 100%;
            padding: 15px;
            border: 1px solid #e5e7eb;
            background: #f9fafb;
            border-radius: 4px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: var(--dark);
            transition: 0.3s;
            box-sizing: border-box; /* Fixes padding overflow */
        }
        
        .form-control:focus {
            border-color: var(--primary);
            background: white;
            outline: none;
            box-shadow: 0 0 0 4px rgba(0, 203, 169, 0.1);
        }

        .btn-submit {
            background: var(--dark);
            color: white;
            padding: 18px 40px;
            border: none;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            width: 100%;
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn-submit:hover { background: var(--primary); transform: translateY(-3px); box-shadow: 0 10px 20px rgba(0, 203, 169, 0.2); }

        /* --- Map Section --- */
        .map-wrapper { width: 100%; height: 450px; filter: grayscale(20%); transition: 0.5s; }
        .map-wrapper:hover { filter: grayscale(0%); }

        /* --- Footer --- */
        .footer { background: var(--dark); color: white; padding: 60px 8%; text-align: center; font-size: 14px; opacity: 0.95; border-top: 5px solid var(--primary); }
        .footer-logo { font-size: 24px; font-weight: 800; margin-bottom: 20px; display: inline-block; letter-spacing: 2px; }

        /* Animation */
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar">
            <div class="logo">DESTINY</div>
            <div class="nav-links">
                <a href="WebForm1.aspx">Home</a>
                <a href="Room.aspx">Rooms</a>
                <a href="AboutUs.aspx">About Us</a>
                <a href="Contact.aspx" class="active">Contact</a>
            </div>
            <div>
                <a href="Register.aspx" class="btn-nav" style="color: white; margin-right: 15px;">Sign Up</a>
                <a href="Login.aspx" class="btn-nav btn-login">Login</a>
            </div>
        </nav>

        <div class="hero">
            <div>
                <h1>Get in Touch</h1>
                <p>We are here to help you plan your perfect stay.</p>
            </div>
        </div>

        <div class="contact-section">
            <div class="contact-grid">
                
                <div class="info-card">
                    <div>
                        <h3 class="info-title">Contact Information</h3>
                        <p class="info-text">Have a question or need assistance? Reach out to our concierge team 24/7.</p>
                        
                        <div class="info-item">
                            <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                            <div class="info-content">
                                <h4>Our Location</h4>
                                <p>12 Norrebro St, Copenhagen, Denmark</p>
                            </div>
                        </div>

                        <div class="info-item">
                            <div class="info-icon"><i class="fas fa-phone-alt"></i></div>
                            <div class="info-content">
                                <h4>Phone Number</h4>
                                <p>+45 123 456 789</p>
                            </div>
                        </div>

                        <div class="info-item">
                            <div class="info-icon"><i class="fas fa-envelope"></i></div>
                            <div class="info-content">
                                <h4>Email Address</h4>
                                <p>reservations@destinyhotel.com</p>
                            </div>
                        </div>
                    </div>
                    
                    <div style="margin-top: 30px;">
                        <p style="font-size: 13px; opacity: 0.6; text-transform: uppercase; letter-spacing: 1px;">Follow Us</p>
                        <div style="font-size: 20px;">
                            <a href="#" style="color: white; margin-right: 15px;"><i class="fab fa-facebook"></i></a>
                            <a href="#" style="color: white; margin-right: 15px;"><i class="fab fa-instagram"></i></a>
                            <a href="#" style="color: white;"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div>

                <div class="form-card">
                    <h3 class="form-title">Send us a Message</h3>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="form-group">
                            <label class="form-label">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Doe"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="john@example.com"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="How can we help you?"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>

        <iframe class="map-wrapper" 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2249.052648784323!2d12.558376315822346!3d55.68834608053616!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4652530510515151%3A0x6291244030671607!2sN%C3%B8rrebro%2C%20Copenhagen%2C%20Denmark!5e0!3m2!1sen!2sin!4v1625634567890!5m2!1sen!2sin" 
            style="border:0;" allowfullscreen="" loading="lazy">
        </iframe>

        <div class="footer">
            <div class="footer-logo">DESTINY</div>
            <p>&copy; 2026 Destiny Hotels & Resorts. Crafting the future of hospitality.</p>
        </div>

    </form>
</body>
</html>