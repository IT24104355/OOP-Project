<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/10/2025
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Make a Payment</title>
    <style>
        /* Add Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        /* General Page Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1522413452208-996ff3f3e740?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        /* Dark Overlay Effect */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        /* Payment Form Container */
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 2;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-weight: bold;
            text-align: left;
            display: block;
            margin-top: 10px;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            background-color: #d9534f;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #c9302c;
        }

        @media (max-width: 500px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Make a Payment</h2>

    <form action="paymentSuccess.jsp" method="POST">
        <label>Payment ID:</label>
        <input type="text" name="paymentID" required placeholder="Enter Payment ID">

        <label>User ID:</label>
        <input type="text" name="userID" required placeholder="Enter User ID">

        <label>Reservation ID:</label>
        <input type="text" name="reservationID" required placeholder="Enter Reservation ID">

        <label>Amount:</label>
        <input type="number" name="amount" step="0.01" required placeholder="Enter Amount">

        <label>Payment Method:</label>
        <select name="paymentMethod">
            <option value="Credit Card">Credit Card</option>
            <option value="PayPal">PayPal</option>
            <option value="Google Pay">Google Pay</option>
        </select>

        <button type="submit">Pay Now</button>
    </form>

</div>

<script>
    function processPayment() {
        setTimeout(function () {
            window.location.href = "paymentSuccess.jsp";
        }, 1000);
    }
</script>

</body>
</html>




