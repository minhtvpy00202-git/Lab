package controller;

import java.io.IOException;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					String encode = cookie.getValue();
					byte[] bytes = Base64.getDecoder().decode(encode);
					String userInfo = new String(bytes, java.nio.charset.StandardCharsets.UTF_8);
					String[] parts = userInfo.split(":");
					req.setAttribute("user", parts[0]);
					req.setAttribute("pass", parts[1]);
				}
			}
		}

		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember-me");

		if ("FPT".equalsIgnoreCase(username) && "poly".equals(password)) {
			req.getSession().setAttribute("username", username);
			req.getSession().setAttribute("message", "Login successfully");

			if (remember != null) {
				byte[] bytes = (username + ":" + password).getBytes(java.nio.charset.StandardCharsets.UTF_8);
				String userInfo = java.util.Base64.getEncoder().encodeToString(bytes);
				Cookie cookie = new Cookie("user", userInfo);
				cookie.setMaxAge(30 * 24 * 60 * 60);
				cookie.setPath(req.getContextPath().isEmpty() ? "/" : req.getContextPath());
				cookie.setHttpOnly(true);
				resp.addCookie(cookie);
			} else {
				Cookie del = new Cookie("user", "");
				del.setMaxAge(0);
				del.setPath(req.getContextPath().isEmpty() ? "/" : req.getContextPath());
				resp.addCookie(del);
			}
		} else {
			req.getSession().setAttribute("message", "Invalid login info!");
		}

		// Quay về /login để doGet đọc cookie + show message
		resp.sendRedirect(req.getContextPath() + "/login");
	}

}
