<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WildLife Tour Packages</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />  
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f6f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #2e7d32;
            color: white;
            padding: 30px;
            text-align: center;
            margin: 0;
            border-radius: 0 0 16px 16px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
         
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 10px 0px;
            gap: 80px;
        }
        .package-box {
            width: 520px;
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
            padding:10px;
            margin-top:40px;
        }
        .package-box:hover {
            transform: translateY(-6px);
        }
        .package-box img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        .package-box h3 {
            color: #1b5e20;
            margin: 15px;
            font-size: 22px;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            margin: 0 15px 10px;
            color: #444;
        }
        .details {
            text-align: left;
            margin: 0 15px 15px;
            font-size: 14px;
            color: #555;
        }
        .details ul {
            padding-left: 20px;
            margin: 10px 0;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            padding: 0 15px 20px;
        }
        .buttons a {
            padding: 8px 14px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        .update-btn {
            background-color: #1976d2;
        }
        .update-btn:hover {
            background-color: #1565c0;
        }
        .delete-btn {
            background-color: #d32f2f;
            padding: 8px 14px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        .delete-btn:hover {
            background-color: #b71c1c;
        }
        footer{
        margin-top: 50px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Wildlife – Packages</h1>

<div class="container">
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife", "root", "tiger");

        String sql = "SELECT * FROM packages";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("package_id"); 
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String imageUrl = rs.getString("image_url");
%>
    <div class="package-box">
        <img src="<%= imageUrl %>" alt="<%= name %>">
        <h3><%= name %></h3>
        <p class="price">₹<%= price %> per person/night</p>
        <div class="details">
            <ul>
<%
            if (name.equalsIgnoreCase("Maharaja Package")) {
%>
                <li>Stay in Cottage (14 available)</li>
                <li>Includes Lunch, Dinner & Breakfast</li>
                <li>2 Jungle Safaris (Jeep Safari)</li>
                <li>Coracle Ride + Forest Entry + GST</li>
                <li>30% extra for single occupancy</li>
                <li>Camera charges extra, seasonal hike applicable</li>
<%
            } else if (name.equalsIgnoreCase("Viceroy Package")) {
%>
                <li>Stay in North or East Bungalow (15 rooms)</li>
                <li>Includes all meals (L/D/B)</li>
                <li>1 Boat/Bus Safari + 1 Jeep Safari</li>
                <li>Coracle Ride + Forest Entry + GST</li>
                <li>30% extra for single occupancy</li>
                <li>Camera charges extra, seasonal hike applicable</li>
<%
            } else if (name.equalsIgnoreCase("Kabini Tent Package")) {
%>
                <li>Stay in Tented Cottage (6 available)</li>
                <li>Meals: Lunch, Dinner & Breakfast</li>
                <li>1 Boat/Bus Safari + 1 Jeep Safari</li>
                <li>Forest Entry + GST included</li>
                <li>Camera charges extra, seasonal hike applicable</li>
<%
            } else if (name.equalsIgnoreCase("Dormitory Package")) {
%>
                <li>Shared Dormitory Stay (10 beds)</li>
                <li>Includes all meals</li>
                <li>1 Boat Safari + 1 Van Safari</li>
                <li>Forest Entry + GST included</li>
                <li>Common Toilets & Bathrooms (4 each)</li>
                <li>Camera charges extra, seasonal hike applicable</li>
<%
            }
%>
            </ul>
        </div>
                <div class="buttons">
    <a href="updatePackage.jsp?id=<%= id %>" class="update-btn">Update</a>
    
    <form action="PackageAction" method="post" onsubmit="return confirm('Are you sure you want to delete this stay?');" style="display:inline;">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="packageId" value="<%= id %>">
        <button type="submit" class="delete-btn" style="border: none; cursor: pointer;">Delete</button>
    </form>
</div>
        
    </div>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
</div>
<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
