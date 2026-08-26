package com.wild_tour.servlet;

import java.io.IOException;
import com.wild_tour.dao.PackagesDAO;
import com.wild_tour.dao.PackagesDAOImpl;
import com.wild_tour.dto.Packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PackageAction")
public class PackagesAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        PackagesDAO dao = new PackagesDAOImpl();

        try {
            if ("add".equalsIgnoreCase(action)) {
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price");
                String description = request.getParameter("description");
                double price = Double.parseDouble(priceStr);

                Packages pack = new Packages();
                pack.setName(name);
                pack.setImage_url(imageUrl);
                pack.setPrice(price);
                pack.setDescription(description);

                boolean inserted = dao.insertTourPackage(pack);
                response.sendRedirect("viewPackage.jsp");

            } else if ("delete".equalsIgnoreCase(action)) {
                int packageId = Integer.parseInt(request.getParameter("packageId"));
                boolean deleted = dao.deleteTourPackage(packageId);
                response.sendRedirect("viewPackage.jsp");

            } else if ("update".equalsIgnoreCase(action)) {
                int packageId = Integer.parseInt(request.getParameter("packageId"));
                String name = request.getParameter("name");
                String imageUrl = request.getParameter("image_url");
                String priceStr = request.getParameter("price");
                String description = request.getParameter("description");
                double price = Double.parseDouble(priceStr);

                Packages pack = new Packages();
                pack.setPackage_id(packageId);
                pack.setName(name);
                pack.setImage_url(imageUrl);
                pack.setPrice(price);
                pack.setDescription(description);

                boolean updated = dao.updateTourPackage(pack);
                response.sendRedirect("viewPackage.jsp");
            } else {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp");
        }
    }
}