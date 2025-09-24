package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dangky")
public class Servlet3_dangKy extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.put("username", "minhtv");
		map.put("password", "12345");
		map.put("gender", "male");
		map.put("marital", "true");
		map.put("country", "VN");
		map.put("hobby", new String[]{"read", "music"});
		map.put("note", "Xin Chúa chúc lành cho tất cả chúng ta!");
		req.setAttribute("dangky", map);
		req.getRequestDispatcher("/views/dang-ky.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String marital = req.getParameter("marital");
		String country = req.getParameter("country");
		String[] hobby = req.getParameterValues("hobby");
		String note = req.getParameter("note");
		
		//In console:
		System.out.println("====FORM DANG KY=====");
		System.out.println("username: " +username);
		System.out.println("password: " +password);
		System.out.println("gender: " +gender);
		System.out.println("marital: " +("true".equals(marital)));
		System.out.println("country: " + country);
		System.out.println("hobby: " +Arrays.toString(hobby));
		System.out.println("note: " +note);
		System.out.println("=====================");
		
		// Gửi lại dữ liệu để giữ trạng thái form
        Map<String, Object> form = new HashMap<>();
        form.put("username", username);
        form.put("password", password);
        form.put("gender", gender);
        form.put("marital", marital != null ? "true" : "false");
        form.put("country", country);
        form.put("hobby", hobby != null ? hobby : new String[0]);
        form.put("note", note);

        req.setAttribute("dangky", form);
		
		req.setAttribute("message", "Đã đọc tham số! Xem Console để kiểm tra.");
		req.getRequestDispatcher("/views/dang-ky.jsp").forward(req, resp);
	}
}
