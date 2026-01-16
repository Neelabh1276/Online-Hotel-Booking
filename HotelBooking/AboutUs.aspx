<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="HotelBooking.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <%-- CSS done by Gemini --%>
    <style>
        /* Importing luxury fonts */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;800&family=Playfair+Display:ital,wght@0,500;0,700;1,500&display=swap');

        :root {
            --primary: #00cba9; 
            --primary-dark: #00a88d;
            --dark: #111c44; 
            --light: #f8f9fa;
            --text-gray: #666;
            --gold-accent: #d4af37;
        }

        body { margin: 0; font-family: 'Inter', sans-serif; color: #1a1a1a; overflow-x: hidden; background-color: var(--light); }
        
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
            height: 85vh;
            position: relative;
            background: linear-gradient(rgba(17, 28, 68, 0.6), rgba(17, 28, 68, 0.8)), url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=2070');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding-top: 60px;
        }
        
        .hero-content { z-index: 2; }
        .hero-content h1 { font-family: 'Playfair Display', serif; font-size: 72px; font-weight: 700; margin-bottom: 25px; animation: fadeInUp 1s ease; letter-spacing: -1px; }
        .hero-content h1 span { color: var(--primary); font-style: italic; }
        .hero-content p { font-size: 20px; max-width: 650px; margin: 0 auto; line-height: 1.7; opacity: 0.9; animation: fadeInUp 1.2s ease; font-weight: 300; }

        .scroll-down { position: absolute; bottom: 40px; left: 50%; transform: translateX(-50%); animation: bounce 2s infinite; opacity: 0.7; }
        .scroll-down i { font-size: 24px; color: white; }

        /* --- Standard Sections --- */
        .section { padding: 120px 8%; position: relative; }
        .pattern-bg { background-color: #fff; background-image: radial-gradient(#111c4408 1px, transparent 1px); background-size: 20px 20px; }

        .subtitle { color: var(--primary); font-weight: 700; letter-spacing: 3px; text-transform: uppercase; font-size: 13px; margin-bottom: 20px; display: block; position: relative; padding-left: 50px; }
        .subtitle::before { content: ''; position: absolute; left: 0; top: 50%; height: 2px; width: 40px; background: var(--primary); }
        
        .section-title { font-size: 48px; font-weight: 700; color: var(--dark); margin: 0 0 30px 0; font-family: 'Playfair Display', serif; line-height: 1.2; }
        .text-content { color: var(--text-gray); line-height: 1.9; font-size: 17px; margin-bottom: 30px; font-weight: 300; }

        /* --- Story Section --- */
        .story-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 80px; align-items: center; }
        .img-frame { position: relative; z-index: 1; }
        .img-frame::after { content: ''; position: absolute; top: 30px; left: 30px; width: 100%; height: 100%; border: 3px solid var(--primary); z-index: -1; transition: 0.4s; }
        .story-img { width: 100%; border-radius: 4px; box-shadow: 0 30px 60px rgba(0,0,0,0.15); transition: 0.4s; display: block; }
        .img-frame:hover .story-img { transform: translate(-15px, -15px); }
        .img-frame:hover::after { transform: translate(15px, 15px); }

        /* --- Stats Section --- */
        .stats-container { background: var(--dark); color: white; padding: 100px 8%; display: grid; grid-template-columns: repeat(4, 1fr); text-align: center; position: relative; overflow: hidden; }
        .stats-container::before { content: '\f005'; font-family: 'Font Awesome 6 Free'; font-weight: 900; position: absolute; font-size: 300px; color: rgba(255,255,255,0.03); top: -50px; left: -50px; rotate: -15deg; }
        
        .stat-item { position: relative; z-index: 2; }
        .stat-icon { font-size: 36px; color: var(--primary); margin-bottom: 20px; animation: pulse 3s infinite ease-in-out; }
        .stat-item h2 { font-size: 56px; color: white; margin: 0; font-weight: 800; font-family: 'Playfair Display', serif; }
        .stat-item p { font-size: 13px; opacity: 0.7; letter-spacing: 2px; margin-top: 15px; text-transform: uppercase; font-weight: 600; }

        /* --- UPDATED: Immersive Philosophy Section --- */
        .immersive-section {
            height: 70vh;
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?q=80&w=2070');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding: 0 10%; 
            position: relative;
        }

        /* Fixed Glassmorphism Box: Darker, sharper, and more readable */
        .glass-content {
            background: rgba(17, 28, 68, 0.75); 
            backdrop-filter: blur(15px); 
            -webkit-backdrop-filter: blur(15px);
            padding: 50px 60px;
            border-radius: 8px; 
            border-left: 5px solid var(--primary); 
            border-top: 1px solid rgba(255, 255, 255, 0.1); 
            max-width: 600px;
            color: white;
            box-shadow: 0 30px 60px rgba(0,0,0,0.3); 
        }

        .quote-icon { font-size: 32px; color: var(--primary); margin-bottom: 20px; opacity: 1; }
        .philosophy-title { font-family: 'Playfair Display', serif; font-size: 32px; margin-bottom: 25px; line-height: 1.4; color: white; }
        .philosophy-text { font-size: 18px; line-height: 1.8; opacity: 0.95; font-weight: 300; letter-spacing: 0.5px; }
        .signature { margin-top: 35px; font-family: 'Playfair Display', serif; font-style: italic; font-size: 18px; color: var(--primary); text-align: right; }

        /* --- Values Grid --- */
        .values-section { background: linear-gradient(to bottom, #fff, #f4f7f9); }
        .values-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px; margin-top: 60px; }
        .value-card { padding: 50px 40px; border-radius: 4px; background: white; box-shadow: 0 10px 30px rgba(0,0,0,0.05); transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1); position: relative; overflow: hidden; border-bottom: 3px solid transparent; }
        .value-card:hover { transform: translateY(-15px); box-shadow: 0 30px 60px rgba(0,0,0,0.1); border-bottom-color: var(--primary); }
        
        .value-icon-box { width: 70px; height: 70px; background: rgba(0, 203, 169, 0.1); display: flex; align-items: center; justify-content: center; border-radius: 50%; margin-bottom: 30px; transition: 0.4s; }
        .value-card:hover .value-icon-box { background: var(--primary); }
        .value-icon-box i { font-size: 28px; color: var(--primary); transition: 0.4s; }
        .value-card:hover .value-icon-box i { color: white; }
        .value-card h3 { font-size: 22px; margin-bottom: 20px; color: var(--dark); font-family: 'Playfair Display', serif; }

        /* --- Footer --- */
        .footer { background: var(--dark); color: white; padding: 60px 8%; text-align: center; font-size: 14px; opacity: 0.95; border-top: 5px solid var(--primary); }
        .footer-logo { font-size: 24px; font-weight: 800; margin-bottom: 20px; display: inline-block; letter-spacing: 2px; }

        /* --- Animations --- */
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(40px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes bounce { 0%, 20%, 50%, 80%, 100% { transform: translateY(0) translateX(-50%); } 40% { transform: translateY(-10px) translateX(-50%); } 60% { transform: translateY(-5px) translateX(-50%); } }
        @keyframes pulse { 0% { transform: scale(1); opacity: 1; } 50% { transform: scale(1.05); opacity: 0.8; } 100% { transform: scale(1); opacity: 1; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar">
            <div class="logo">DESTINY</div>
            <div class="nav-links">
                <a href="WebForm1.aspx">Home</a>
                <a href="Room.aspx">Rooms</a>
                <a href="AboutUs.aspx" class="active">About Us</a>
                <a href="Contact.aspx">Contact</a>
            </div>
            <div>
                <a href="Register.aspx" class="btn-nav" style="color: white; margin-right: 15px;">Sign Up</a>
                <a href="Login.aspx" class="btn-nav btn-login">Login</a>
            </div>
        </nav>

        <div class="hero">
            <div class="hero-content">
                <h1>Redefining <span>Luxury</span> Travel</h1>
                <p>More than just a stay. Destiny is a curated collection of moments, designed to inspire and rejuvenate the modern soul.</p>
            </div>
            <div class="scroll-down">
                <i class="fas fa-chevron-down"></i>
            </div>
        </div>

        <div class="section pattern-bg">
            <div class="story-grid">
                <div>
                    <span class="subtitle">Our Journey</span>
                    <h2 class="section-title">Crafting Memories Since 2010</h2>
                    <p class="text-content">
                        Destiny started with a rebellious idea: luxury shouldn't feel stiff. It should feel alive, personal, and deeply connected to its location. What began as a single design-led boutique property has evolved into a philosophy of hospitality.
                    </p>
                    <p class="text-content">
                        We forgo the traditional front desk for mobile check-ins and personalized concierges. We replace generic artwork with pieces from local artisans. Every detail is intentional, designed to connect you to the heartbeat of the city.
                    </p>
                </div>
                <div class="img-frame">
                    <img src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070" class="story-img" alt="Luxury Hotel Interior" />
                </div>
            </div>
        </div>

        <div class="stats-container">
            <div class="stat-item">
                <i class="fas fa-calendar-check stat-icon"></i>
                <h2>15+</h2>
                <p>Years of Excellence</p>
            </div>
            <div class="stat-item">
                <i class="fas fa-map-location-dot stat-icon"></i>
                <h2>42</h2>
                <p>Prime Destinations</p>
            </div>
            <div class="stat-item">
                <i class="fas fa-users stat-icon"></i>
                <h2>200k+</h2>
                <p>Distinguished Guests</p>
            </div>
            <div class="stat-item">
                <i class="fas fa-star stat-icon"></i>
                <h2>4.95</h2>
                <p>Guest Satisfaction</p>
            </div>
        </div>

        <div class="immersive-section">
            <div class="glass-content">
                <i class="fas fa-quote-left quote-icon"></i>
                <h2 class="philosophy-title">We believe that true luxury lies not in opulence, but in the absence of worry.</h2>
                <p class="philosophy-text">
                    "Our mission isn't just to provide a bed, but to create a sanctuary where time slows down. Where every interaction is seamless, and every moment feels curated just for you. Destiny is where you come to find yourself again."
                </p>
                <div class="signature">
                    - The Destiny Collective
                </div>
            </div>
        </div>

        <div class="section values-section">
            <div style="text-align: center; max-width: 750px; margin: 0 auto;">
                <span class="subtitle" style="padding-left: 0; display: inline-block;">The Destiny Standard</span>
                <h2 class="section-title">Why the World Chooses Us</h2>
            </div>
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon-box">
                        <i class="fas fa-gem"></i>
                    </div>
                    <h3>Uncompromising Quality</h3>
                    <p class="text-content" style="margin:0; font-size: 15px;">From 800-thread-count linens to artisanal bath amenities, we obsess over the details so you don't have to.</p>
                </div>
                <div class="value-card">
                    <div class="value-icon-box">
                        <i class="fas fa-fingerprint"></i>
                    </div>
                    <h3>Bespoke Experiences</h3>
                    <p class="text-content" style="margin:0; font-size: 15px;">No two stays are alike. Our dedicated experience managers curate itineraries tailored specifically to your passions.</p>
                </div>
                <div class="value-card">
                    <div class="value-icon-box">
                        <i class="fas fa-seedling"></i>
                    </div>
                    <h3>Conscious Luxury</h3>
                    <p class="text-content" style="margin:0; font-size: 15px;">We believe in sustainable indulgence. Our properties implement eco-conscious practices without sacrificing comfort.</p>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer-logo">DESTINY</div>
            <p>&copy; 2026 Destiny Hotels & Resorts. Crafting the future of hospitality.</p>
        </div>

    </form>
</body>
</html>