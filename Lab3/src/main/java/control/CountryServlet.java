package control;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Country;

@WebServlet("/country")
public class CountryServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Country> list = List.of(new Country("VN", "Việt Nam"), new Country("USA", "United States"),
				new Country("CN", "China"));
		req.setAttribute("countries", list);
		req.getRequestDispatcher("/views/country.jsp").forward(req, resp);
	}
	
	
	
	
}
