package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class Servlet4_Upload extends HttpServlet {

	private static final java.nio.file.Path UPLOAD_DIR = java.nio.file.Paths.get(System.getProperty("user.home"),
			"Upload");

	@Override
	public void init() throws ServletException {
		try {
			java.nio.file.Files.createDirectories(UPLOAD_DIR);
		} catch (IOException e) {
			throw new ServletException(e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/upload.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part photo = req.getPart("photo");
		String name = java.nio.file.Paths.get(photo.getSubmittedFileName()).getFileName().toString();
		java.nio.file.Path dest = UPLOAD_DIR.resolve(name);
		try (var in = photo.getInputStream()) {
			java.nio.file.Files.copy(in, dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
		}
		req.setAttribute("savedPath", dest.toString());
		req.getRequestDispatcher("/views/upload.jsp").forward(req, resp);
	}
}
