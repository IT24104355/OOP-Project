<!-- admin-login.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - ReservEats</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #1a1d28;
            --secondary: #c1272d;
            --accent: #f8f8f8;
        }

        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: var(--primary);
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 1rem;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .btn-login {
            background: var(--secondary);
            color: white;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .btn-login:hover {
            opacity: 0.9;
        }

        .error-message {
            color: #dc3545;
            text-align: center;
            display: none;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2 style="text-align: center; margin-bottom: 2rem;">Admin Login</h2>
    <form class="login-form" id="loginForm">
        <div class="form-group">
            <input type="password" class="form-control" id="password"
                   placeholder="Enter Admin Password" required>
            <i class="fas fa-eye password-toggle" onclick="togglePassword()"></i>
        </div>
        <p class="error-message" id="errorMessage">Invalid password</p>
        <button type="submit" class="btn-login">Login</button>
    </form>
</div>

<script>
    // Hardcoded admin password (for demonstration only)
    const ADMIN_PASSWORD = "Admin@1234";

    function togglePassword() {
        const passwordField = document.getElementById('password');
        const toggleIcon = document.querySelector('.password-toggle');

        if(passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
        }
    }

    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const enteredPassword = document.getElementById('password').value;
        const errorMessage = document.getElementById('errorMessage');

        if(enteredPassword === ADMIN_PASSWORD) {
            sessionStorage.setItem('authenticated', 'true');
            window.location.href = 'admin_panel.jsp';
        } else {
            errorMessage.style.display = 'block';
            setTimeout(() => {
                errorMessage.style.display = 'none';
            }, 3000);
        }
    });
</script>
</body>
</html>