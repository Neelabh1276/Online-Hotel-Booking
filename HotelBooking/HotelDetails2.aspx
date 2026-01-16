<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelDetails1.aspx.cs" Inherits="HotelBooking.HotelDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Hotel Norrebro | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body { 
            margin: 0; 
            font-family: 'Inter', sans-serif; 
            background: #fff; 
            color: #1a1a1a; 

        }  
        .navbar { 
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            border-bottom: 1px solid #eee;
        }
        .logo { 
            font-weight: 800;
            font-size: 22px;
            color: #00cba9;
        }
        .nav-links a {
            margin-left: 25px;
            text-decoration: none;
            color: #666;
            font-size: 14px; 
            font-weight: 600;
        }
        .content-wrapper { 
            padding: 40px 8%;
            max-width: 1400px;
            margin: 0 auto;
        }
        .back-btn { 
            cursor: pointer; font-size: 20px; margin-bottom: 20px; color: #1a1a1a; }
        .hero-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            grid-template-rows: 220px 220px;
            gap: 15px;
            margin-bottom: 30px;
        }
        .grid-item { 
            border-radius: 16px; background-size: cover; background-position: center; transition: 0.3s; }
        .main-img { 
            grid-row: span 2; }
        .hotel-header { 
            display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px; }
        .hotel-title h1 { 
            margin: 0; font-size: 32px; font-weight: 700; }
        .hotel-title p {
            color: #555; font-size: 15px; margin: 8px 0; }
        
        .rating-badge { 
            text-align: right; }
        .score-text { 
            color: #4caf50; font-weight: 600; font-size: 15px; margin-right: 8px; }
        .score { 
            background: #e8f5e9; color: #4caf50; padding: 6px 10px; border-radius: 8px; font-weight: 700; font-size: 16px; }
        .review-count { 
            font-size: 13px; color: #999; margin-top: 5px; }

        .tabs-nav { 
            display: flex; gap: 40px; margin-top: 25px; border-bottom: 1px solid #eee; }
        .tabs-nav a {
            text-decoration: none; color: #666; font-size: 15px; font-weight: 500;
            padding-bottom: 15px; border-bottom: 2px solid transparent; margin-bottom: -1px;
        }
        .tabs-nav a.active { 
            color: #1a73e8; border-bottom: 2px solid #1a73e8; font-weight: 600; }

        .main-info-grid { 
            display: grid; grid-template-columns: 1.5fr 1fr; gap: 60px; margin-top: 30px; margin-bottom: 50px; }
        .section-title { 
            font-size: 22px; font-weight: 700; margin-bottom: 20px; color: #1a1a1a; }
        
        .overview-grid { 
            display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; }
        .icon-item { 
            display: flex; align-items: center; gap: 12px; font-size: 15px; color: #333; }
        .icon-item i { 
            color: #1a1a1a; width: 20px; font-size: 16px; }

        .map-placeholder {
            width: 100%; height: 180px; background-color: #f8f9fa;
            background-image: url('https://upload.wikimedia.org/wikipedia/commons/3/39/Google_Maps_icon_%282015-2020%29.svg');
            background-repeat: no-repeat; background-position: center 40%; background-size: 35px;
            border-radius: 20px; display: flex; flex-direction: column; justify-content: flex-end;
            align-items: center; padding-bottom: 30px; cursor: pointer; border: 1px solid #eee;
        }
        .map-placeholder p { 
            font-weight: 600; font-size: 13px; color: #1a73e8; margin: 0; }

        .rooms-container { 
            margin-top: 40px; }
        .rooms-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        .room-card {
            border: 1px solid #eee; border-radius: 16px; overflow: hidden;
            display: flex; flex-direction: column; background: #fff;
            transition: transform 0.2s;
        }
        .room-card:hover { 
            transform: translateY(-3px); box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        .room-img { 
            height: 160px; background-size: cover; background-position: center; }
        .room-details { 
            padding: 15px; flex-grow: 1; display: flex; flex-direction: column; }
        .room-title { 
            font-weight: 700; font-size: 16px; margin-bottom: 10px; }
        
        .room-icons {
            font-size: 13px; color: #555; margin-bottom: 15px; line-height: 1.6; }
        .room-icons div {
            display: flex; align-items: center; gap: 8px; }
        .room-icons i { 
            font-size: 12px; color: #1a1a1a; width: 15px; }

        .tag-gray { 
            font-size: 12px; color: #777; margin-top: auto; margin-bottom: 15px; }

        .btn-book {
            background: #1a73e8; color: white; border: none; width: 100%; padding: 12px;
            border-radius: 8px; font-weight: 600; cursor: pointer; font-size: 14px;
        }
        .btn-book:hover {
            background: #1558b3; }

        .reviews-section { 
            margin-top: 60px; display: grid; grid-template-columns: 1fr 2fr; gap: 60px; }
        .score-big { 
            font-size: 48px; font-weight: 700; color: #1a73e8; margin-bottom: 20px; }
        .progress-item { 
            margin-bottom: 15px; }
        .progress-label { 
            display: flex; justify-content: space-between; font-size: 14px; font-weight: 500; margin-bottom: 5px; }
        .progress-bar-bg {
            width: 100%; height: 6px; background: #eee; border-radius: 3px; }
        .progress-fill {
            height: 6px; background: #1a73e8; border-radius: 3px; }

        .review-card { 
            border-bottom: 1px solid #eee; padding-bottom: 30px; margin-bottom: 30px; }
        .review-header { 
            display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; }
        .review-title { 
            font-weight: 700; font-size: 16px; }
        .review-badge { 
            padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 700; }
        .badge-green { 
            background: #e8f5e9; color: #4caf50; }
        .badge-yellow { 
            background: #fff8e1; color: #fbc02d; }
        
        .reviewer-meta { 
            font-size: 13px; color: #777; margin-bottom: 10px; }
        .review-text { 
            font-size: 14px; color: #444; line-height: 1.5; margin-bottom: 15px; }
        
        .pros-cons { 
            font-size: 13px; line-height: 1.6; }
        .plus { 
            color: #4caf50; font-weight: 700; margin-right: 5px; }
        .minus { 
            color: #ff9800; font-weight: 700; margin-right: 5px; }
        .review-date { 
            text-align: right; font-size: 12px; color: #999; margin-top: 5px; }
        /*CSS DONE BY GOOGLE GEMINI*/
    </style>
</head>
<body>
    <!DOCTYPE html>
<html>
<head>
    <title>Hotel Norrebro | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body { margin: 0; font-family: 'Inter', sans-serif; background: #fff; color: #1a1a1a; }
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 20px 8%; border-bottom: 1px solid #eee; }
        .logo { font-weight: 800; font-size: 22px; color: #00cba9; }
        .nav-links a { margin-left: 25px; text-decoration: none; color: #666; font-size: 14px; font-weight: 600; }
        
        /* Fixed Alignment: Added box-sizing and centered the wrapper */
        .content-wrapper { padding: 40px 8%; max-width: 1400px; margin: 0 auto; box-sizing: border-box; }
        .back-btn { cursor: pointer; font-size: 20px; margin-bottom: 25px; color: #1a1a1a; display: inline-block; }
        
        /* Hero Grid Alignment */
        .hero-grid { display: grid; grid-template-columns: 2fr 1fr 1fr; grid-template-rows: 220px 220px; gap: 12px; margin-bottom: 35px; }
        .grid-item { border-radius: 12px; background-size: cover; background-position: center; transition: 0.3s; }
        .main-img { grid-row: span 2; }
        
        /* Header & Rating Alignment */
        .hotel-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .hotel-title h1 { margin: 0; font-size: 34px; font-weight: 700; letter-spacing: -0.5px; }
        .hotel-title p { color: #666; font-size: 15px; margin: 5px 0 0 0; }
        
        .rating-badge { text-align: right; display: flex; flex-direction: column; align-items: flex-end; }
        .rating-flex { display: flex; align-items: center; gap: 10px; margin-bottom: 4px; }
        .score-text { color: #4caf50; font-weight: 700; font-size: 16px; }
        .score { background: #e8f5e9; color: #4caf50; padding: 8px 12px; border-radius: 8px; font-weight: 700; font-size: 18px; line-height: 1; }
        .review-count { font-size: 13px; color: #999; }

        .tabs-nav { display: flex; gap: 35px; margin-top: 10px; border-bottom: 1px solid #eee; }
        .tabs-nav a { text-decoration: none; color: #666; font-size: 15px; font-weight: 500; padding-bottom: 15px; border-bottom: 2px solid transparent; margin-bottom: -1px; }
        .tabs-nav a.active { color: #1a73e8; border-bottom: 2px solid #1a73e8; font-weight: 600; }

        /* Main Info Alignment */
        .main-info-grid { display: grid; grid-template-columns: 1.6fr 1fr; gap: 80px; margin-top: 40px; margin-bottom: 60px; }
        .section-title { font-size: 24px; font-weight: 700; margin-bottom: 25px; color: #1a1a1a; }
        
        .overview-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 18px; }
        .icon-item { display: flex; align-items: center; gap: 12px; font-size: 15px; color: #444; }
        .icon-item i { color: #1a1a1a; width: 20px; font-size: 17px; }

        .map-placeholder { width: 100%; height: 200px; background-color: #f9f9f9; background-image: url('https://upload.wikimedia.org/wikipedia/commons/3/39/Google_Maps_icon_%282015-2020%29.svg'); background-repeat: no-repeat; background-position: center 40%; background-size: 35px; border-radius: 16px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center; padding-bottom: 25px; border: 1px solid #eee; cursor: pointer; }
        .map-placeholder p { font-weight: 600; font-size: 14px; color: #1a73e8; margin: 0; }

        /* Room Cards Alignment */
        .rooms-container { margin-top: 50px; }
        .rooms-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
        .room-card { border: 1px solid #eee; border-radius: 16px; overflow: hidden; display: flex; flex-direction: column; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .room-img { height: 170px; background-size: cover; background-position: center; width: 100%; }
        .room-details { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between; }
        .room-title { font-weight: 700; font-size: 17px; margin-bottom: 12px; min-height: 42px; line-height: 1.3; }
        
        .room-icons { font-size: 13px; color: #666; margin-bottom: 12px; }
        .room-icons div { display: flex; align-items: center; gap: 8px; margin-bottom: 6px; }
        .tag-gray { font-size: 12px; color: #888; margin-bottom: 20px; line-height: 1.4; flex-grow: 1; }

        /* Button Alignment */
        .btn-book { background: #1a73e8; color: white; border: none; width: 100%; padding: 14px; border-radius: 10px; font-weight: 600; cursor: pointer; font-size: 14px; transition: 0.2s; }
        .btn-book:hover { background: #1558b3; }

        /* Review Section Alignment */
        .reviews-section { margin-top: 80px; display: grid; grid-template-columns: 1fr 2fr; gap: 80px; padding-bottom: 100px; }
        .score-big { font-size: 52px; font-weight: 700; color: #1a73e8; margin-bottom: 25px; }
        .progress-item { margin-bottom: 20px; }
        .progress-label { display: flex; justify-content: space-between; font-size: 14px; font-weight: 600; margin-bottom: 8px; }
        .progress-bar-bg { width: 100%; height: 8px; background: #f0f0f0; border-radius: 4px; }
        .progress-fill { height: 8px; background: #1a73e8; border-radius: 4px; }

        .review-card { border-bottom: 1px solid #eee; padding-bottom: 35px; margin-bottom: 35px; }
        .review-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; }
        .review-badge { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 700; }
        .badge-green { background: #e8f5e9; color: #4caf50; }
        .reviewer-meta { font-size: 13px; color: #777; margin-bottom: 12px; font-weight: 500; }
        .review-text { font-size: 15px; color: #444; line-height: 1.6; margin-bottom: 15px; }
        .plus { color: #4caf50; font-weight: 700; margin-right: 5px; }
        .review-date { text-align: right; font-size: 12px; color: #999; margin-top: 10px; }
    </style>
</head>
<body>
    <form method="post" action="./HotelDetails1.aspx" id="form1">
        <nav class="navbar">
            <div class="logo"><strong>DESTINY</strong></div>
            <div class="menu">
                <div class="nav-links">
                    <a href="#">Properties</a>
                    <a href="#">Attractions</a>
                    <a href="#">Popular</a>
                </div>
            </div>
        </nav>

        <div class="content-wrapper">
            <div class="back-btn"><i class="fas fa-arrow-left"></i></div>

            <div class="hero-grid">
                <div class="grid-item main-img" style="background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070');"></div>
                <div class="grid-item" style="background-image: url('https://images.unsplash.com/photo-1582719478250-c89cae4df85b?q=80&w=2070');"></div>
                <div class="grid-item" style="background-image: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?q=80&w=2070');"></div>
                <div class="grid-item" style="background-image: url('https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080');"></div>
                <div class="grid-item" style="background-image: url('https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?q=80&w=2070');"></div>
            </div>

            <div class="hotel-header">
                <div class="hotel-title">
                    <h1>Hotel Mitte</h1>
                    <p>3-star hotel located in the heart of Copenhagen</p>
                </div>
                <div class="rating-badge">
                    <div class="rating-flex">
                        <span class="score-text">Excellent</span>
                        <span class="score">9.6</span>
                    </div>
                    <div class="review-count">1,920 reviews</div>
                </div>
            </div>

            <div class="tabs-nav">
                <a href="#" class="active">Overview</a>
                <a href="#">Rooms</a>
                <a href="#">Amenities</a>
                <a href="#">Policies</a>
            </div>

            <div class="main-info-grid">
                <div>
                    <h3 class="section-title">Property overview</h3>
                    <div class="overview-grid">
                        <div class="icon-item"><i class="fas fa-wifi"></i> Free Wifi</div>
                        <div class="icon-item"><i class="fas fa-parking"></i> Free parking</div>
                        
                        <div class="icon-item"><i class="fas fa-user-clock"></i> 12-hour front desk</div>
                        <div class="icon-item"><i class="fas fa-bath"></i> Private bathroom</div>
                        <div class="icon-item"><i class="fas fa-key"></i> Key card access</div>
                    </div>
                </div>
                <div class="map-placeholder">
                    <p>Show on map</p>
                </div>
            </div>

            <div class="rooms-container">
                <h3 class="section-title">Rooms</h3>
                <div class="rooms-grid">
                    <div class="room-card">
                        <div class="room-img" style="background-image: url('https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=2070');"></div>
                        <div class="room-details">
                            <div class="room-title">Double standard room</div>
                            <div class="room-icons">
                                <div><i class="far fa-square"></i> 18 sqm</div>
                                <div><i class="fas fa-user-friends"></i> 2 people</div>
                                <div><i class="fas fa-bed"></i> 1 queen bed</div>
                            </div>
                            <div class="tag-gray">Non-refundable, Breakfast included</div>
                            <button type="button" class="btn-book" onclick="window.location.href='HotelBooking2.aspx'">Book now for ₹15,000</button>
                        </div>
                    </div>

                    <div class="room-card">
                        <div class="room-img" style="background-image: url('https://images.unsplash.com/photo-1595576508898-0ad5c879a061?q=80&w=2070');"></div>
                        <div class="room-details">
                            <div class="room-title">Comfort single room</div>
                            <div class="room-icons">
                                <div><i class="far fa-square"></i> 21 sqm</div>
                                <div><i class="fas fa-user-friends"></i> 2 people</div>
                                <div><i class="fas fa-bed"></i> 1 king size bed</div>
                            </div>
                            <div class="tag-gray">Non-refundable, Breakfast included</div>
                            <button type="button" class="btn-book" onclick="window.location.href='HotelBooking2.aspx'">Book now for ₹18,000</button>
                        </div>
                    </div>

                    <div class="room-card">
                        <div class="room-img" style="background-image: url('https://images.unsplash.com/photo-1566665797739-1674de7a421a?q=80&w=2074');"></div>
                        <div class="room-details">
                            <div class="room-title">Deluxe Twin Room</div>
                            <div class="room-icons">
                                <div><i class="far fa-square"></i> 25 sqm</div>
                                <div><i class="fas fa-user-friends"></i> 2 people</div>
                                <div><i class="fas fa-bed"></i> 2 single beds</div>
                            </div>
                            <div class="tag-gray">Non-refundable, Breakfast included</div>
                            <button type="button" class="btn-book" onclick="window.location.href='HotelBooking2.aspx'">Book now for ₹19,000</button>
                        </div>
                    </div>

                    <div class="room-card">
                        <div class="room-img" style="background-image: url('https://images.unsplash.com/photo-1505691938895-1758d7feb511?q=80&w=2070');"></div>
                        <div class="room-details">
                            <div class="room-title">Double fancy room</div>
                            <div class="room-icons">
                                <div><i class="far fa-square"></i> 35 sqm</div>
                                <div><i class="fas fa-user-friends"></i> 2 people</div>
                                <div><i class="fas fa-bed"></i> 1 king size bed</div>
                            </div>
                            <div class="tag-gray">Non-refundable, Breakfast included</div>
                            <button type="button" class="btn-book" onclick="window.location.href='HotelBooking2.aspx'">Book now for ₹21,000</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="reviews-section">
                <div>
                    <h3 class="section-title">Reviews</h3>
                    <div class="score-big">9.6/10</div>
                    <div class="progress-item">
                        <div class="progress-label"><span>Cleanliness</span><span>10/10</span></div>
                        <div class="progress-bar-bg"><div class="progress-fill" style="width: 100%;"></div></div>
                    </div>
                </div>
                <div>
                    <div class="review-card">
                        <div class="review-header">
                            <div class="review-title">Excellent value for the price!</div>
                            <div class="review-badge badge-green">Excellent 10</div>
                        </div>
                        <div class="reviewer-meta">Mark M.</div>
                        <div class="review-text">We enjoyed our stay at this hotel. We will definitely come back!</div>
                        <div class="pros-cons">
                            <div><span class="plus">+</span> Great location!</div>
                        </div>
                        <div class="review-date">Reviewed on 20 September, 2022</div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
</body>
</html>