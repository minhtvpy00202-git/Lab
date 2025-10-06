package util;

import java.sql.*;

public class Jdbc {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HRM;encrypt=false;trustServerCertificate=true";
	static String username = "sa";
	static String password = "123456";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	/* Mở kết nối */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username, password);
	}

	/* INSERT/UPDATE/DELETE */
	public static int executeUpdate(String sql) throws SQLException {
		try (Connection conn = getConnection(); Statement st = conn.createStatement()) {
			return st.executeUpdate(sql);
		}
	}

	/* Demo: in toàn bộ Departments (đóng tài nguyên đầy đủ) */
	public static void findAll() {
		String sql = "SELECT Id, Name, Description FROM Departments";
		try (Connection conn = getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {

			while (rs.next()) {
				String id = rs.getString("Id");
				String name = rs.getString("Name");
				String desc = rs.getString("Description");
				System.out.println(id + " - " + name + " - " + desc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insert() {
    	String sql = "INSERT INTO DEPARTMENTS (Id, Name, Description) values ('D01', 'Business Department', N'Phòng kinh doanh')";
    	try {
    			int rows = Jdbc.executeUpdate(sql);
    			System.out.println(rows);
    			
    	} catch (Exception e) {
    				e.printStackTrace();
    			}
    }

	public static void main(String[] args) {
		System.out.println(">>> MAIN STARTED");
		findAll();
		insert();
		System.out.println(">>> MAIN FINISHED");
	}
}
