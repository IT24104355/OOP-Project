<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/10/2025
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- Refund Form -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Refund Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background: url('https://images.unsplash.com/photo-1481833761820-0509d3217039?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #dc3545;
        }
        label {
            font-weight: bold;
            text-align: left;
            display: block;
            margin-top: 10px;
            font-size: 14px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        button {
            background-color: #dc3545;
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
    </style>
</head>
<body>

<div class="form-container">
    <h2>Request a Refund</h2>
    <form action="refundSuccess.jsp" method="post">
        <label>Payment ID:</label>
        <input type="text" name="paymentId" required>

        <label>Reason for Refund:</label>
        <textarea name="reason" rows="4" required></textarea>

        <button type="submit">Submit Request</button>
    </form>
</div>

</body>
</html>
