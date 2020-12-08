package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	
	private static String jdbcURL = "jdbc:mysql://localhost:3306/webbanhang";
	private static String jdbcUser = "root";
	private static String jdbcPass = "huong1412";

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPass);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		return conn;
	}

}
