<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - Restaurant Listings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Base Styles from Homepage */
        :root {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("resources/images/pic.jpg");
            background-size: cover;
            background-position: center;
            --primary: #2a2a2a;
            --secondary: #c1272d;
            --accent: #f8f8f8;
            --text: #333;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
        }

        /* Additions for Restaurant Listings */
        .listings-container {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 2rem;
            max-width: 1440px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .filters-section {
            background: gray;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            height: fit-content;
            position: sticky;
            top: 1rem;
            color: white;
        }

        .filter-group {
            margin-bottom: 2rem;
            border-bottom: 1px solid #eee;
            padding-bottom: 1.5rem;
        }

        .filter-group:last-child {
            border-bottom: none;
        }

        .filter-title {
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .rating-filter {
            display: flex;
            gap: 0.5rem;
        }

        .rating-star {
            color: var(--warning);
            cursor: pointer;
            transition: transform 0.2s;
        }

        .rating-star:hover {
            transform: scale(1.2);
        }

        .price-filter {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 0.5rem;
        }

        .price-chip {
            padding: 0.5rem;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .price-chip.active {
            border-color: var(--secondary);
            background: rgba(193, 39, 45, 0.1);
        }

        /* Enhanced Restaurant Card */
        .restaurant-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;

        }

        .restaurant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }


        .card-badge {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: var(--secondary);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.9rem;
        }

        .card-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .card-content {
            padding: 1.5rem;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid #eee;
        }

        /* Login/Register Modal */
        .auth-modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .auth-box {
            background: white;
            border-radius: 16px;
            width: 90%;
            max-width: 500px;
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .auth-header {
            padding: 1.5rem;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .auth-tabs {
            display: flex;
            border-bottom: 2px solid #eee;
        }

        .auth-tab {
            flex: 1;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
        }

        .auth-tab.active {
            color: var(--secondary);
            border-bottom: 2px solid var(--secondary);
            margin-bottom: -2px;
        }

        .auth-body {
            padding: 2rem;
        }

        .social-auth {
            display: grid;
            gap: 1rem;
            margin: 1.5rem 0;
        }

        .social-btn {
            padding: 0.75rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .social-btn:hover {
            opacity: 0.9;
        }

        .google-btn {
            background: #4285F4;
            color: white;
        }

        .facebook-btn {
            background: #3B5998;
            color: white;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .listings-container {
                grid-template-columns: 1fr;
            }

            .filters-section {
                position: static;
            }
        }

        @media (max-width: 768px) {
            .price-filter {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
<!-- Header (Same as Homepage) -->

<!-- Restaurant Listings Section -->
<main class="listings-container">
    <!-- Filters Sidebar -->
    <aside class="filters-section">
        <div class="filter-group">
            <h3 class="filter-title">Search <i class="fas fa-search"></i></h3>
            <input type="text" class="form-control" placeholder="Restaurant name or cuisine...">
        </div>

        <div class="filter-group">
            <h3 class="filter-title">Rating</h3>
            <div class="rating-filter">
                <i class="fas fa-star rating-star"></i>
                <i class="fas fa-star rating-star"></i>
                <i class="fas fa-star rating-star"></i>
                <i class="fas fa-star rating-star"></i>
                <i class="fas fa-star rating-star"></i>
            </div>
        </div>

        <div class="filter-group">
            <h3 class="filter-title">Price Range</h3>
            <div class="price-filter">
                <div class="price-chip">$</div>
                <div class="price-chip">$$</div>
                <div class="price-chip">$$$</div>
                <div class="price-chip">$$$$</div>
            </div>
        </div>

        <div class="filter-group">
            <h3 class="filter-title">Features <i class="fas fa-sliders-h"></i></h3>
            <div class="feature-filters">
                <label class="filter-option">
                    <input type="checkbox"> Outdoor Seating
                </label>
                <label class="filter-option">
                    <input type="checkbox"> Vegan Options
                </label>
                <label class="filter-option">
                    <input type="checkbox"> Parking Available
                </label>
            </div>
        </div>
    </aside>

    <!-- Restaurant Grid -->
    <section class="restaurant-grid">
        <div class="restaurant-card">
            <div class="card-badge">25% Off</div>
            <div class="card-image" style="background-image: url(resources/images/rest5.jpg)"></div>
            <div class="card-content">
            <h3>Kai Resto</h3>
            <div class="rating">
                <i class="fas fa-star"></i> 4.5 (220 reviews)
            </div>
            <p>French Cuisine  $$$ | 2km away</p>
            <div class="card-footer">
                <!-- Updated Reserve Button with Redirect to Payment Page -->
                <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                    <i class="fas fa-calendar-alt"></i> Reserve
                </button>
                <div class="availability">
                    <span class="dot green"></span> 5 tables available
                </div>
              </div>
            </div>
        </div>

        <div class="restaurant-card">
            <div class="card-badge">25% Off</div>
            <div class="card-image" style="background-image: url(resources/images/rest6.jpg)"></div>
            <div class="card-content">
                <h3>La Maison Gourmet</h3>
                <div class="rating">
                    <i class="fas fa-star"></i> 4.8 (280 reviews)
                </div>
                <p>Korean Cuisine $$$ | 1.5 km away</p>
                <div class="card-footer">
                    <!-- Updated Reserve Button with Redirect to Payment Page -->
                    <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                        <i class="fas fa-calendar-alt"></i> Reserve
                    </button>
                    <div class="availability">
                        <span class="dot green"></span> 5 tables available
                    </div>
                </div>
            </div>
        </div>

        <div class="restaurant-card">
            <div class="card-badge">25% Off</div>
            <div class="card-image" style="background-image: url(resources/images/rest7.jpg)"></div>
            <div class="card-content">
                <h3>Saffron Spice</h3>
                <div class="rating">
                    <i class="fas fa-star"></i> 4.5 (220 reviews)
                </div>
                <p>Korean Cuisine $$$ | 2 km away</p>
                <div class="card-footer">
                    <!-- Updated Reserve Button with Redirect to Payment Page -->
                    <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                        <i class="fas fa-calendar-alt"></i> Reserve
                    </button>
                    <div class="availability">
                        <span class="dot green"></span> 4 tables available
                    </div>
                </div>
            </div>
        </div>

        <div class="restaurant-card">
            <div class="card-badge">20% Off</div>
            <div class="card-image" style="background-image: url(resources/images/rest2.jpg)"></div>
            <div class="card-content">
                <h3>Savory Haven</h3>
                <div class="rating">
                    <i class="fas fa-star"></i> 4.2 (200 reviews)
                </div>
                <p>Korean Cuisine $$$ | 2 km away</p>
                <div class="card-footer">
                    <!-- Updated Reserve Button with Redirect to Payment Page -->
                    <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                        <i class="fas fa-calendar-alt"></i> Reserve
                    </button>
                    <div class="availability">
                        <span class="dot green"></span> 7 tables available
                    </div>
                </div>
            </div>
        </div>




            <!-- Repeat restaurant cards -->
            <div class="restaurant-card">
                <div class="card-badge">15% Off</div>
                <div class="card-image" style="background-image: url(resources/images/rest3.jpg)"></div>
                <div class="card-content">
                    <h3>Saffron Spice</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i> 3.8 (200 reviews)
                    </div>
                    <p>Indian Cuisine  $$ | 3 km away</p>
                    <div class="card-footer">
                        <!-- Updated Reserve Button with Redirect to Payment Page -->
                        <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                            <i class="fas fa-calendar-alt"></i> Reserve
                        </button>
                        <div class="availability">
                            <span class="dot green"></span> 4 tables available
                        </div>
                    </div>
                </div>
            </div>


            <div class="restaurant-card">
                <div class="card-badge">10% Off</div>
                <div class="card-image" style="background-image: url(resources/images/rest4.jpg)"></div>
                <div class="card-content">
                    <h3>Sakura Sushi</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i> 3.5 (180 reviews)
                    </div>
                    <p>Japanese Cuisine  $$ | 3.5km away</p>
                    <div class="card-footer">
                        <!-- Updated Reserve Button with Redirect to Payment Page -->
                        <!-- Updated Reserve Button with Redirect to Payment Page -->
                        <button class="btn-primary" onclick="window.location.href='paymentForm.jsp?restaurant=LaMaisonGourmet&price=3&distance=2km'">
                            <i class="fas fa-calendar-alt"></i> Reserve
                        </button>
                        <div class="availability">
                            <span class="dot green"></span> 3 tables available
                        </div>
                    </div>
                </div>
            </div>
        </section>
</main>


<!-- Auth Modal -->
<div class="auth-modal" id="authModal">
    <div class="auth-box">
        <div class="auth-header">
            <h3>Welcome to ReservEats</h3>
            <button class="close-modal" onclick="closeAuthModal()">&times;</button>
        </div>

        <div class="auth-tabs">
            <div class="auth-tab active" onclick="switchAuthTab('login')">Login</div>
            <div class="auth-tab" onclick="switchAuthTab('register')">Register</div>
        </div>

        <div class="auth-body">
            <!-- Login Form -->
            <form id="loginForm" class="auth-form active">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" required>
                </div>
                <button class="btn-primary">Sign In</button>

                <div class="social-auth">
                    <div class="social-btn google-btn">
                        <i class="fab fa-google"></i> Continue with Google
                    </div>
                    <div class="social-btn facebook-btn">
                        <i class="fab fa-facebook-f"></i> Continue with Facebook
                    </div>
                </div>
            </form>

            <!-- Registration Form -->
            <form id="registerForm" class="auth-form">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="password-strength">
                        <progress value="40" max="100"></progress>
                        <span>Medium Strength</span>
                    </div>
                    <input type="password" class="form-control" required>
                </div>
                <button class="btn-primary">Create Account</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Auth Modal Handling
    function showAuthModal() {
        document.getElementById('authModal').style.display = 'flex';
    }

    function closeAuthModal() {
        document.getElementById('authModal').style.display = 'none';
    }

    function switchAuthTab(tab) {
        document.querySelectorAll('.auth-tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.auth-form').forEach(f => f.classList.remove('active'));

        document.querySelector(`[onclick="switchAuthTab('${tab}')"]`).classList.add('active');
        document.getElementById(`${tab}Form`).classList.add('active');
    }

    // Filter Interactions
    document.querySelectorAll('.price-chip').forEach(chip => {
        chip.addEventListener('click', () => {
            chip.classList.toggle('active');
        });
    });

    // Rating Filter
    document.querySelectorAll('.rating-star').forEach(star => {
        star.addEventListener('click', (e) => {
            const stars = document.querySelectorAll('.rating-star');
            const index = Array.from(stars).indexOf(e.target);

            stars.forEach((s, i) => {
                s.style.color = i <= index ? 'var(--warning)' : '#ddd';
            });
        });
    });

    // Close modal on outside click
    window.onclick = function(e) {
        if(e.target.classList.contains('auth-modal')) {
            closeAuthModal();
        }
    }
</script>
</body>
</html>
