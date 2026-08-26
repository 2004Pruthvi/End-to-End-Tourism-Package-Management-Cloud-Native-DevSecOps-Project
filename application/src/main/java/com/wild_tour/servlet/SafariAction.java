package com.wild_tour.servlet;

import java.io.IOException;

import com.wild_tour.dao.SafariDAO;
import com.wild_tour.dao.SafariDAOImpl;
import com.wild_tour.dto.Safari;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SafariAction")
public class SafariAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        SafariDAO dao = new SafariDAOImpl();

        try {
            if ("add".equalsIgnoreCase(action)) {
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price_per_seat");
                String description = request.getParameter("description");
                double pricePerSeat = Double.parseDouble(priceStr);

                Safari safari = new Safari();
                safari.setName(name);
                safari.setImage_url(imageUrl);
                safari.setPrice_per_seat(pricePerSeat);
                safari.setDescription(description);

                boolean inserted = dao.insertSafari(safari);
                response.sendRedirect("viewSafari.jsp");

            } else if ("delete".equalsIgnoreCase(action)) {
                int safariId = Integer.parseInt(request.getParameter("safariId"));
                boolean deleted = dao.deleteSafari(safariId);
                response.sendRedirect("viewSafari.jsp");

            } else if ("update".equalsIgnoreCase(action)) {
                int safariId = Integer.parseInt(request.getParameter("safariId"));
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price_per_seat");
                String description = request.getParameter("description");
                double pricePerSeat = Double.parseDouble(priceStr);

                Safari safari = new Safari();
                safari.setSafari_id(safariId); // ensure safari_id is set
                safari.setName(name);
                safari.setImage_url(imageUrl);
                safari.setPrice_per_seat(pricePerSeat);
                safari.setDescription(description);

                boolean updated = dao.updateSafari(safari);
                response.sendRedirect("viewSafari.jsp");
            } else {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp");
        }
    }
}
