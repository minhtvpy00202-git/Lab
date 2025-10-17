package poly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.dao.DepartmentDAO;
import poly.dao.DepartmentDAOImpl;
import poly.entity.Department;
import poly.utils.Jdbc;

@WebServlet("/test-database")
public class TestDatabaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        out.println("<html><head><title>Test Database</title></head><body>");
        out.println("<h2>Kiểm tra kết nối Database</h2>");
        
        try {
            // Test 1: Kiểm tra kết nối
            out.println("<h3>1. Test kết nối database:</h3>");
            Connection conn = Jdbc.getConnection();
            if (conn != null) {
                out.println("<p style='color:green'>✅ Kết nối database thành công!</p>");
                conn.close();
            } else {
                out.println("<p style='color:red'>❌ Không thể kết nối database!</p>");
            }
            
            // Test 2: Kiểm tra bảng Departments có tồn tại không
            out.println("<h3>2. Kiểm tra bảng Departments:</h3>");
            try {
                String checkTableSql = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Departments'";
                ResultSet rs = Jdbc.executeQuery(checkTableSql);
                if (rs.next() && rs.getInt(1) > 0) {
                    out.println("<p style='color:green'>✅ Bảng Departments tồn tại</p>");
                } else {
                    out.println("<p style='color:red'>❌ Bảng Departments không tồn tại!</p>");
                    out.println("<p>Tạo bảng Departments:</p>");
                    
                    String createTableSql = "CREATE TABLE Departments (" +
                        "Id NVARCHAR(50) PRIMARY KEY, " +
                        "Name NVARCHAR(255) NOT NULL, " +
                        "Description NVARCHAR(500)" +
                        ")";
                    
                    Jdbc.executeUpdate(createTableSql);
                    out.println("<p style='color:green'>✅ Đã tạo bảng Departments</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red'>❌ Lỗi kiểm tra bảng: " + e.getMessage() + "</p>");
            }
            
            // Test 3: Kiểm tra dữ liệu trong bảng
            out.println("<h3>3. Kiểm tra dữ liệu trong bảng:</h3>");
            try {
                String countSql = "SELECT COUNT(*) FROM Departments";
                ResultSet rs = Jdbc.executeQuery(countSql);
                if (rs.next()) {
                    int count = rs.getInt(1);
                    out.println("<p>Số lượng phòng ban: " + count + "</p>");
                    
                    if (count == 0) {
                        out.println("<p>Thêm dữ liệu mẫu...</p>");
                        
                        String[] insertSqls = {
                            "INSERT INTO Departments(Id, Name, Description) VALUES ('IT', N'Công nghệ thông tin', N'Phòng ban phát triển phần mềm')",
                            "INSERT INTO Departments(Id, Name, Description) VALUES ('HR', N'Nhân sự', N'Phòng ban quản lý nhân sự')",
                            "INSERT INTO Departments(Id, Name, Description) VALUES ('FINANCE', N'Tài chính', N'Phòng ban tài chính kế toán')",
                            "INSERT INTO Departments(Id, Name, Description) VALUES ('MARKETING', N'Marketing', N'Phòng ban tiếp thị')",
                            "INSERT INTO Departments(Id, Name, Description) VALUES ('SALES', N'Kinh doanh', N'Phòng ban bán hàng')"
                        };
                        
                        for (String sql : insertSqls) {
                            Jdbc.executeUpdate(sql);
                        }
                        
                        out.println("<p style='color:green'>✅ Đã thêm " + insertSqls.length + " phòng ban mẫu</p>");
                    }
                }
            } catch (Exception e) {
                out.println("<p style='color:red'>❌ Lỗi kiểm tra dữ liệu: " + e.getMessage() + "</p>");
            }
            
            // Test 4: Test DepartmentDAO
            out.println("<h3>4. Test DepartmentDAO:</h3>");
            try {
                DepartmentDAO dao = new DepartmentDAOImpl();
                List<Department> departments = dao.findAll();
                
                if (departments != null && !departments.isEmpty()) {
                    out.println("<p style='color:green'>✅ DepartmentDAO hoạt động tốt. Tìm thấy " + departments.size() + " phòng ban:</p>");
                    out.println("<ul>");
                    for (Department dept : departments) {
                        out.println("<li>ID: " + dept.getId() + " - Name: " + dept.getName() + "</li>");
                    }
                    out.println("</ul>");
                } else {
                    out.println("<p style='color:red'>❌ DepartmentDAO trả về null hoặc rỗng</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red'>❌ Lỗi DepartmentDAO: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            out.println("<p style='color:red'>❌ Lỗi tổng quát: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
        
        out.println("<br><a href='/employee/index'>← Quay lại Employee</a>");
        out.println("</body></html>");
    }
}