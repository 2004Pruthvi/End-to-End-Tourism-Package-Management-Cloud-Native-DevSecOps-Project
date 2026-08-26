package com.wild_tour.servlet;

import java.io.IOException;
import com.wild_tour.dao.StayDAO;
import com.wild_tour.dao.StayDAOImpl;
import com.wild_tour.dto.Stay;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/StayAction")
public class StayAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        StayDAO dao = new StayDAOImpl();

        try {
            if ("add".equalsIgnoreCase(action)) {
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price_per_night");
                String description = request.getParameter("description");
                double pricePerNight = Double.parseDouble(priceStr);

                Stay stay = new Stay();
                stay.setName(name);
                stay.setImage_url(imageUrl);
                stay.setPrice_per_night(pricePerNight);
                stay.setDescription(description);

                boolean inserted = dao.insertStay(stay);
                response.sendRedirect("viewStay.jsp");

            } else if ("delete".equalsIgnoreCase(action)) {
                int stayId = Integer.parseInt(request.getParameter("stayId"));
                boolean deleted = dao.deleteStay(stayId);
                response.sendRedirect("viewStay.jsp");

            } else if ("update".equalsIgnoreCase(action)) {
                int stayId = Integer.parseInt(request.getParameter("stayId"));
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price_per_night");
                String description = request.getParameter("description");
                double pricePerNight = Double.parseDouble(priceStr);

                Stay stay = new Stay();
                stay.setStay_id(stayId);
                stay.setName(name);
                stay.setImage_url(imageUrl);
                stay.setPrice_per_night(pricePerNight);
                stay.setDescription(description);

                boolean updated = dao.updateStay(stay);
                response.sendRedirect("viewStay.jsp");
            } else {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

