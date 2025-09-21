package fpoly;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UrlInfoServlet", urlPatterns = {"/url-info/*"})
public class UrlInfoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.setAttribute("url", req.getRequestURL().toString());
		req.setAttribute("uri", req.getRequestURI().toString());
		req.setAttribute("query", req.getQueryString());
		req.setAttribute("servletPath", req.getServletPath());
		req.setAttribute("contextPath", req.getContextPath());
		req.setAttribute("pathInfo", req.getPathInfo());
		req.setAttribute("method", req.getMethod());
		
		//Chuyển tiếp sang jsp để hiển thị
		req.getRequestDispatcher("/views/urlinfo.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
