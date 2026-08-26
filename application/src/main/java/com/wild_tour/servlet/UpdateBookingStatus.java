package com.wild_tour.servlet;

	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;

	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;

	@WebServlet("/updateBookingStatus")
	public class UpdateBookingStatus extends HttpServlet {
	    

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        String bookingIdStr = request.getParameter("bookingId");
	        String action = request.getParameter("action");

	        if (bookingIdStr == null || action == null) {
	            response.sendRedirect("trip_management.jsp");
	            return;
	        }

	        int bookingId = Integer.parseInt(bookingIdStr);

	        Connection con = null;
	        PreparedStatement ps = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife", "root", "penta@123");

	            String query = "UPDATE booking SET status = ? WHERE booking_id = ?";
	            ps = con.prepareStatement(query);
	            ps.setString(1, action);
	            ps.setInt(2, bookingId);
	            ps.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        response.sendRedirect("trip_management.jsp");
	    }
	}



