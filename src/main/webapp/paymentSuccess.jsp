<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/10/2025
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Payment success page -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 50px;
            background: url('https://images.unsplash.com/photo-1667388969250-1c7220bf3f37?q=80&w=2110&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
        }
        .success-box {
            background: rgba(255, 255, 255, 0.8); /* Light transparent background */
            border: 1px solid #c3e6cb;
            padding: 30px;
            display: inline-block;
            border-radius: 10px;
            text-align: center;
            width: 100%;
            max-width: 500px;
            margin: auto;
        }
        a {
            color: #dc3545;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-spacing: 0;
            text-align: center;
        }
        td {
            padding: 8px 0;
        }
    </style>
</head>
<body>
<div class="success-box">
    <h2>Payment Successful!</h2>
    <p>Thank you for your payment. A receipt has been sent to your email.</p>

    <h3>Payment Details</h3>
    <table>
        <tr><td>Payment ID:</td><td><%= request.getParameter("paymentID") %></td></tr>
        <tr><td>User ID:</td><td><%= request.getParameter("userID") %></td></tr>
        <tr><td>Reservation ID:</td><td><%= request.getParameter("reservationID") %></td></tr>
        <tr><td>Method:</td><td><%= request.getParameter("paymentMethod") %></td></tr>
        <tr><td>Date:</td><td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></td></tr>
        <tr><td>Total:</td><td>$<%= request.getParameter("amount") %></td></tr>
    </table>

    <br>
    <button onclick="window.print()">Print Receipt</button>

    <br><br>

    <!-- Link to Refund Request Form -->
    <p>If you would like to request a refund, click the link below:</p>
    <a href="refundForm.jsp">Request a Refund</a>
</div>
</body>
</html>
