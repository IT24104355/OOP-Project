<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - Secure Login</title>
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
        }

        .auth-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: 100vh;
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

        @media (max-width: 768px) {
            .auth-container {
                grid-template-columns: 1fr;
            }

            .auth-illustration {
                display: none;
            }
        }
    </style>
</head>
<body>
<div class="auth-container">
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
                        <input type="email" class="form-control" placeholder="Email" required>
                    </div>

                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" placeholder="Password" required id="loginPassword">
                        <i class="fas fa-eye password-toggle" onclick="togglePassword('loginPassword')"></i>
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
                        <input type="text" class="form-control" placeholder="Full Name" required>
                    </div>

                    <div class="input-group">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control" placeholder="Email" required>
                    </div>

                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" placeholder="Password" required
                               id="signupPassword" oninput="checkPasswordStrength(this.value)">
                        <i class="fas fa-eye password-toggle" onclick="togglePassword('signupPassword')"></i>
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
        document.getElementById('securityBar').style = `
                width: ${width};
                background: ${color}
            `;
        document.getElementById('passwordStrength').innerHTML = `
                Password Strength: <strong style="color: ${color}">${text}</strong>
            `;
    }

    // Form Submission Handling
    document.querySelectorAll('.auth-form').forEach(form => {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            const alertBox = form.querySelector('.auth-alert');
            alertBox.style.display = 'block';
            alertBox.classList.remove('alert-error', 'alert-success');

            // Simulate API call
            setTimeout(() => {
                if(Math.random() > 0.5) {
                    alertBox.classList.add('alert-success');
                    alertBox.innerHTML = `
                            <i class="fas fa-check-circle"></i>
                            ${form.id == 'loginForm' ? 'Login successful!' : 'Account created!'}
                        `;
                    form.reset();
                } else {
                    alertBox.classList.add('alert-error');
                    alertBox.innerHTML = `
                            <i class="fas fa-exclamation-circle"></i>
                            ${form.id == 'loginForm'
                                ? 'Invalid email or password'
                                : 'Email already registered'}
                        `;
                }
            }, 1000);
        });
    });
</script>
</body>
</html>