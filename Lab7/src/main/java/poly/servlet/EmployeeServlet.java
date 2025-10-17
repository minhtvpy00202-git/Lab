package poly.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import poly.dao.DepartmentDAO;
import poly.dao.DepartmentDAOImpl;
import poly.dao.EmployeeDAO;
import poly.dao.EmployeeDAOImpl;
import poly.entity.Department;
import poly.entity.Employee;
import java.lang.reflect.Method;

@WebServlet ({
	"/employee/index",
	"/employee/edit/*",
	"/employee/create",
	"/employee/update",
	"/employee/delete",
	"/employee/reset"
})

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,    // 1MB
	    maxFileSize = 5 * 1024 * 1024,      // 5MB mỗi file
	    maxRequestSize = 10 * 1024 * 1024   // 10MB tổng request
	)

public class EmployeeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("DEBUG: EmployeeServlet được gọi với URL: " + req.getRequestURI());
		System.out.println("DEBUG: ServletPath: " + req.getServletPath());
		System.out.println("DEBUG: Method: " + req.getMethod());
		System.out.println("DEBUG: Content-Type: " + req.getContentType());
		
		Employee form = new Employee();
		
		// Chỉ populate parameters cho non-multipart requests hoặc sau khi xử lý file
		String contentType = req.getContentType();
		boolean isMultipart = contentType != null && contentType.toLowerCase().startsWith("multipart/");
		
		if (!isMultipart) {
			try {
				BeanUtils.populate(form, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		
		//Department:
		DepartmentDAO deptDao = new DepartmentDAOImpl();
		try {
			System.out.println("DEBUG: Bắt đầu load departments...");
			
			// 1) LOAD danh sách department để JSP hiển thị dropdown
			List<Department> deptList = deptDao.findAll();
			System.out.println("DEBUG: Số lượng phòng ban tìm thấy: " + (deptList != null ? deptList.size() : "null"));
			
			// Nếu không có dữ liệu, thử khởi tạo
			if (deptList == null || deptList.isEmpty()) {
				System.out.println("DEBUG: Không có phòng ban, thử khởi tạo dữ liệu mẫu...");
				poly.utils.DatabaseInitializer.initializeDepartments();
				deptList = deptDao.findAll(); // Load lại sau khi khởi tạo
			}
			
			if (deptList != null) {
				for (Department dept : deptList) {
					System.out.println("DEBUG: Phòng ban - ID: " + dept.getId() + ", Name: " + dept.getName());
				}
			}
			req.setAttribute("departments", deptList);
			System.out.println("DEBUG: Đã set departments vào request attribute");
		} catch (Exception e) {
			System.err.println("ERROR: Lỗi khi load departments: " + e.getMessage());
			e.printStackTrace();
			req.setAttribute("departments", new java.util.ArrayList<Department>());
		}
		
		// BeanUtils sẽ tự động map các field phù hợp
		
		
		// --- XỬ LÝ FILE UPLOAD (chỉ cho multipart requests) ---
        Part photoPart = null;
        if (isMultipart) {
        	// Populate form từ multipart request
        	try {
				BeanUtils.populate(form, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
        	
        	// Lấy Part name="photoFile"
            try {
                photoPart = req.getPart("photoFile");
            } catch (IllegalStateException ex) {
                // kích thước vượt quá giới hạn; xử lý nếu cần
                ex.printStackTrace();
            } catch (Exception ex) {
                System.err.println("Error getting photo part: " + ex.getMessage());
                ex.printStackTrace();
            }
        }

        if (photoPart != null && photoPart.getSize() > 0) {
            // chuẩn bị thư mục uploads (bên trong webapp: /uploads)
            String uploadsDir = getServletContext().getRealPath("/uploads");
            File uploadFolder = new File(uploadsDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }

            // Lấy tên file an toàn
            String submittedFileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
            // tạo tên file mới tránh trùng
            String filename = System.currentTimeMillis() + "_" + submittedFileName;

            // đường dẫn tuyệt đối:
            String filePath = uploadsDir + File.separator + filename;
            photoPart.write(filePath); // part.write hỗ trợ đường dẫn tuyệt đối

            // Lưu đường dẫn relative vào entity để hiển thị: "uploads/<filename>"
            form.setPhoto("uploads/" + filename);
        } else {
            // nếu không upload file mới: giữ giá trị photo cũ (hidden input name="photo")
            String existing = req.getParameter("photo");
            if (existing != null && !existing.isEmpty()) {
                form.setPhoto(existing);
            } else {
                form.setPhoto(null);
            }
        }
        // --- KẾT THÚC XỬ LÝ FILE ---
		
		EmployeeDAO dao = new EmployeeDAOImpl();
		String path = req.getServletPath();
		if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("create")) {
			dao.create(form);
			form = new Employee();
		} else if (path.contains("update")) {
			dao.update(form); 
		} else if (path.contains("delete")) {
			dao.deleteById(form.getId());
		} else {
			form = new Employee();
		}
		
		req.setAttribute("item", form);
		List<Employee> list = dao.findAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/WEB-INF/employee.jsp").forward(req, resp);
	}
}
