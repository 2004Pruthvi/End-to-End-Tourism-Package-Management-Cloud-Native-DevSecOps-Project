<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.wild_tour.connection.Connector, com.wild_tour.dto.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Trips</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #eef1f4;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
        }
        .back {
            text-align: right;
            padding: 10px;
        }
        .trip-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .trip-card img {
            width: 200px;
            height: 140px;
            object-fit: cover;
            border-radius: 10px;
        }
        .trip-info {
            flex: 1;
        }
        .trip-info h3 {
            margin: 0;
            color: #2e7d32;
        }
        .trip-info p {
            margin: 5px 0;
        }
        .cancel-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .cancel-btn:hover {
            background-color: #c82333;
        }
        .status-badge {
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: bold;
        }
        .status-confirmed {
            background-color: #d4edda;
            color: #155724;
        }
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
        .status-completed {
            background-color: #d1ecf1;
            color: #0c5460;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>My Booked Trips</h2>
    <div class="back">
        <a href="dashboard.jsp" class="btn btn-primary">Back</a>
    </div>

<%
    try {
        con = Connector.requestConnection();
        String sql = "SELECT * FROM booking WHERE user_id = ? ORDER BY booked_date DESC";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user.getUserId());
        rs = ps.executeQuery();

        boolean hasTrips = false;

        while (rs.next()) {
            hasTrips = true;
            int bookingId = rs.getInt("booking_id");
            String itemType = rs.getString("item_type");
            String itemName = rs.getString("item_name");
            String imageUrl = rs.getString("item_image");
            int numPersons = rs.getInt("num_persons");
            double totalPrice = rs.getDouble("total_price");
            String paymentMode = rs.getString("payment_mode");
            String status = rs.getString("status").toLowerCase();

            String displayStatus = status;
            String statusClass = "status-confirmed";

            if ("booked".equals(status)) {
                displayStatus = "confirmed";
            } else if ("cancelled".equals(status)) {
                statusClass = "status-cancelled";
            } else if ("completed".equals(status)) {
                statusClass = "status-completed";
            }
%>

    <div class="trip-card">
        <img src="<%= imageUrl %>" alt="Trip Image" />
        <div class="trip-info">
            <h3><%= itemName %> (<%= itemType %>)</h3>
            <p><strong>Number of Persons:</strong> <%= numPersons %></p>

            <% if ("Safari".equalsIgnoreCase(itemType) || "Guide".equalsIgnoreCase(itemType)) { %>
                <p><strong>Booked Date:</strong> <%= rs.getDate("booking_date") %></p>
            <% } else if ("Stay".equalsIgnoreCase(itemType) || "Package".equalsIgnoreCase(itemType)) { %>
                <p><strong>From:</strong> <%= rs.getDate("from_date") %></p>
                <p><strong>To:</strong> <%= rs.getDate("to_date") %></p>
            <% } %>

            <p><strong>Total Price:</strong> ₹ <%= totalPrice %></p>
            <p><strong>Payment Mode:</strong> <%= paymentMode %></p>
            <p><strong>Status:</strong>
                <span class="status-badge <%= statusClass %>">
                    <%= displayStatus.substring(0, 1).toUpperCase() + displayStatus.substring(1) %>
                </span>
            </p>

            <% if (!"cancelled".equals(status) && !"completed".equals(status)) { %>
                <form action="CancelBookingServlet" method="post" style="margin-top:10px;">
                    <input type="hidden" name="booking_id" value="<%= bookingId %>">
                    <button type="submit" class="cancel-btn">Cancel Booking</button>
                </form>
            <% } %>
        </div>
    </div>

<%
        }

        if (!hasTrips) {
%>
    <p>You have not booked any trips yet.</p>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
    <p style="color: red;">Failed to load trip data. Please try again later.</p>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (ps != null) try { ps.close(); } catch (Exception ignored) {}
        if (con != null) try { con.close(); } catch (Exception ignored) {}
    }
%>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
