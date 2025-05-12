<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/10/2025
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String paymentMethod = request.getParameter("paymentMethod");
    String paymentID = request.getParameter("paymentID");
    String userID = request.getParameter("userID");
    String reservationID = request.getParameter("reservationID");
    String amount = request.getParameter("amount");
    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    String cardNumber = request.getParameter("cardNumber");
    String paypalAccount = request.getParameter("paypalAccount");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 50px;
            background: url('https://images.unsplash.com/photo-1667388969250-1c7220bf3f37?q=80&w=2110&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
        }
        .success-box {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid #c3e6cb;
            padding: 30px;
            display: inline-block;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            margin: auto;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-spacing: 0;
            text-align: left;
        }
        td {
            padding: 8px 0;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
        }
        a {
            color: #dc3545;
            font-weight: bold;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="success-box">
    <h2>Payment Successful!</h2>
    <p>Thank you for your payment. A receipt has been sent to your email.</p>

    <h3>Payment Details</h3>
    <table>
        <tr><td><strong>Payment ID:</strong></td><td><%= paymentID %></td></tr>
        <tr><td><strong>User ID:</strong></td><td><%= userID %></td></tr>
        <tr><td><strong>Reservation ID:</strong></td><td><%= reservationID %></td></tr>
        <tr><td><strong>Payment Method:</strong></td><td><%= paymentMethod %></td></tr>
        <% if ("Credit Card".equals(paymentMethod)) { %>
        <tr><td><strong>Card Number:</strong></td><td><%= cardNumber %></td></tr>
        <% } else if ("PayPal".equals(paymentMethod)) { %>
        <tr><td><strong>PayPal Email:</strong></td><td><%= paypalAccount %></td></tr>
        <% } %>
        <tr><td><strong>Date:</strong></td><td><%= date %></td></tr>
        <tr><td><strong>Total:</strong></td><td>$<%= amount %></td></tr>
    </table>

    <button onclick="window.print()">Print Receipt</button>

    <br><br>
    <p>If you would like to request a refund:</p>
    <a href="refundForm.jsp">Request a Refund</a>
</div>
</body>
</html>
