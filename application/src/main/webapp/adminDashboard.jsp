<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }
       
        nav {
            background-color: #2d572c;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            gap: 100px;
        }
        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
        }
        nav a:hover {
            text-decoration: underline;
        }
        h1 {
            color: #2d572c;
            margin: 30px 0;
            text-align: center;
        }
        .dashboard {
            display: flex;
            justify-content: center;
            gap: 100px;
            padding: 20px;
        }
        .card {
            background-color: white;
            padding: 20px;
            width: 250px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
            text-align: center;
            cursor: pointer;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card h2 {
            margin-bottom: 10px;
            color: #333;
        }
        .card a {
            text-decoration: none;
            color: white;
            background-color: green;
            padding: 10px 20px;
            border-radius: 8px;
            display: inline-block;
            margin: 5px;
        }
        footer{
        margin-top: 50px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Wildlife Tourism Dashboard</h1>


   
  

<!-- Navigation Bar -->
<nav>
    <a href="addsafari.jsp">Add Safari</a>
    <a href="add_stay.jsp">Add Stay</a>
    <a href="add_packages.jsp">Add Packages</a>
        <a href="add_guide.jsp">Add Guides</a>
    
     
</nav>



<div class="dashboard">
    <div class="card">
    <img src="https://media.istockphoto.com/id/1001649214/vector/african-safari-adventure-sign.jpg?s=612x612&w=0&k=20&c=Tf9NDKZDReHQvxTZlTax5J1OtLabbZ7O-JMU78qqOQc=" height="150px" width="200px">
        <h2>Safari</h2>
        <p>View and manage safari details.</p>
        <a href="viewSafari.jsp">View Safari</a>
        
    </div>
    <div class="card">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJsXCzMfw3rWSkXcPxks-VND0vn2LRnZwq7A&s" height="150px" width="200px">
        <h2>Stay</h2>
        <p>View and manage stay options.</p>
        <a href="viewStay.jsp">View Stay</a>
        
    </div>
    <div class="card">
    <img src="https://5.imimg.com/data5/SELLER/Default/2024/7/438209933/FO/SI/NT/3218684/wildlife-park-tour-500x500.jpg"height="150px" width="200px">
        
        <h2>Packages</h2>
        <p>View and manage tour packages.</p>
        <a href="viewPackage.jsp">View Packages</a>
        
    </div>
    <div class="card">
    <img src="https://www.shutterstock.com/image-vector/tour-guide-icon-isolated-on-260nw-2132728597.jpg"height="170px" width="200px">
        
        <h2>Guides</h2>
        <p>View and manage Guides.</p>
        <a href="viewGuide.jsp">View Guides</a>
        
    </div>
</div>
<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
