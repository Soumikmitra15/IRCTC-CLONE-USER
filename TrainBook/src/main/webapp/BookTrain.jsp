
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Trains</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>

<style>

body
{
   background: #e1eec3;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #f05053, #e1eec3);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(45deg, #f05053, #e1eec3);
min-height: 100vh/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  
   }
  .container-fluid {
    display: grid;
    grid-template-columns: 2.5fr 7fr 2fr; /* Two columns: 7/12 for the card and 5/12 for the main content */
    grid-gap: 20px; /* Add some spacing between the card and the main content */
    padding: 20px; /* Add padding to the entire container */
  }
  .card {
    padding: 20px; /* Add some padding to the card */
    background-color: #f8f9fa; /* Set a background color for the card */
  }
  .container .input-group {
    margin-bottom: 15px; 
}

</style>
</head>
<body>
<header>
<nav class="navbar sticky-top bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand"><img src="Indian_Railways_logo.png" style="height: 60px; width: 60px;" alt=""></a>
    
    <form class="d-flex" role="search">
      <button id="logoutBtn" class="btn btn-danger" type="submit" onclick="window.location.href = 'LoginRegistration.jsp';">Logout</button>
    </form>
  </div>
</nav>
</header>
<div class="card mt-4 mx-auto" style="width: 75vw;">
  <div class="card-body">
    <h3>The Available Trains are shown below</h3>
  </div>
</div>

<c:set var="from" value="" />
<c:set var="to" value="" />
 <c:forEach var="cookies" items="${cookie}">
        <c:choose>
    <c:when test="${cookies.key eq 'from'}">
      <c:set var="from" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'firstName'}">
      <c:set var="fname" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'lastName'}">
      <c:set var="lname" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'email'}">
      <c:set var="email" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'type'}">
      <c:set var="type" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'cl'}">
      <c:set var="cl" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'date'}">
      <c:set var="date" value="${cookies.value.value}" />
    </c:when>
    <c:when test="${cookies.key eq 'to'}">
      <c:set var="to" value="${cookies.value.value}" />
    </c:when>
  </c:choose>
 </c:forEach>

<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521:XE" user="javaweb" password="javaweb" />

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM train WHERE FROM_STATION=? AND TO_STATION=?
    <sql:param value="${from }"></sql:param>
    <sql:param value="${to }"></sql:param>
</sql:query>

<c:forEach var="train" items="${result.rows}">

<div class="container-fluid">
  <div class="main"></div>
  <div class="card">
<div class="card text-center">
<form action="BookedTrain" method="post">
<div class="card-header">
    Train Code: <c:out value="${train.code}" />
  </div>
  <input type="hidden" name="from" value="${from}" />
  <input type="hidden" name="to" value="${to}" />
  <input type="hidden" name="code" value="${train.code}" />
  <input type="hidden" name="name" value="${train.name}" />
  <input type="hidden" name="date" value="${date}" />
  <input type="hidden" name="cl" value="${cl}" />
  <input type="hidden" name="type" value="${type}" />
  <input type="hidden" name="fname" value="${fname}" />
  <input type="hidden" name="lname" value="${lname}" />
  <input type="hidden" name="email" value="${email}" />
  <div class="card-body">
    <h5 class="card-title">Train Name: <c:out value="${train.name}" /></h5>
    <p class="card-text"><h5><c:out value="${train.from_station}" />  <i class="fas fa-arrow-right"></i>  <c:out value="${train.to_station}" /></h5></p>
    <button type="submit" class="btn btn-primary">Book Train</button>
  </div>
</form>
  
  <div class="card-footer text-muted">
   <i class="fas fa-calendar">  </i>  <c:out value="${date}"/>
  </div>
</div>
</div>
</div>
    </c:forEach>
    
    <script>
    window.onload = function() {
        if (!window.location.hash) {
            window.location = window.location + '#loaded';
            window.location.reload();
        }
    }
    
 // Function to handle button click
    document.getElementById('logoutBtn').addEventListener('click', function() {
      // Clear all cookies
      console.log("hello");
      clearAllCookies();

      // Redirect to LoginRegistration.jsp
      window.location.href = 'LoginRegistration.jsp';
    });

    // Function to clear all cookies
    function clearAllCookies() {
      var cookies = document.cookie.split(';');

      for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf('=');
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/';
      }
    }
  </script>                
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>