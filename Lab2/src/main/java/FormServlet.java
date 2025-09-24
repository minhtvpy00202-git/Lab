import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user;

@WebServlet ("/form/update")
public class FormServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
		
//		Map<String, Object> map = new HashMap<>();
//	    map.put("fullname", "Nguyen Van Tèo");
//	    map.put("gender", true);
//	    req.setAttribute("user", map);
		
		user bean = new user();
		bean.setFullname("Nguyễn Văn Tèo");
		bean.setGender(true);
		bean.setCountry("VN");
		req.setAttribute("user",bean);
		
	    req.setAttribute("editable", true);
	    req.getRequestDispatcher("/form.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		System.out.println(fullname);
		req.getRequestDispatcher("/form.jsp").forward(req, resp);
	}

}
