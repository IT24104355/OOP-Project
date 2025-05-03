<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - User Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2a2a2a;
            --secondary: #c1272d;
            --accent: #f8f8f8;
            --text: #333;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
            --light: #ecf0f1;
            --dark: #34495e;
        }

        /* Header Styles */
        header {
            background-color: var(--primary);
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
            border-radius: 0 0 10px 10px;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .nav-links a:hover {
            background-color: rgba(255,255,255,0.2);
        }

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        /* Auth Container Styles */
        .auth-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: calc(100vh - 110px);
            background: var(--accent);
        }

        .auth-illustration {
            background: linear-gradient(rgba(42,42,42,0.9), rgba(42,42,42,0.9)),
            url("resources/images/pic.jpg") center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            color: white;
            text-align: center;
        }

        .auth-content {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .auth-box {
            width: 100%;
            max-width: 440px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .auth-header {
            padding: 2rem;
            background: var(--primary);
            color: white;
            text-align: center;
        }

        .auth-nav {
            display: flex;
            justify-content: center;
            margin-bottom: 2rem;
        }

        .auth-link {
            margin: 0 1rem;
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .auth-link.active {
            color: white;
            border-bottom: 2px solid var(--secondary);
        }

        .auth-body {
            padding: 2rem;
        }

        .input-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
        }

        .form-control {
            width: 100%;
            padding: 0.875rem 1rem 0.875rem 2.75rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: var(--secondary);
            outline: none;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--primary);
        }

        .security-indicator {
            height: 4px;
            background: #eee;
            margin: 0.5rem 0;
            border-radius: 2px;
            overflow: hidden;
        }

        .security-bar {
            height: 100%;
            width: 0%;
            transition: width 0.3s;
        }

        .password-strength {
            font-size: 0.875rem;
            color: var(--text);
        }

        .terms {
            font-size: 0.875rem;
            margin: 1.5rem 0;
            color: #666;
        }

        .auth-alert {
            padding: 0.875rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: none;
        }

        .alert-success {
            background: rgba(40, 167, 69, 0.1);
            border: 1px solid var(--success);
            color: var(--success);
        }

        .alert-error {
            background: rgba(220, 53, 69, 0.1);
            border: 1px solid var(--danger);
            color: var(--danger);
        }

        .btn-auth {
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
        }

        .btn-primary {
            background: var(--secondary);
            color: white;
        }

        .btn-secondary {
            background: var(--primary);
            color: white;
            margin-top: 10px;
        }

        .social-auth {
            margin: 2rem 0;
            position: relative;
            text-align: center;
        }

        .social-auth::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            border-top: 1px solid #eee;
            z-index: 1;
        }

        .social-label {
            position: relative;
            z-index: 2;
            background: white;
            padding: 0 1rem;
            color: #666;
        }

        .social-buttons {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-btn {
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            cursor: pointer;
            transition: background 0.2s;
        }

        .social-btn:hover {
            background: var(--accent);
        }

        /* Dashboard Styles */
        .dashboard-container {
            display: none;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .dashboard {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        .sidebar {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

        .sidebar-menu a {
            display: block;
            padding: 10px;
            color: var(--primary);
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background-color: var(--light);
        }

        .main-content {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: var(--primary);
        }

        .user-details h2 {
            margin-bottom: 5px;
            color: var(--primary);
        }

        .user-details p {
            color: #777;
        }

        .profile-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .info-card {
            background-color: var(--light);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .info-card h3 {
            margin-bottom: 15px;
            color: var(--dark);
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        .info-label {
            font-weight: 600;
        }

        .edit-btn {
            background: none;
            border: none;
            color: var(--secondary);
            cursor: pointer;
            font-size: 14px;
            padding: 0;
            width: auto;
        }

        /* Edit Profile Forms */
        .form-container {
            display: none;
            max-width: 500px;
            margin: 30px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
            color: var(--secondary);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .auth-container {
                grid-template-columns: 1fr;
            }

            .auth-illustration {
                display: none;
            }

            .dashboard {
                grid-template-columns: 1fr;
            }

            .profile-content {
                grid-template-columns: 1fr;
            }

            .nav-container {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links, .auth-buttons {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="nav-container">
        <div class="logo">ReservEats</div>
        <nav class="nav-links">
            <a href="#">Home</a>
            <a href="#">Restaurants</a>
            <a href="#">Reservations</a>
            <a href="#">Contact</a>
        </nav>
        <div class="auth-buttons">
            <button class="btn-auth btn-secondary" onclick="showLoginForm()">Login</button>
            <button class="btn-auth btn-primary" onclick="showRegisterForm()">Register</button>
        </div>
    </div>
</header>

<div class="auth-container" id="auth-container">
    <div class="auth-illustration">
        <div class="hero-text">
            <h2>Welcome Back to ReservEats</h2>
            <p>Your gateway to exceptional dining experiences</p>
        </div>
    </div>

    <div class="auth-content">
        <div class="auth-box">
            <div class="auth-header">
                <h1>ReservEats</h1>
                <nav class="auth-nav">
                    <a href="#login" class="auth-link active">Sign In</a>
                    <a href="#signup" class="auth-link">Create Account</a>
                </nav>
            </div>

            <div class="auth-body">
                <!-- Login Form -->
                <form id="loginForm" class="auth-form active">
                    <div class="auth-alert" id="loginAlert"></div>

                    <div class="input-group">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control" placeholder="Email" required id="login-email">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" placeholder="Password" required id="login-password">
                        <i class="fas fa-eye password-toggle" onclick="togglePassword('login-password')"></i>
                    </div>

                    <div class="flex-group">
                        <label class="remember-me">
                            <input type="checkbox"> Remember Me
                        </label>
                        <a href="#forgot-password" class="forgot-password">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn-auth btn-primary">Sign In</button>

                    <div class="social-auth">
                        <span class="social-label">Or continue with</span>
                        <div class="social-buttons">
                            <div class="social-btn">
                                <i class="fab fa-google"></i> Google
                            </div>
                            <div class="social-btn">
                                <i class="fab fa-apple"></i> Apple
                            </div>
                        </div>
                    </div>
                </form>

                <!-- Signup Form -->
                <form id="signupForm" class="auth-form">
                    <div class="auth-alert" id="signupAlert"></div>

                    <div class="input-group">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" placeholder="Full Name" required id="register-name">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control" placeholder="Email" required id="register-email">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-phone input-icon"></i>
                        <input type="tel" class="form-control" placeholder="Phone Number" id="register-phone">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" placeholder="Password" required
                               id="register-password" oninput="checkPasswordStrength(this.value)">
                        <i class="fas fa-eye password-toggle" onclick="togglePassword('register-password')"></i>
                    </div>

                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" placeholder="Confirm Password" required id="register-confirm">
                    </div>

                    <div class="security-indicator">
                        <div class="security-bar" id="securityBar"></div>
                    </div>
                    <div class="password-strength" id="passwordStrength"></div>

                    <div class="terms">
                        By creating an account, you agree to our <br>
                        <a href="#terms">Terms of Service</a> and <a href="#privacy">Privacy Policy</a>
                    </div>

                    <button type="submit" class="btn-auth btn-primary">Create Account</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- User Dashboard -->
<div class="dashboard-container" id="user-dashboard">
    <div class="dashboard">
        <div class="sidebar">
            <ul class="sidebar-menu">
                <li><a href="#" class="active">My Profile</a></li>
                <li><a href="#">Reservations</a></li>
                <li><a href="#">Payment Methods</a></li>
                <li><a href="#">Favorites</a></li>
                <li><a href="#">Notifications</a></li>
                <li><a href="#" onclick="logout()">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="profile-header">
                <div class="profile-info">
                    <div class="avatar">JD</div>
                    <div class="user-details">
                        <h2>John Doe</h2>
                        <p>Member since June 2023</p>
                    </div>
                </div>
                <button class="btn-auth btn-secondary" onclick="showEditProfileForm()">Edit Profile</button>
            </div>

            <div class="auth-alert alert-success" id="profileAlert" style="display: none;">
                <i class="fas fa-check-circle"></i>
                Profile updated successfully!
            </div>

            <div class="profile-content">
                <div>
                    <div class="info-card">
                        <h3>Personal Information</h3>
                        <div class="info-row">
                            <span class="info-label">Full Name:</span>
                            <span id="profile-name">John Doe</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Email:</span>
                            <span id="profile-email">john.doe@example.com</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Phone:</span>
                            <span id="profile-phone">(123) 456-7890</span>
                        </div>
                    </div>

                    <div class="info-card">
                        <h3>Account Security</h3>
                        <div class="info-row">
                            <span class="info-label">Password:</span>
                            <span>••••••••</span>
                        </div>
                        <button class="edit-btn" onclick="showChangePasswordForm()">Change Password</button>
                    </div>
                </div>

                <div>
                    <div class="info-card">
                        <h3>Recent Reservations</h3>
                        <div class="info-row">
                            <span class="info-label">The Gourmet Spot</span>
                            <span>May 15, 2023</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Ocean View Bistro</span>
                            <span>April 28, 2023</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Pasta Palace</span>
                            <span>March 10, 2023</span>
                        </div>
                        <button class="edit-btn">View All Reservations</button>
                    </div>

                    <div class="info-card">
                        <h3>Account Actions</h3>
                        <button class="btn-auth btn-secondary" style="margin-bottom: 10px;" onclick="showDeleteAccountForm()">Delete Account</button>
                        <p style="font-size: 12px; color: #777;">This action cannot be undone. All your data will be permanently deleted.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Profile Form -->
<div id="edit-profile-form" class="form-container">
    <h2 class="form-title">Edit Profile</h2>
    <form id="editProfileForm">
        <div class="input-group">
            <i class="fas fa-user input-icon"></i>
            <input type="text" class="form-control" id="edit-name" value="John Doe" required>
        </div>
        <div class="input-group">
            <i class="fas fa-envelope input-icon"></i>
            <input type="email" class="form-control" id="edit-email" value="john.doe@example.com" required>
        </div>
        <div class="input-group">
            <i class="fas fa-phone input-icon"></i>
            <input type="tel" class="form-control" id="edit-phone" value="1234567890">
        </div>
        <button type="submit" class="btn-auth btn-primary">Save Changes</button>
        <button type="button" class="btn-auth btn-secondary" onclick="hideEditProfileForm()">Cancel</button>
    </form>
</div>

<!-- Change Password Form -->
<div id="change-password-form" class="form-container">
    <h2 class="form-title">Change Password</h2>
    <form id="changePasswordForm">
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control" id="current-password" placeholder="Current Password" required>
        </div>
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control" id="new-password" placeholder="New Password" required>
            <i class="fas fa-eye password-toggle" onclick="togglePassword('new-password')"></i>
        </div>
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control" id="confirm-new-password" placeholder="Confirm New Password" required>
            <i class="fas fa-eye password-toggle" onclick="togglePassword('confirm-new-password')"></i>
        </div>
        <div class="security-indicator">
            <div class="security-bar" id="changePasswordBar"></div>
        </div>
        <div class="password-strength" id="changePasswordStrength"></div>
        <button type="submit" class="btn-auth btn-primary">Update Password</button>
        <button type="button" class="btn-auth btn-secondary" onclick="hideChangePasswordForm()">Cancel</button>
    </form>
</div>

<!-- Delete Account Form -->
<div id="delete-account-form" class="form-container">
    <h2 class="form-title">Delete Account</h2>
    <div class="auth-alert alert-error">
        <i class="fas fa-exclamation-circle"></i>
        <strong>Warning:</strong> This action cannot be undone. All your data will be permanently deleted.
    </div>
    <form id="deleteAccountForm">
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control" id="delete-password" placeholder="Enter your password to confirm" required>
        </div>
        <button type="submit" class="btn-auth" style="background-color: var(--danger);">Permanently Delete Account</button>
        <button type="button" class="btn-auth btn-secondary" onclick="hideDeleteAccountForm()">Cancel</button>
    </form>
</div>

<script>
    // Form Toggle
    document.querySelectorAll('.auth-link').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            document.querySelectorAll('.auth-link').forEach(l => l.classList.remove('active'));
            document.querySelectorAll('.auth-form').forEach(f => f.classList.remove('active'));

            link.classList.add('active');
            const formId = link.getAttribute('href').substring(1);
            document.getElementById(formId + 'Form').classList.add('active');
        });
    });

    // Password Visibility Toggle
    function togglePassword(fieldId) {
        const passwordField = document.getElementById(fieldId);
        const toggleIcon = passwordField.nextElementSibling;

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
        }
    }

    // Password Strength Checker
    function checkPasswordStrength(password) {
        const strength = {
            0: { text: 'Very Weak', color: '#dc3545', width: '20%' },
            1: { text: 'Weak', color: '#ffc107', width: '40%' },
            2: { text: 'Moderate', color: '#17a2b8', width: '60%' },
            3: { text: 'Strong', color: '#28a745', width: '80%' },
            4: { text: 'Very Strong', color: '#28a745', width: '100%' }
        };

        let score = 0;
        if (password.length >= 8) score++;
        if (password.match(/[A-Z]/)) score++;
        if (password.match(/[0-9]/)) score++;
        if (password.match(/[^A-Za-z0-9]/)) score++;

        const { text, color, width } = strength[Math.min(score, 4)];
        const securityBar = document.getElementById('securityBar') || document.getElementById('changePasswordBar');
        const passwordStrength = document.getElementById('passwordStrength') || document.getElementById('changePasswordStrength');

        securityBar.style = `
            width: ${width};
            background: ${color}
        `;
        passwordStrength.innerHTML = `
            Password Strength: <strong style="color: ${color}">${text}</strong>
        `;
    }

    // Form Submission Handling
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const alertBox = document.getElementById('loginAlert');
        alertBox.style.display = 'none';

        // Simulate login
        setTimeout(() => {
            showUserDashboard();
        }, 1000);
    });

    document.getElementById('signupForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const alertBox = document.getElementById('signupAlert');
        alertBox.style.display = 'none';

        // Get form values
        const name = document.getElementById('register-name').value;
        const email = document.getElementById('register-email').value;
        const phone = document.getElementById('register-phone').value;

        // Update profile info
        document.getElementById('profile-name').textContent = name;
        document.getElementById('profile-email').textContent = email;
        document.getElementById('profile-phone').textContent = phone || 'Not provided';
        document.querySelector('.avatar').textContent = name.split(' ').map(n => n[0]).join('');

        // Simulate registration
        setTimeout(() => {
            showUserDashboard();
        }, 1000);
    });

    document.getElementById('editProfileForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Get form values
        const name = document.getElementById('edit-name').value;
        const email = document.getElementById('edit-email').value;
        const phone = document.getElementById('edit-phone').value;

        // Update profile info
        document.getElementById('profile-name').textContent = name;
        document.getElementById('profile-email').textContent = email;
        document.getElementById('profile-phone').textContent = phone || 'Not provided';
        document.querySelector('.avatar').textContent = name.split(' ').map(n => n[0]).join('');

        // Show success message
        const alertBox = document.getElementById('profileAlert');
        alertBox.style.display = 'block';

        // Hide form
        hideEditProfileForm();

        // Hide alert after 3 seconds
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 3000);
    });

    document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Show success message
        const alertBox = document.getElementById('profileAlert');
        alertBox.innerHTML = '<i class="fas fa-check-circle"></i> Password changed successfully!';
        alertBox.style.display = 'block';

        // Hide form
        hideChangePasswordForm();

        // Hide alert after 3 seconds
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 3000);
    });

    document.getElementById('deleteAccountForm').addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Account deleted successfully');
        showLoginForm();
    });

    // View Toggle Functions
    function showLoginForm() {
        document.getElementById('auth-container').style.display = 'grid';
        document.getElementById('user-dashboard').style.display = 'none';
        document.getElementById('edit-profile-form').style.display = 'none';
        document.getElementById('change-password-form').style.display = 'none';
        document.getElementById('delete-account-form').style.display = 'none';

        // Activate login tab
        document.querySelectorAll('.auth-link').forEach(l => l.classList.remove('active'));
        document.querySelector('.auth-link[href="#login"]').classList.add('active');
        document.querySelectorAll('.auth-form').forEach(f => f.classList.remove('active'));
        document.getElementById('loginForm').classList.add('active');
    }

    function showRegisterForm() {
        document.getElementById('auth-container').style.display = 'grid';
        document.getElementById('user-dashboard').style.display = 'none';
        document.getElementById('edit-profile-form').style.display = 'none';
        document.getElementById('change-password-form').style.display = 'none';
        document.getElementById('delete-account-form').style.display = 'none';

        // Activate register tab
        document.querySelectorAll('.auth-link').forEach(l => l.classList.remove('active'));
        document.querySelector('.auth-link[href="#signup"]').classList.add('active');
        document.querySelectorAll('.auth-form').forEach(f => f.classList.remove('active'));
        document.getElementById('signupForm').classList.add('active');
    }

    function showUserDashboard() {
        document.getElementById('auth-container').style.display = 'none';
        document.getElementById('user-dashboard').style.display = 'block';
        document.getElementById('edit-profile-form').style.display = 'none';
        document.getElementById('change-password-form').style.display = 'none';
        document.getElementById('delete-account-form').style.display = 'none';
    }

    function showEditProfileForm() {
        document.getElementById('auth-container').style.display = 'none';
        document.getElementById('user-dashboard').style.display = 'none';
        document.getElementById('edit-profile-form').style.display = 'block';
        document.getElementById('change-password-form').style.display = 'none';
        document.getElementById('delete-account-form').style.display = 'none';
    }

    function hideEditProfileForm() {
        showUserDashboard();
    }

    function showChangePasswordForm() {
        document.getElementById('auth-container').style.display = 'none';
        document.getElementById('user-dashboard').style.display = 'none';
        document.getElementById('edit-profile-form').style.display = 'none';
        document.getElementById('change-password-form').style.display = 'block';
        document.getElementById('delete-account-form').style.display = 'none';
    }

    function hideChangePasswordForm() {
        showUserDashboard();
    }

    function showDeleteAccountForm() {
        document.getElementById('auth-container').style.display = 'none';
        document.getElementById('user-dashboard').style.display = 'none';
        document.getElementById('edit-profile-form').style.display = 'none';
        document.getElementById('change-password-form').style.display = 'none';
        document.getElementById('delete-account-form').style.display = 'block';
    }

    function hideDeleteAccountForm() {
        showUserDashboard();
    }

    function logout() {
        showLoginForm();
    }

    // Initialize password strength checker for change password form
    document.getElementById('new-password').addEventListener('input', function() {
        checkPasswordStrength(this.value);
    });

    // Initialize by showing login form
    showLoginForm();
</script>
</body>
</html>