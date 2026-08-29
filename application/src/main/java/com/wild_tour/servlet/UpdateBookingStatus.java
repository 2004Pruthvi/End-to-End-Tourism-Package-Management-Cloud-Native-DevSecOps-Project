package com.wild_tour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.wild_tour.connection.Connector;

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

        String query = "UPDATE booking SET status = ? WHERE booking_id = ?";

        try (Connection con = Connector.requestConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, action);
            ps.setInt(2, bookingId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("trip_management.jsp");
    }
}
