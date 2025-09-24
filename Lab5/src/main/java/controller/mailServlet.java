package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Mailer;

@WebServlet("/sendmail")
public class mailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/mail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String from = req.getParameter("from");
		String to = req.getParameter("to");
		String subject = req.getParameter("subject");
		String body = req.getParameter("body");

		try {
			Mailer.send(from, to, subject, body);
			req.setAttribute("ok", "Đã gửi email tới: " + to);
		} catch (Exception e) {
			req.setAttribute("err", "Gửi thất bại: " + e.getMessage());
			e.printStackTrace();
		}

		req.getRequestDispatcher("/views/mail.jsp").forward(req, resp);
	}

}
