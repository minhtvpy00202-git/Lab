package fpoly;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet ({
	"/crud/create",
	"/crud/update",
	"/crud/delete",
	"/crud/edit/*"
})
public class CrudServlet extends HttpServlet{
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String servletPath = req.getServletPath();
		String pathInfo = req.getPathInfo();
		
		if (uri.contains("/crud/create")) {
            this.create(req, resp);
		} else if (uri.contains("/crud/update")) {
			this.update(req, resp);	
		} else if (uri.contains("/crud/delete")) {
			this.delete(req, resp);
		} else if (uri.contains("/crud/edit")) {
			this.edit(req, resp, pathInfo);
		} else {
			req.setAttribute("message", "Không khớp route CRUD nào");
			forward(req, resp);
		}
		
		
		
	}
	private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "CREATE: Đang tạo bản ghi");
		forward(req, resp);
	}
	
	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "UPDATE: Đang cập nhật bản ghi");
		forward(req, resp);
	}
	
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "DELETE: Đang xóa bản ghi");
		forward(req, resp);
	}
	
	private void edit(HttpServletRequest req, HttpServletResponse resp, String pathInfo) throws ServletException, IOException {
		
		String target = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : "(không có id)";
		
		req.setAttribute("message", "EDIT: Chỉnh sửa bản ghi " + target);
		forward(req, resp);
	}
	
	private void forward(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/crud/index.jsp").forward(req, resp);
	}
}
