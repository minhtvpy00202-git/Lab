package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Jdbc_bai4 {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HRM;encrypt=false;trustServerCertificate=true";
	static String username = "sa";
	static String password = "123456";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}

	// Mo ket noi
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username, password);
	}

	// Thao tac du lieu
	public static int executeUpdate(String sql, Object... values) throws SQLException {
		Connection conn = getConnection();
		CallableStatement st = conn.prepareCall(sql);
		for (int i = 0; i < values.length; i++) {
			st.setObject(i + 1, values[i]);
		}
		return st.executeUpdate();
	}

	// Truy van du lieu
	public static ResultSet executeQuery(String sql, Object... values) throws SQLException {
		Connection conn = getConnection();
		CallableStatement st = conn.prepareCall(sql);
		for (int i = 0; i < values.length; i++) {
			st.setObject(i + 1, values[i]);
		}
		return st.executeQuery();
	}

	/* SU DUNG */
	public static void main(String[] args) {
		// Truy van
		try {
			String sql = "{CALL spSelectById(?)}";
			String values = "D01";
			ResultSet resultSet = Jdbc_bai4.executeQuery(sql, values);
			while (resultSet.next()) {
				String id = resultSet.getString("Id");
				String name = resultSet.getString("Name");
				String description = resultSet.getString("Description");
				// ...
				System.out.println(id + " - " + name + " - " + description);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Insert
		try {
			String sql = "{CALL spInsert(?, ?, ?)}";
			Object[] values = { "D04", "Dpart4", "Them4" };
			int rows = Jdbc_bai4.executeUpdate(sql, values);
			System.out.println("Rows affected = " + rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
