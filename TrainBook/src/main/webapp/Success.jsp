<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Booking Success</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      padding-top: 50px;
    }
    .check-icon {
      font-size: 120px;
      color: #1abc9c;
    }
    .message {
      font-size: 24px;
      margin-top: 20px;
    }
    .go-back {
      margin-top: 30px;
      display: inline-block;
      padding: 10px 20px;
      background-color: #1abc9c;
      color: white;
      text-decoration: none;
      font-size: 18px;
      border-radius: 5px;
    }
    .go-back:hover {
      background-color: #128c76;
    }
  </style>
</head>
<body>
  <i class="fas fa-check-circle check-icon"></i>
  <div class="message">Your Booking has been Completed.</div>
  <div class="message">You can now go back.</div>
  <a href="BookTrain.jsp" class="go-back">Go Back</a>
</body>
</html>
