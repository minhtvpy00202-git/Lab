package poly.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseInitializer {
    
    public static void initializeDepartments() {
        try {
            // Kiểm tra xem đã có dữ liệu chưa
            String checkSql = "SELECT COUNT(*) FROM Departments";
            ResultSet rs = Jdbc.executeQuery(checkSql);
            
            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            
            // Nếu chưa có dữ liệu thì thêm mẫu
            if (count == 0) {
                System.out.println("Thêm dữ liệu mẫu cho bảng Departments...");
                
                String[] departments = {
                    "INSERT INTO Departments(Id, Name, Description) VALUES ('IT', N'Công nghệ thông tin', N'Phòng ban phát triển phần mềm')",
                    "INSERT INTO Departments(Id, Name, Description) VALUES ('HR', N'Nhân sự', N'Phòng ban quản lý nhân sự')",
                    "INSERT INTO Departments(Id, Name, Description) VALUES ('FINANCE', N'Tài chính', N'Phòng ban tài chính kế toán')",
                    "INSERT INTO Departments(Id, Name, Description) VALUES ('MARKETING', N'Marketing', N'Phòng ban tiếp thị')",
                    "INSERT INTO Departments(Id, Name, Description) VALUES ('SALES', N'Kinh doanh', N'Phòng ban bán hàng')"
                };
                
                for (String sql : departments) {
                    Jdbc.executeUpdate(sql);
                }
                
                System.out.println("Đã thêm " + departments.length + " phòng ban mẫu.");
            } else {
                System.out.println("Bảng Departments đã có " + count + " bản ghi.");
            }
            
        } catch (SQLException e) {
            System.err.println("Lỗi khi khởi tạo dữ liệu Departments: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        initializeDepartments();
    }
}