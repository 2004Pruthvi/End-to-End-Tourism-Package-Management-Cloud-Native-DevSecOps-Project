package com.wild_tour.servlet;

import java.io.IOException;
import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao=new UserDAOImpl();
		User u=udao.getUser(Long.parseLong(req.getParameter("phone")),req.getParameter("email"));
		if(u!=null) {
			if(req.getParameter("password").equals(req.getParameter("cpassword"))) {
				u.setPassword(req.getParameter("password"));
				
			if(udao.updateUser(u)) {
				req.setAttribute("success", "Password updated Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
				
			}
			else {
				req.setAttribute("error", "Fail to update Password");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
				
			}
			}
			else {
				req.setAttribute("error", "mismatch");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
			}
			}
			else {
				req.setAttribute("error", "user not found");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
				
			}
			
		}
	
	}


