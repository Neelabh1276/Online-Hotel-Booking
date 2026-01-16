<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="HotelBooking.Features" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Features & Amenities | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap');

        :root {
            --primary: #00cba9;
            --dark: #111c44;
            --light: #f8f9fa;
            --text-gray: #555;
        }

        body { margin: 0; font-family: 'Inter', sans-serif; background-color: white; color: #1a1a1a; overflow-x: hidden; }

        /* --- Navbar --- */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 20px 8%; position: absolute; width: 84%; top: 0; z-index: 1000; }
        .logo { font-weight: 800; font-size: 26px; color: white; letter-spacing: 2px; }
        .nav-links a { margin-left: 30px; text-decoration: none; color: white; font-size: 14px; font-weight: 500; opacity: 0.85; transition: 0.3s; text-transform: uppercase; letter-spacing: 1px; }
        .nav-links a:hover, .nav-links a.active { opacity: 1; color: var(--primary); }
        .btn-nav { padding: 10px 24px; border-radius: 2px; font-weight: 600; text-decoration: none; font-size: 14px; transition: 0.3s; text-transform: uppercase; letter-spacing: 1px; }
        .btn-login { background: var(--primary); color: white; border: none; }
        .btn-login:hover { background: #00a88d; box-shadow: 0 5px 15px rgba(0, 203, 169, 0.3); }

        /* --- Hero Section --- */
        .hero {
            height: 60vh;
            background: linear-gradient(rgba(17, 28, 68, 0.6), rgba(17, 28, 68, 0.6)), url('https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080');
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
        
        .hero h1 { font-family: 'Playfair Display', serif; font-size: 64px; margin-bottom: 20px; animation: fadeInUp 0.8s ease; }
        .hero p { font-size: 18px; max-width: 600px; margin: 0 auto; opacity: 0.9; font-weight: 300; animation: fadeInUp 1s ease; }

        /* --- Icon Grid --- */
        .amenities-bar {
            padding: 60px 8%;
            background: var(--light);
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 20px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        .amenity-item { padding: 20px; transition: 0.3s; border-radius: 8px; }
        .amenity-item:hover { background: white; box-shadow: 0 10px 20px rgba(0,0,0,0.05); transform: translateY(-5px); }
        .amenity-item i { font-size: 28px; color: var(--primary); margin-bottom: 15px; }
        .amenity-item span { display: block; font-size: 13px; font-weight: 600; color: var(--dark); text-transform: uppercase; letter-spacing: 1px; }

        /* --- Feature Sections --- */
        .feature-section { display: flex; align-items: center; min-height: 600px; }
        
        .feature-text { flex: 1; padding: 80px; }
        .feature-image { flex: 1; height: 600px; background-size: cover; background-position: center; }

        .feature-label { color: var(--primary); font-weight: 700; letter-spacing: 3px; font-size: 12px; text-transform: uppercase; display: block; margin-bottom: 20px; }
        .feature-heading { font-family: 'Playfair Display', serif; font-size: 42px; color: var(--dark); margin: 0 0 25px 0; line-height: 1.2; }
        .feature-desc { color: var(--text-gray); line-height: 1.8; font-size: 16px; margin-bottom: 30px; }
        
        .btn-explore { padding: 12px 30px; border: 1px solid var(--dark); color: var(--dark); text-decoration: none; font-size: 13px; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; transition: 0.3s; display: inline-block; }
        .btn-explore:hover { background: var(--dark); color: white; }

        /* Alternate Order */
        .feature-section.reverse { flex-direction: row-reverse; background-color: #fafafa; }

        /* --- CTA Section --- */
        .cta-section {
            padding: 100px 8%;
            text-align: center;
            background: var(--dark);
            color: white;
            position: relative;
            overflow: hidden;
        }
        .cta-bg-icon { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 400px; color: rgba(255,255,255,0.02); z-index: 0; pointer-events: none; }
        
        .cta-content { position: relative; z-index: 1; }
        .cta-heading { font-family: 'Playfair Display', serif; font-size: 48px; margin-bottom: 30px; }
        .btn-book-now { background: var(--primary); color: white; padding: 18px 50px; text-decoration: none; font-weight: 700; border-radius: 2px; text-transform: uppercase; letter-spacing: 2px; transition: 0.3s; display: inline-block; }
        .btn-book-now:hover { background: white; color: var(--dark); }

        /* --- Footer --- */
        .footer { background: #0b122b; color: white; padding: 60px 8%; text-align: center; font-size: 14px; opacity: 1; border-top: 5px solid var(--primary); }

        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar">
            <div class="logo">DESTINY</div>
            <div class="nav-links">
                <a href="WebForm1.aspx">Home</a>
                <a href="Features.aspx" class="active">Features</a>
                <a href="Room.aspx">Rooms</a>
                <a href="AboutUs.aspx">About Us</a>
                <a href="Contact.aspx">Contact</a>
            </div>
            <div>
                <a href="Register.aspx" class="btn-nav" style="color: white; margin-right: 15px;">Sign Up</a>
                <a href="Login.aspx" class="btn-nav btn-login">Login</a>
            </div>
        </nav>

        <div class="hero">
            <div>
                <h1>Experience the Extraordinary</h1>
                <p>From world-class dining to bespoke events, explore the amenities that define the Destiny experience.</p>
            </div>
        </div>

        <div class="amenities-bar">
            <div class="amenity-item">
                <i class="fas fa-wifi"></i>
                <span>High-Speed Wifi</span>
            </div>
            <div class="amenity-item">
                <i class="fas fa-swimming-pool"></i>
                <span>Infinity Pool</span>
            </div>
            <div class="amenity-item">
                <i class="fas fa-utensils"></i>
                <span>Fine Dining</span>
            </div>
            <div class="amenity-item">
                <i class="fas fa-bell"></i>
                <span>Concierge</span>
            </div>
            <div class="amenity-item">
                <i class="fas fa-dumbbell"></i>
                <span>24/7 Fitness</span>
            </div>
            <div class="amenity-item">
                <i class="fas fa-cocktail"></i>
                <span>Rooftop Bar</span>
            </div>
        </div>

        <div class="feature-section">
            <div class="feature-image" style="background-image: url('https://images.unsplash.com/photo-1559339352-11d035aa65de?q=80&w=1974');"></div>
            <div class="feature-text">
                <span class="feature-label">Culinary Delights</span>
                <h2 class="feature-heading">A Symphony of Flavors</h2>
                <p class="feature-desc">
                    Embark on a gastronomic journey at our award-winning restaurant, <i>The Azure</i>. Led by Michelin-starred chefs, our menu celebrates local ingredients with a modern twist. Whether it's a sunrise breakfast or a romantic candlelit dinner, every meal is a memory in the making.
                </p>
                <a href="#" class="btn-explore">View Menu</a>
            </div>
        </div>

        <div class="feature-section reverse">
            <div class="feature-image" style="background-image: url('https://images.unsplash.com/photo-1519167758481-83f550bb49b3?q=80&w=2098');"></div>
            <div class="feature-text">
                <span class="feature-label">Meetings & Celebrations</span>
                <h2 class="feature-heading">Where Moments Become Memories</h2>
                <p class="feature-desc">
                    From intimate board meetings to grand ballroom weddings, our dedicated event team orchestrates every detail to perfection. Featuring state-of-the-art technology, exquisite catering options, and stunning views, Destiny provides the perfect backdrop for your most important milestones.
                </p>
                <a href="Contact.aspx" class="btn-explore">Plan An Event</a>
            </div>
        </div>

        <div class="feature-section">
            <div class="feature-image" style="background-image: url('https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?q=80&w=2070');"></div>
            <div class="feature-text">
                <span class="feature-label">Leisure</span>
                <h2 class="feature-heading">Skyline Infinity Pool</h2>
                <p class="feature-desc">
                    Float above the city lights in our temperature-controlled infinity pool. Open from dawn until late evening, it offers the perfect vantage point for sunset cocktails. Private cabanas are available for those seeking an exclusive poolside retreat.
                </p>
                <a href="#" class="btn-explore">View Gallery</a>
            </div>
        </div>

        <div class="cta-section">
            <i class="fas fa-gem cta-bg-icon"></i>
            <div class="cta-content">
                <h2 class="cta-heading">Ready to live the Destiny life?</h2>
                <a href="WebForm1.aspx" class="btn-book-now">Book Your Stay Now</a>
            </div>
        </div>

        <div class="footer">
            <div style="font-weight: 800; font-size: 24px; margin-bottom: 20px;">DESTINY</div>
            <p>&copy; 2026 Destiny Hotels & Resorts. Crafting the future of hospitality.</p>
        </div>

    </form>
</body>
</html>