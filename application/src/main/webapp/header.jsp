<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wild_tour.dto.User" %>

<%
    User user = (User) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
    boolean isAdmin = isLoggedIn && user.getUserId() == 1;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wildlife Header</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-mQ93xN6+zTQ4Zw6KtI2pHRY4OaCEk36zI4eYtvH6uwGbFk77J3bWhNRiKtCkVpWZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
        .navbar {
            background-color: #f4f8f4;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            font-family: 'Segoe UI', sans-serif;
            padding:15px 0;
        }

        .navbar-brand {
            font-weight: bold;
            color: #2e7d32 !important;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .navbar-nav .nav-link {
            font-weight: 500;
            color: #333;
            margin-right: 15px;
            transition: color 0.3s;
        }

        .navbar-nav .nav-link:hover {
            color: #2e7d32;
        }

        .dropdown-menu {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .dropdown-item:hover {
            background-color: #eaf5ea;
            color: #2e7d32;
        }

        .navbar-toggler {
            border-color: rgba(0,0,0,0.1);
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%232e7d32' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%280, 0, 0, 0.5%29' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        .profile-dropdown {
    margin-left: 10px; 
}
        
        
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="<%= isLoggedIn ? "dashboard.jsp" : "Home.jsp" %>">
            <img src="https://tse4.mm.bing.net/th?id=OIP.vNrNrjSGanab468Bks6zNAAAAA&pid=Api&P=0&h=180" alt="Wildlife Logo" width="50">
            Wildlife Tourism
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%= isLoggedIn ? "dashboard.jsp" : "Home.jsp" %>">Home</a>
                </li>
               

                <% if (!isLoggedIn) { %>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="signup.jsp">Register</a></li>
                <% } else if (isAdmin) { %>
                    <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="trip_management.jsp">Booked Trips</a></li>
                <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarProfileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fa-solid fa-user-circle me-2" style="font-size: 24px;"></i>
        <%= user.getUser_name() %>
    </a>
    <ul class="dropdown-menu profile-dropdown" aria-labelledby="navbarProfileDropdown">
        <li><a class="dropdown-item" href="profile.jsp">My Profile</a></li>
        <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
    </ul>
</li>
                <% } else { %>
            <li><a class="nav-link" href="about.jsp">About</a></li>
                
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Our Activities
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="safari.jsp">Wildlife Safaris</a></li>
                            <li><a class="dropdown-item" href="photography.jsp">Wildlife Photography</a></li>
                            <li><a class="dropdown-item" href="wildlifeSighting.jsp">Wildlife Sighting</a></li>
                            
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Tourism
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="package.jsp">Tourism Packages</a></li>
                            <li><a class="dropdown-item" href="stay.jsp">Accommodations</a></li>
                            <li><a class="dropdown-item" href="guide.jsp">Guide Service</a></li>
                        </ul>
                    </li>
                    <li><a class="nav-link" href="myTrip.jsp">MyTrips</a></li>
                    <a class="nav-link" href="contact.jsp">Contact</a>
                    

                   <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarProfileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fa-solid fa-user-circle me-2" style="font-size: 24px;"></i>
        <%= user.getUser_name() %>
    </a>
    <ul class="dropdown-menu profile-dropdown" aria-labelledby="navbarProfileDropdown">
        <li><a class="dropdown-item" href="profile.jsp">My Profile</a></li>
        <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
    </ul>
</li>
                   
                   
                    
        
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-VRjE7nt98CkQnZzuw4nlPXf5ph2OydK6JZgZNUcQZDzA6BpAGjF2b7rE3L+dyO9g" crossorigin="anonymous"></script>


</body>
</html>
