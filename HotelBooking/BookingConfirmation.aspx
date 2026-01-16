<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="HotelBooking.BookingConfirmation" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmed | Destiny</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

        :root {
            --primary-color: #00cba9;
            --text-color: #1a1a1a;
            --text-light: #666;
            --bg-light: #f8f9fa;
            --success-color: #22c55e;
            --blue-color: #2563eb;
            --border-color: #eee;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            color: var(--text-color);
            background-color: #fff;
        }

        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            border-bottom: 1px solid var(--border-color);
            background: #fff;
        }

        .logo {
            font-weight: 800;
            font-size: 24px;
            color: var(--primary-color);
            text-decoration: none;
        }

        .nav-links a {
            margin-left: 30px;
            text-decoration: none;
            color: var(--text-light);
            font-weight: 500;
            font-size: 15px;
        }

        .btn-nav {
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }

        .btn-signup {
            background: #fff;
            color: var(--blue-color);
            border: 1px solid var(--blue-color);
            margin-right: 10px;
        }

        .btn-login {
            background: var(--blue-color);
            color: #fff;
            border: none;
        }

        
        .container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 20px;
        }

        .confirmation-layout {
            display: flex;
            gap: 80px;
            align-items: flex-start;
        }

        
        .hotel-summary-card {
            flex: 0 0 450px;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            overflow: hidden;
            padding: 25px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .hotel-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 16px;
            margin-bottom: 25px;
        }

        .hotel-name {
            font-size: 22px;
            font-weight: 700;
            margin: 0 0 8px;
            display: flex;
            align-items: center;
        }

        .hotel-stars {
            color: #f59e0b;
            font-size: 16px;
            margin-left: 10px;
        }

        .hotel-location {
            color: var(--text-light);
            font-size: 15px;
            margin-bottom: 25px;
        }

        .booking-dates {
            margin-bottom: 25px;
        }

        .date-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 15px;
        }

        .date-label {
            font-weight: 600;
        }

        .date-value {
            color: var(--text-light);
        }

        .room-type {
            font-weight: 600;
            font-size: 15px;
            padding-top: 25px;
            border-top: 1px solid var(--border-color);
        }

        
        .confirmation-message {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 60px 0;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background-color: #dcfce7;
            color: var(--success-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            margin-bottom: 30px;
        }

        .confirmation-title {
            font-size: 32px;
            font-weight: 800;
            margin: 0;
        }

       
        .trip-details-section {
            margin-top: 80px;
            padding-top: 40px;
            border-top: 1px solid var(--border-color);
        }

        .trip-header {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .trip-info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 50px;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            font-size: 15px;
        }

        .info-icon {
            color: var(--text-color);
            margin-right: 15px;
            font-size: 18px;
            margin-top: 3px;
        }

        .info-label {
            font-weight: 600;
            margin-right: 5px;
        }

        .info-value {
            color: var(--text-light);
            line-height: 1.5;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .price-section {
            display: flex;
            align-items: center;
            margin-top: 20px;
            font-size: 15px;
        }

        .total-price {
            font-weight: 600;
            margin-right: 15px;
        }

        .paid-badge {
            background-color: #dcfce7;
            color: var(--success-color);
            padding: 4px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 13px;
        }

        
        .action-buttons {
            display: flex;
            gap: 20px;
            margin-top: 40px;
        }

        .btn-action {
            padding: 14px 32px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-contact {
            background: var(--blue-color);
            color: #fff;
            border: none;
        }

        .btn-contact:hover {
            background: #1d4ed8;
        }

        .btn-cancel {
            background: #fff;
            color: var(--blue-color);
            border: 1px solid var(--border-color);
        }

        .btn-cancel:hover {
            border-color: var(--blue-color);
            background: #f8f9fa;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo"><b>DESTINY</b></a>
        <div class="nav-links">
            <a href="#"><b>Properties</b></a>
            <a href="#"><b>Attractions</b></a>
            <a href="#"><b>Popular</b></a>
        </div>
    </nav>

    <div class="container">
        <div class="confirmation-layout">
            <div class="hotel-summary-card">
               <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80" 
     alt="Hotel Norrebro" 
     class="hotel-img" 
     onerror="this.src='https://via.placeholder.com/450x220?text=Hotel+Image+Unavailable';">
                <h2 class="hotel-name">
                    Hotel Norrebro
                    <span class="hotel-stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
                </h2>
                <p class="hotel-location">3-star hotel located in the heart of Copenhagen</p>

                <div class="booking-dates">
                    <div class="date-row">
                        <span class="date-label">Check-in</span>
                        <span class="date-value">Friday, 09 December 2022</span>
                    </div>
                    <div class="date-row">
                        <span class="date-label">Check-out</span>
                        <span class="date-value">Monday, 12 December 2022</span>
                    </div>
                </div>

                <div class="room-type">
                    Standard double room
                </div>
            </div>

            <div class="confirmation-message">
                <div class="success-icon">
                    <i class="fas fa-check"></i>
                </div>
                <h1 class="confirmation-title">Your booking is now confirmed!</h1>
            </div>
        </div>

        <div class="trip-details-section">
            <h2 class="trip-header">Your trip starts Friday, 09 December 2022</h2>

            <div class="trip-info-grid">
                <div>
                    <div class="info-item" style="margin-bottom: 20px;">
                        <i class="fas fa-calendar-check info-icon"></i>
                        <div>
                            <span class="date-label">Check-in</span><br>
                            <span class="date-value">Friday, 09 December 2022, from 3 PM</span>
                        </div>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-calendar-times info-icon"></i>
                        <div>
                            <span class="date-label">Check-out</span><br>
                            <span class="date-value">Monday, 12 December 2022, until 11 AM</span>
                        </div>
                    </div>
                </div>

                <div class="contact-info">
                    <div class="info-item">
                        <span class="info-label">Hotel address</span>
                        <span class="info-value">Norrebrogade 9, 10178 Copenhagen, Denmark</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">E-mail</span>
                        <span class="info-value" style="text-decoration: underline;">desk@hotelmitte.dk</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Telephone</span>
                        <span class="info-value">+49 002 001 030</span>
                    </div>
                </div>
            </div>

            <div style="border-top: 1px solid var(--border-color); padding-top: 30px;">
                <div class="price-section">
                    <span class="info-label">Total price</span>
                    <span class="total-price">₹15000</span>
                    <span class="paid-badge">paid</span>
                </div>

                <div class="action-buttons">
                    <button class="btn-action btn-contact">Contact property</button>
                    <button class="btn-action btn-cancel">Cancel reservation</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>