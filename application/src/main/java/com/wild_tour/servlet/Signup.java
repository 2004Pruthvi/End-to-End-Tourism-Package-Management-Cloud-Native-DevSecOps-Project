package com.wild_tour.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.dto.User;
@WebServlet("/signup")
public class Signup extends HttpServlet {
	User u=new User();
	UserDAO udao=new UserDAOImpl();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		u.setUser_name(req.getParameter("name"));
		u.setEmail(req.getParameter("email"));
		u.setPhone(Long.parseLong(req.getParameter("phone")));
		if(req.getParameter("pass").equals(req.getParameter("cpass"))) {
			u.setPassword(req.getParameter("pass"));
		u.setAddress(req.getParameter("address"));
		if(udao.insertUser(u)) {
			req.setAttribute("success", "Data saved successfully");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);	
		}
		else {
			req.setAttribute("error", "Failed to save data");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
		}
	}
	}
}
