<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Safari Services</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e8f5e9, #f1f8e9);
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #2e7d32;
            color: white;
            padding: 35px 0;
            margin: 0;
            text-align: center;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            font-size: 32px;
            letter-spacing: 1px;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 40px;
            padding: 20px 30px;
            justify-items: center;
        }
         
        .safari-box {
            background-color: #ffffff;
            width: 320px;
            border-radius: 18px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 40px;
            
        }
        .safari-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.2);
        }
        .safari-box img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        .safari-box h3 {
            color: #2e7d32;
            margin: 20px 0 10px;
            padding: 0 20px;
            font-size: 20px;
        }
        .safari-box p {
            color: #666;
            padding: 0 20px;
            font-size: 15px;
            line-height: 1.5;
        }
        .safari-box h4 {
            color: #c62828;
            margin: 15px 0;
            font-size: 18px;
            font-weight: 600;
            padding: 0 20px;
        }
        .bt {
            display: inline-block;
            background-color: #2e7d32;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 15px;
            margin: 20px auto 25px;
            transition: background-color 0.3s ease;
        }
        .bt:hover {
            background-color: #1b5e20;
        }
        footer {
      
      margin-top: 50px;
      
    }
    </style>
</head>
<body>
   <%@ include file="header.jsp" %>

<h1 style="color:white";>Explore the Best Wildlife Safaris</h1>
      
<div class="container">
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife", "root", "vishwas");

        String query = "SELECT safari_id, name, description, price_per_seat, image_url FROM safari";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            String desc = rs.getString("description");
            double price = rs.getDouble("price_per_seat");
            String image = rs.getString("image_url");
%>
    <div class="safari-box">
        <img src="<%= image %>" alt="<%= name %>">
        <h3><%= name %></h3>
        <p><%= desc %></p>
        <h4>₹ <%= price %> / seat</h4>
        <a href="booking.jsp?itemType=Safari&itemName=<%= name %>&price=<%= price %>&imageURL=<%= image %>" class="bt">Book Now</a>
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
