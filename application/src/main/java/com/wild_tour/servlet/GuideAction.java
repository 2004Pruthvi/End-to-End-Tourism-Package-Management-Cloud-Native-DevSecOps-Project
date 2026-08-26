package com.wild_tour.servlet;

import java.io.IOException;

import com.wild_tour.dao.GuideDAO;
import com.wild_tour.dao.GuideDAOImpl;
import com.wild_tour.dto.Guide;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/GuideAction")
public class GuideAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        GuideDAO dao = new GuideDAOImpl();

        try {
            if ("add".equalsIgnoreCase(action)) {
                String name = request.getParameter("name");
                String image = request.getParameter("image");
                String priceStr = request.getParameter("price");
                String bio = request.getParameter("bio");
                double price = Double.parseDouble(priceStr);

                Guide guide = new Guide();
                guide.setName(name);
                guide.setImage(image);
                guide.setBio(bio);
                guide.setPrice(price);

                boolean inserted = dao.insertGuide(guide);
                response.sendRedirect("viewGuide.jsp?msg=" + (inserted ? "guide_added" : "guide_failed"));

            } else if ("delete".equalsIgnoreCase(action)) {
                int guideId = Integer.parseInt(request.getParameter("guideId"));
                boolean deleted = dao.deleteGuide(guideId);
                response.sendRedirect("viewGuide.jsp?msg=" + (deleted ? "guide_deleted" : "delete_failed"));

            } else if ("update".equalsIgnoreCase(action)) {
                int guideId = Integer.parseInt(request.getParameter("guideId"));
                String name = request.getParameter("name");
                String image = request.getParameter("image");
                String priceStr = request.getParameter("price");
                String bio = request.getParameter("bio");
                double price = Double.parseDouble(priceStr);

                Guide guide = new Guide();
                guide.setId(guideId);
                guide.setName(name);
                guide.setImage(image);
                guide.setBio(bio);
                guide.setPrice(price);

                boolean updated = dao.updateGuide(guide);
                response.sendRedirect("viewGuide.jsp");

            } else {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp");
        }
    }
}
