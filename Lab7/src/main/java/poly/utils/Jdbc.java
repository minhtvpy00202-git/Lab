package poly.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Jdbc {
	static  String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HRM;encrypt=false;trustServerCertificate=true";
	static String username = "sa";
	static String password = "123456";
	
	/*nap driver*/
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException (e);
		}
	}
	
	/*Mo ket noi */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username,password);
	}
	
	/*Tao PreparedStatement lam viec voi SQL hoac PROC */
	private static PreparedStatement createPreStmt(String sql, Object...values) throws SQLException {
		Connection conn = Jdbc.getConnection();
		PreparedStatement stmt = null;
		if(sql.trim().startsWith("{")) {
			stmt = conn.prepareCall(sql);
		}
		stmt = conn.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			stmt.setObject(i+1, values[i]);
		}
		return stmt;
	}
	
	/*thao tac du lieu */
	public static int executeUpdate(String sql, Object...values) throws SQLException {
		PreparedStatement stmt = Jdbc.createPreStmt(sql, values);
			return stmt.executeUpdate();
	}
	/*Truy van du lieu */
	public static ResultSet executeQuery(String sql, Object...values) throws SQLException {
		PreparedStatement stmt = Jdbc.createPreStmt(sql, values);
		return stmt.executeQuery();
	}
}
