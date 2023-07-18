<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Error Page</title>
  <style>
    body {
      background-color: #f1f1f1;
      font-family: Arial, sans-serif;
      text-align: center;
      padding-top: 100px;
    }
    h1 {
      font-size: 48px;
      color: #e74c3c;
      margin-bottom: 20px;
    }
    .icon {
      display: inline-block;
      width: 150px;
      height: 150px;
      background-color: #e74c3c;
      border-radius: 50%;
      position: relative;
    }
    .line {
      position: absolute;
      width: 50px;
      height: 8px;
      background-color: white;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) rotate(45deg);
    }
    .line::after {
      content: "";
      position: absolute;
      width: 50px;
      height: 8px;
      background-color: white;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) rotate(-90deg);
    }
    .message {
      font-size: 24px;
      color: #e74c3c;
      margin-top: 30px;
    }
    .go-back {
      margin-top: 30px;
      display: inline-block;
      padding: 10px 20px;
      background-color: #e74c3c;
      color: white;
      text-decoration: none;
      font-size: 18px;
      border-radius: 5px;
    }
    .go-back:hover {
      background-color:  #c31432;
    }
  </style>
</head>
<body>
  <div class="icon">
    <div class="line"></div>
  </div>
  <h1>Oops</h1>
  <p class="message">Something went wrong</p>
  <div class="message">You can now go back.</div>
  <a href="BookTrain.jsp" class="go-back">Go Back</a>
</body>
</html>
