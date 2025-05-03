<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - Restaurant Table Reservation Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2a2a2a;
            --secondary: #c1272d;
            --accent: #f8f8f8;
            --text: #333;
            --success: #28a745;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        body {
            background: #191C27 url("resources/images/rest1.jpg") no-repeat center center;
            background-size: cover;
            color: var(--text);
        }

        body::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("resources/images/rest1.jpg") no-repeat center center;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }

        /* Header */
        .main-header {
            background: var(--primary);
            padding: 1rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: white;
            font-size: 1.8rem;
            font-weight: 700;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: rgba(255,255,255,0.9);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("resources/images/pic.jpg");
            background-size: cover;
            background-position: center;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content {
            max-width: 800px;
            padding: 2rem;
        }

        .search-box {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            margin-top: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .search-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .form-control {
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%;
        }

        .btn-primary {
            background: var(--secondary);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
        }

        /* Features Section */
        .features {
            padding: 4rem 2rem;
            background: white;
        }

        .features-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            text-align: center;
            padding: 2rem;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--secondary);
            margin-bottom: 1rem;
        }

        /* Reservation Steps */

        .reservation-steps {
            padding: 4rem 2rem;
            background: url("resources/images/pic.jpg") no-repeat center center;
            background-size: cover;;
        }

        .steps-container {
            background: rgba(0, 0, 0, 0.5);
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            gap: 2rem;
            justify-content: center;
        }

        .step-card {
            flex: 1;
            padding: 2rem;
            background:transparent;
            border-radius: 12px;
            text-align: center;
            color: white;
        }

        .step-number {
            width: 40px;
            height: 40px;
            background: var(--secondary);
            background-size: contain;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }

        /* Restaurant Listing */
        .restaurant-grid {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .restaurant-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .restaurant-image {
            width: 100%;
            height: 200px;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

        }


        .restaurant-info {
            padding: 1.5rem;
        }

        .rating {
            color: #ffc107;
            margin: 0.5rem 0;
        }

        /* Footer */
        .main-footer {
            background: var(--primary);
            color: white;
            padding: 2rem;
            margin-top: 4rem;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .steps-container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="main-header">
    <nav class="nav-container">
        <div class="logo">ReservEats</div>
        <div class="nav-links">
            <a href=index.jsp>Home</a>
            <a href=resturants_page.jsp>Restaurants</a>
            <a href=my_reservation_page.jsp>My Reservations</a>
            <a href=login_page.jsp>Login</a>
            <a href=admin_page.jsp>Admin info</a>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Book Your Perfect Dining Experience</h1>
        <p>Discover the best restaurants and reserve your table in seconds</p>

        <div class="search-box">
            <form class="search-form">
                <input type="date" class="form-control">
                <select class="form-control">
                    <option>2 People</option>
                    <option>4 People</option>
                    <option>6 People</option>
                    <option>8+ People</option>
                </select>
                <select class="form-control">
                    <option>7:00 PM</option>
                    <option>7:30 PM</option>
                    <option>8:00 PM</option>
                    <option>8:30 PM</option>
                </select>
                <button class="btn-primary">Find Tables</button>
            </form>
        </div>
    </div>
</section>

<!-- Features -->
<section class="features">
    <div class="features-grid">
        <div class="feature-card">
            <i class="fas fa-clock feature-icon"></i>
            <h3>Instant Reservations</h3>
            <p>Book your table in real-time with instant confirmation</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-utensils feature-icon"></i>
            <h3>10,000+ Restaurants</h3>
            <p>Discover top-rated dining establishments near you</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-shield-alt feature-icon"></i>
            <h3>Secure Booking</h3>
            <p>Safe and reliable reservation system</p>
        </div>
    </div>
</section>

<!-- How It Works -->
<section class="reservation-steps">
    <div class="steps-container">
        <div class="step-card">
            <div class="step-number">1</div>
            <h3>Search Restaurants</h3>
            <p>Find your perfect dining spot</p>
        </div>
        <div class="step-card">
            <div class="step-number">2</div>
            <h3>Book Table</h3>
            <p>Select time & party size</p>
        </div>
        <div class="step-card">
            <div class="step-number">3</div>
            <h3>Enjoy Dining</h3>
            <p>Confirm your reservation</p>
        </div>
    </div>
</section>

<!-- Restaurant Listing -->
<!-- More restaurant card01 -->
<section class="restaurant-grid">
    <div class="restaurant-card">
        <div class="restaurant-image"  style="background-image: url(resources/images/rest2.jpg)"; background-size: cover; background-repeat: no-repeat;"></div>
        <div class="restaurant-info">
            <h3>La Maison Gourmet</h3>
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                4.5 (190 reviews)
            </div>
            <p>French Cuisine | $$$</p>
            <button class="btn-primary">Book Now</button>
        </div>
    </div>
</section>


<!-- More restaurant card02 -->
<section class="restaurant-grid">
    <div class="restaurant-card">
        <div class="restaurant-image"  style="background-image: url(resources/images/rest3.jpg)"; background-size: cover; background-repeat: no-repeat;"></div>
        <div class="restaurant-info" >
            <h3>18 Sanniya</h3>
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <i class="fas fa-star-half-alt"></i>
                4.0 (160 reviews)
            </div>
            <p>Japanese Cuisine • $$$</p>
            <button class="btn-primary">Book Now</button>
        </div>
    </div>
</section>

<!-- restaurant card03 -->
<section class="restaurant-grid">
    <div class="restaurant-card">
        <div class="restaurant-image" style="background-image: url(resources/images/rest4.jpg)"; background-size: cover; background-repeat: no-repeat;"></div>
        <div class="restaurant-info">
            <h3>Kai Resto</h3>
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <i class="fas fa-star-half-alt"></i>
                3.5 (140 reviews)
            </div>
            <p>French Cuisine | $$$</p>
            <button class="btn-primary">Book Now</button>
        </div>
    </div>
    <!-- More restaurant cards -->
</section>

<!-- Footer -->
<footer class="main-footer">
    <div class="footer-content">
        <p>&copy; 2025 ReservEats. All rights reserved.</p>
    </div>
</footer>




<script>
    // Modal handling
    function toggleModal(modalId) {
        const modal = document.getElementById(modalId);
        modal.style.display = modal.style.display === 'flex' ? 'none' : 'flex';
    }

    // Close modal when clicking outside
    window.onclick = function(event) {
        if (event.target.className === 'modal-overlay') {
            event.target.style.display = 'none';
        }
    }
</script>
</body>
</html>