<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.wild_tour.connection.Connector" %>

<html>
<head>
    <title>Admin Trip Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            color: #2c3e50;
        }
        
        .table {
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        }

        th, td {
            vertical-align: middle !important;
        }

        img {
            border-radius: 8px;
        }

        .btn-sm {
            margin-right: 5px;
        }
        footer{
        margin-top: 50px;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Bookings</h2>
    
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Booking ID</th>
                <th>User ID</th>
                <th>Tourist Name</th>
                <th>Item Type</th>
                <th>Item</th>
                <th>Image</th>
                <th>Persons</th>
                <th>Total Price</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Booked Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = Connector.requestConnection();

                String sql = "SELECT b.*, u.user_name AS tourist_name FROM booking b JOIN user u ON b.user_id = u.user_id ORDER BY b.booked_date DESC";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String status = rs.getString("status");
        %>
            <tr>
                <td><%= rs.getInt("booking_id") %></td>
                <td><%= rs.getInt("user_id") %></td>
                <td><%= rs.getString("tourist_name") %></td>
                <td><%= rs.getString("item_type") %></td>
                <td><%= rs.getString("item_name") %></td>
                <td>
                    <img src="<%= rs.getString("item_image") %>" width="100" height="70" style="object-fit:cover;" />
                </td>
                <td><%= rs.getInt("num_persons") %></td>
                <td>₹<%= rs.getDouble("total_price") %></td>
                <td><%= rs.getString("payment_mode") %></td>
                <td><%= status %></td>
                <td><%= rs.getTimestamp("booked_date") %></td>
                <td>
        <%
            if (!"cancelled".equalsIgnoreCase(status) && !"completed".equalsIgnoreCase(status)) {
        %>
            <form method="post" action="updateBookingStatus" class="d-flex gap-1">
                <input type="hidden" name="bookingId" value="<%= rs.getInt("booking_id") %>">
                <button name="action" value="completed" class="btn btn-success btn-sm">Done</button>
                <button name="action" value="cancelled" class="btn btn-danger btn-sm">Cancel</button>
            </form>
        <%
            } else {
        %>
            <div class="text-center">
                <span class="btn btn-secondary btn-sm disabled">Closed</span>
            </div>
        <%
            }
        %>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
        </tbody>
    </table>
</div>
<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
