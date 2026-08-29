<%@ page import="java.sql.*, com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kabini Tour Packages</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0fdf4, #e8f5e9);
        }

        h1 {
            background-color: #2e7d32;
            color: white;
            padding: 40px 0;
            margin: 0;
            font-size: 32px;
            letter-spacing: 1px;
            border-radius: 0 0 30px 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(360px, 1fr));
            gap: 100px;
            padding: 10px 30px;
            max-width: 1200px;
            margin: auto;
        }
        

        .package-box {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 40px;
        }

        .package-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .package-box img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        .package-box h3 {
            margin: 20px;
            font-size: 22px;
            color: #1b5e20;
        }

        .price {
            font-size: 18px;
            color: #c62828;
            font-weight: bold;
            margin: 0 20px 10px;
        }

        .details {
            font-size: 15px;
            color: #444;
            text-align: left;
            padding: 0 20px;
        }

        .details ul {
            padding-left: 18px;
            margin-bottom: 10px;
        }

        .details li {
            margin-bottom: 6px;
        }

        .bt {
            display: block;
            background-color: #2e7d32;
            color: white;
            padding: 12px 20px;
            margin: 20px;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 15px;
            text-align: center;
            text-decoration: none;
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
<h1>Wildlife Tour Packages</h1>



<div class="container">
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = Connector.requestConnection();

        String sql = "SELECT * FROM packages";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
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
        <a href="booking.jsp?itemType=Package&itemName=<%= name %>&price=<%= price %>&imageURL=<%= imageUrl %>" class="bt">Book Now</a>
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
