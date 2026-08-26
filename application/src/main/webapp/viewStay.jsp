<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accommodation Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e8f5e9, #f1f8e9);
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #1b5e20;
            color: white;
            padding: 25px 0;
            margin: 0;
            text-align: center;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            font-size: 32px;
            letter-spacing: 1px;
        }
               
        
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px 30px;
            gap: 40px;
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
            padding:10px;
            margin-top:20px;
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
            color: #000;
            margin: 15px 0;
            font-size: 17px;
            font-weight: 600;
            padding: 0 20px;
        }
        .buttons {
            display: flex;
            justify-content: space-evenly;
            padding: 20px;
            border-top: 1px solid #eee;
        }
        .buttons a {
            padding: 10px 18px;
            text-decoration: none;
            color: white;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .update-btn {
            background-color: #0288d1;
        }
        .update-btn:hover {
            background-color: #0277bd;
        }
        .delete-btn {
            background-color: #e53935;
            padding:10px 18px;
            text-decoration: none;
            color: white;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            
        }
        .delete-btn:hover {
            background-color: #c62828;
        }
        footer{
        margin-top: 50px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>WildLife Accommodation </h1>

<div class="container">
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife", "root", "tiger");

        String sql = "SELECT stay_id, name, description, price_per_night, image_url FROM stay";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("stay_id");
            String name = rs.getString("name");
            String desc = rs.getString("description");
            double price = rs.getDouble("price_per_night");
            String image = rs.getString("image_url");
%>
    <div class="safari-box">
        <img src="<%= image %>" alt="<%= name %>">
        <h3><%= name %></h3>
        <p><%= desc %></p>
        <h4>₹<%= price %> / Night</h4>
        <div class="buttons">
    <a href="updateStay.jsp?id=<%= id %>" class="update-btn">Update</a>
    
    <form action="StayAction" method="post" onsubmit="return confirm('Are you sure you want to delete this stay?');" style="display:inline;">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="stayId" value="<%= id %>">
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
