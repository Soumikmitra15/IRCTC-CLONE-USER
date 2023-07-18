<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Indian Railways Booking</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>

<style>
  body {
    margin: 0;
    padding: 0;
     background-image: url("VANDEY-BHARAT.png"); /* Replace "background.jpg" with your image file name and path */
            background-size: cover; /* Adjust background size to cover the entire viewport */
            background-repeat: no-repeat;
  }
  .container-fluid {
    display: grid;
    grid-template-columns: 7fr 5fr; /* Two columns: 7/12 for the card and 5/12 for the main content */
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
<nav class="navbar bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand"><img src="Indian_Railways_logo.png" style="height: 60px; width: 60px;" alt=""></a>
    
    <form class="d-flex" role="search">
      <button id="logoutBtn" class="btn btn-danger" type="submit" onclick="window.location.href = 'LoginRegistration.jsp';">Logout</button>
    </form>
  </div>
</nav>

<div class="container-fluid">
  <!-- Card Area (7/12 grid) -->
  <div class="card">
    <!-- Add card content here -->
    <h2>Book Train Ticket</h2>
   
    <!-- ... Your existing HTML content ... -->
<form class="container text-center pt-4" action="Booking" method="post">
    <div class="row align-items-start g-3">
        <div class="col input-group flex-wrap">
            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-location-arrow"></i></span>
            <input type="text" class="form-control" placeholder="From" aria-label="From" name="From">
        </div>

        <div class="col input-group flex-wrap">
            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-map-marker-alt"></i></span>
            <input type="text" class="form-control" placeholder="To" aria-label="To" name="To">
        </div>
    </div>

    <div class="row align-items-start g-3">
        <div class="col">
            <div class="input-group">
                <span class="input-group-text" id="addon-wrapping"><i class="fas fa-calendar"></i></span>
                <input id="startDate" class="form-control" type="date" name="date"/>
            </div>
        </div>
        <div class="col input-group flex-wrap">
            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-briefcase"></i></span>
            <select class="form-select" aria-label="Default select example" name="class">
                <option selected>All Classes</option>
                <option value="1A">AC 1 Tier (1A)</option>
                <option value="2A">AC 2 Tier (2A)</option>
                <option value="3A">AC 3 Tier (3A)</option>
                <option value="SL">Sleeper (SL)</option>
            </select>
        </div>
    </div>

    <div class="row align-items-start g-3">
        <div class="col input-group flex-wrap">
            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-th-large"></i></span>
            <select class="form-select" aria-label="Default select example" name="type">
                <option selected>General</option>
                <option value="Ladies">Ladies</option>
                <option value="Senior Citizen">Senior Citizen</option>
                <option value="Tatkal">Tatkal</option>
            </select>
        </div>
        <div class="col"></div>
    </div>

    <div class="pt-3">
        <button class="btn btn-success" type="submit">Search</button>
    </div>
</form>

  </div>

  <div>
    
  </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</html>
