package com.wild_tour.servlet;

import java.io.IOException;
import java.sql.Date;

import com.wild_tour.dao.BookingDAO;
import com.wild_tour.dao.BookingDAOImpl;
import com.wild_tour.dto.Booking;
import com.wild_tour.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/BookingServlet")
public class Bookings extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Booking b = new Booking();
        BookingDAO bDAO = new BookingDAOImpl();

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            b.setUser_id(user.getUserId());
            b.setTourist_name(request.getParameter("touristName"));
            String itemType = request.getParameter("itemType");
            b.setItem_type(itemType);
            b.setItem_name(request.getParameter("itemName"));
            b.setItem_image(request.getParameter("imageURL"));
            int persons = Integer.parseInt(request.getParameter("numPersons"));
            b.setNum_persons(persons);
            b.setPayment_mode(request.getParameter("paymentMode"));
            b.setStatus("Booked");

            if ("Safari".equalsIgnoreCase(itemType) || "Guide".equalsIgnoreCase(itemType)) {
                String bookingDateStr = request.getParameter("bookingDate");
                b.setBooking_date(Date.valueOf(bookingDateStr));
                b.setTotal_price(Double.parseDouble(request.getParameter("totalPrice")));
            } else if ("Stay".equalsIgnoreCase(itemType) || "Package".equalsIgnoreCase(itemType)) {
                String fromDateStr = request.getParameter("fromDate");
                String toDateStr = request.getParameter("toDate");

                Date fromDate = Date.valueOf(fromDateStr);
                Date toDate = Date.valueOf(toDateStr);

                b.setFrom_date(fromDate);
                b.setTo_date(toDate);

                long days = (toDate.getTime() - fromDate.getTime()) / (1000 * 60 * 60 * 24);
                if (days <= 0) {
                    request.setAttribute("error", "To Date must be after From Date.");
                    request.getRequestDispatcher("booking.jsp").forward(request, response);
                    return;
                }

                double basePrice = Double.parseDouble(request.getParameter("totalPrice")) / (persons * days);
                double finalPrice = basePrice * persons * days;
                b.setTotal_price(finalPrice);
            }

            if (bDAO.insertBooking(b)) {
                // Prevent rebooking on refresh
                response.sendRedirect("myTrip.jsp");
            } else {
            	response.sendRedirect("booking.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp");
        }
    }
}


    