<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/10/2025
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Refund Request Submitted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1481833761820-0509d3217039?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .confirmation-box {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #dc3545; /* Red color for heading */
            margin-bottom: 15px;
        }

        p {
            font-size: 16px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #dc3545; /* Red button */
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
        }

        a:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="confirmation-box">
    <h2>Refund Request Submitted</h2>
    <p>Your request has been received successfully. Our team will review it and get back to you shortly.</p>
    <a href="index.jsp">Return to Home</a>
</div>
</body>
</html>



