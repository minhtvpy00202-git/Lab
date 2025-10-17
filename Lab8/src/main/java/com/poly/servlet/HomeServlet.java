package com.poly.servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/home/index", "/home/about", "/home/contact"})
public class HomeServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String uri = req.getRequestURI();
		if(uri.contains("index")) {
			req.setAttribute("view", "/home/index.jsp");
		} else if (uri.contains("about")) {
			req.setAttribute("view", "/home/about.jsp");
		} else if (uri.contains("contact")) {
			req.setAttribute("view", "/home/contact.jsp");
		}
		
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
		
	}
	
}
