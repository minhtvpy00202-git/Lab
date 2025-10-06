package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class Jdbc_bai3 {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HRM;encrypt=false;trustServerCertificate=true";
	static String username = "sa";
	static String password = "123456";
	
	//Nạp driver
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Mở kết nối
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username, password);
	}
	
	//Thao tác dữ liệu
	public static int executeUpdate(String sql, Object...values) throws SQLException {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		for(int i = 0; i < values.length; i++) {
			st.setObject(i+1, values[i]);
		}		
		return st.executeUpdate();
	}
	
	//Truy vấn dữ liệu
	public static ResultSet executeQuery(String sql, Object...values) throws SQLException {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		for(int i =0; i<values.length;i++) {
			st.setObject(i+1,values[i]);
		}
		return st.executeQuery();
	}
	
	//Sử dụng:
	//tìm theo id
	public static void findDepartmentById(String id) {
		String sql = "Select Id, Name, Description from Departments where Id = ?";
		try (ResultSet rs = executeQuery(sql, id)) {
			if(rs.next()) {
				System.out.printf("Id: %s | Name: %s | Description: %s%n",
	                    rs.getString("Id"),
	                    rs.getString("Name"),
	                    rs.getString("Description"));
			} else {
				 System.out.println("Không tìm thấy phòng ban có Id = " + id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//thêm:
	public static void insertDepartment(String id, String name, String desc) {
	    String sql = "INSERT INTO Departments (Id, Name, Description) VALUES (?, ?, ?)";
	    try {
	        int rows = executeUpdate(sql, id, name, desc);
	        System.out.println("Đã thêm " + rows + " phòng ban mới.");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	//cập nhật:
	public static void updateDepartment(String id, String newName, String newDesc) {
	    String sql = "UPDATE Departments SET Name = ?, Description = ? WHERE Id = ?";
	    try {
	        int rows = executeUpdate(sql, newName, newDesc, id);
	        System.out.println("Đã cập nhật " + rows + " phòng ban.");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public static void main(String[] args) {
		findDepartmentById("D01");
	}
}
