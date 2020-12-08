package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.ConnectDB;

public class AdminDAO {

	public AdminDAO() {

	}
	
	public static boolean login(String username, String password) {
		String sql="select * from admin where username='"+username+"' and password='"+password+"'";
		try (Connection conn = ConnectDB.getConnection();
				PreparedStatement state = conn.prepareStatement(sql)) {
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
