package DAO;

import models.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Config.ConnectDB;

public class CustomerDAO {

	public CustomerDAO() {
		// TODO Auto-generated constructor stub
	}

	private static final String LOGIN_CUSTOMER = "select * from customer where username =? and password =?";
	private static final String CHECK_USERNAME = "select * from customer where username =?";
	private static final String INSERT_CUSTOMER = "insert into customer\" + \"(username, password, address, fullname, phone) values\"  + \"(?, ?, ?, ?, ?)";
	private static final String CHANGE_PASSWORD_CUSTOMER = "";

	public static Customer login(String username, String password, Connection con) {
		Customer cus = null;
		PreparedStatement state = null;
		String sql = "select * from customer where username='" + username + "' and password='" + password + "'";
		try {
			state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				cus = new Customer();
				cus.setIdCustomer(rs.getInt("id"));
				cus.setFullname(rs.getString("fullname"));
				cus.setUsername(rs.getString("username"));
				cus.setPassword(rs.getString("password"));
				cus.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return cus;
	}

	public static boolean register(String username, String password, String fullname, String address, String phone,
			Connection con) {
		System.out.println("Register");
		PreparedStatement state = null;
		String checkUserSQL = "select * from customer where username ='" + username + "'";
		String insertUserSQL = "insert into customer(username,password,fullname, address, phone) values('" + username
				+ "','" + password + "','" + fullname + "','" + address + "','" + phone + "')";
		try {
			state = con.prepareStatement(checkUserSQL);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				return false;
			} else {

				// register
				state = con.prepareStatement(insertUserSQL);
				state.executeUpdate(insertUserSQL);

				return true;
			}
		} catch (Exception e) {
			e.getMessage();
			return false;
		}

	}

}
