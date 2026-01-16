<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="HotelBooking.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /*CSS DONE BY GOOGLE GEMINI*/
        body{
            background-color:#f4f7f6;
            margin:0;
            font-family:'Segoe UI',sans-serif;
        }
        .room-container{
        display: flex;
        padding: 40px 5%;
        grid-gap: 25px;
        }
        .sidebar-search{
        width:320px;
        flex: 0 0 300px;
        background: white;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        height: fit-content;
        }
        .side-input{
        width: 100%;
        box-sizing:border-box;
        padding: 10px;
        margin: 8px 0 20px 0;
        margin-bottom:15px;
        margin-top:5px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background: #f9f9f9;
        display:block;
        }
        .star-rating button{
        width: 40px;
        height: 40px;
        border-radius: 50%; 
        border: 1px solid #eee;
        background: white;
        margin-right: 5px;
        cursor: pointer;
        transition: 0.3s;
        }
        .star-rating button:hover{
            background:#007bff;
            color:white;
        }
        .star-row{
            display:flex;
            grid-gap:8px;
            margin-top:10px;
        }
        .star-row span{
        width: 35px;
        height: 35px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd;
        border-radius: 50%; 
        font-size: 12px;
        cursor: pointer;
        }
        .star-row span:hover{
            background-color:#f0f0f0;
        }
        .filter-catagory{
            margin-top:25px;
            border-top:1px solid #eee;
            padding-top:15px;
        }
        .filter-catagory h4{
            margin-bottom:12px;
            font-size:16px;
        }
        .filter-catagory label{
            display: block;
            margin-bottom:8px;
            font-size:14px;
            cursor:pointer;
        }
        .btn-search-side{
        width: 100%;
        background: #007bff;
        color: white;
        border: none;
        padding: 12px;
        border-radius: 25px;
        font-weight: bold;
        cursor: pointer;
        }
        .btn-see-options{
        background-color:#007bff;
        color:white;
        border:none;
        padding:10px 20px;
        border-radius:25px;
        font-weight:500;
        cursor:pointer;
        }
        .result-area{
            flex:3;
        }
        .hotel-card{
        background: white;
        display: flex;
        border-radius: 20px;
        overflow: hidden;
        margin-bottom: 25px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .hotel-img{
            width: 300px; height: 220px; object-fit: cover;}
        .hotel-info { 
            padding: 20px; flex: 1; display: flex; flex-direction: column; }
        .hotel-row {
            display: flex; justify-content: space-between; align-items: center; }
        .rating-badge { 
            color: #003580; font-size: 14px; }
        .rating-badge b { 
            background-color: #003580;color:white; padding: 2px 6px; border-radius: 5px 5px 5px 0; margin-left: 5px; }
        .hotel-footer { 
            display: flex; justify-content: space-between; align-items: flex-end; margin-top: auto; padding-top:15px; }
        .amount { 
            font-size: 24px; font-weight: bold; display: block; }
        .btn-book{
        background: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 20px;
        cursor: pointer;
        }
        .distance{
            color:#6a6a6a;
            font-size:14px;
            margin:5px 0;
        }
        .free-cancel{
            color:#28a745;
            font-size:14px;
            font-weight:500;
            margin-bottom:15px;
        } 
        .price-amt{
        font-size:24px;
        font-weight:bold;
        display:block;
        color:#000;
        }
        .nights-label{
            font-size:12px;
            color:#6a6a6a;
        }
        .nights-info{
            font-size:13px;
            color:#6a6a6a;
            display:block;
            margin-bottom:8px;
        }
        .booking-right-side{
        display:flex;
        flex-direction:column;
        align-items:flex-end;
        text-align:right;
        margin-left:auto;
        }
        .price-val{
            font-size:26px;
            font-weight:bold;
            display:block;
            color:#000;
        }   
        .tag-blue{
            display:inline-block;
            border: 1px solid #007bff;
            color:#007bff;
            padding:2px 8px;
            border-radius:12px;
            font-size:12px;
            margin-right:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="room-container">
    <aside class="sidebar-search">
        <div class="back-arrow">&#8592;</div>
        <h3>Your search</h3>
        
        <div class="field">
            <label>Destination</label>
            <input type="text" placeholder="Copenhagen, Denmark" class="side-input" />
        </div>
        
        <div class="field">
            <label>Check-in date</label>
            <input type="date" class="side-input" />
        </div>
        
        <div class="field">
            <label>Check-out date</label>
            <input type="date" class="side-input" />
        </div>

        <button class="btn-search-side">Search</button>

        <div class="filter-section">
            <h4>Popular filters</h4>
            <label><input type="checkbox" /> Budget hotel</label>
            <label><input type="checkbox" /> Breakfast included</label>
            <label><input type="checkbox" /> Free airport shuttle</label>
        </div>
        <div class="filter-catagory">
            <h4>Price per night</h4>
            <label><input type="checkbox" />Less than ₹4512</label>
            <label><input type="checkbox" />₹4512 to ₹9025</label>
            <label><input type="checkbox" />₹9025 to ₹13538</label>
        </div>
        <div class="filter-catagory">
            <h4>Guest rating</h4>
            <label><input type="checkbox" />Any</label>
            <label><input type="checkbox" />Excellent</label>
            <label><input type="checkbox" />Very good</label>
        </div>
        <div class="filter-catagory">
            <h4>Property class</h4>
            <div class="star-rating">
                <button type="button">1★</button>
                <button type="button">2★</button>
                <button type="button">3★</button>
                <button type="button">4★</button>
                <button type="button">5★</button>
            </div>
        </div>
    </aside>

    <main class="results-area">
        <div class="results-header">
            <h2>140 search results for Copenhagen</h2>
            <div class="sort-by">Sort by &#9662;</div>
        </div>

        <div class="hotel-card">
            <img src="images/hotel1.jpg" class="hotel-img" />
            <div class="hotel-info">
                <div class="hotel-row">
                    <h3>Hotel Norrebro</h3>
                    <span class="rating-badge">Excellent <b>9.6</b></span>
                </div>
                <p class="sub-text">0.4 km from city centre</p>
                
                <div class="room-type">
                    <strong>Comfort room</strong><br />
                    1x king size bed | 1x bathroom
                </div>

                <div class="hotel-footer">
                    <div class="status-tags">
                       <span class="tag-blue">#Hot deal</span>
                       <span class="tag-blue">#Popular</span>
                   </div>
    
                   <div class="booking-right-side">
                       <div class="price-container">
                           <span class="price-val">16,186 INR</span>
                           <span class="nights-info">3 nights, 2 guests</span>
                       </div>
                       <button type="button" class="btn-see-options" onclick="window.location.href='HotelDetails1.aspx';">See booking options</button>
                   </div>
               </div>
           </div>
        </div>
        <div class="hotel-card">
            <img src="images/hotel2.jpg" class="hotel-img" />
            <div class="hotel-info">
                <div class="hotel-row">
                    <h3>Hotel Mitte</h3>
                    <span class="rating-badge">Very good<b>9.2</b></span>
                </div>
                <p class="distance">1.7 km from city centre</p>
                <p class="free-cancel">Free cancellation</p>
                <div class="room-specs">
                    <strong>Standard room</strong><br />
                    1x queen size bed | 1x bathroom
                </div>
               <div class="hotel-footer">
               <div class="booking-right-side">
               <div class="price-container">
                  <span class="price-val">40,465 INR</span>
                  <span class="nights-info">3 nights, 2 guests</span>
              </div>
              <button type="button" class="btn-see-options" onclick="window.location.href='HotelDetails2.aspx';">See booking options</button>
          </div>
       </div>
            </div>
        </div>
    </main>
</div>
    </form>
</body>
</html>
