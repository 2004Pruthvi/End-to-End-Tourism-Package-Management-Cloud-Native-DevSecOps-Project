package com.wild_tour.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.dto.User;
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		UserDAO udao=new UserDAOImpl();
		User u=udao.getUser(req.getParameter("mail"),req.getParameter("pass"));
		if (u != null) {
            session.setAttribute("user", u);
            req.setAttribute("success", "Login Successful!");
            RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
            rd.forward(req, resp);
            
        } else {
            req.setAttribute("fail", "Invalid Email or Password!");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
    }
}



