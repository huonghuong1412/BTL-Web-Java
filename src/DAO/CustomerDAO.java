package DAO;

import models.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO {

	public CustomerDAO() {}

	public static Customer login(String username, String password, Connection con) {
		Customer cus = null;
		PreparedStatement state = null;
		String sql = "select * from customer where UserName='" + username + "' and Password='" + password + "'";
		try {
			state = con.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				cus = new Customer();
				cus.setCustomerID(rs.getInt("CustomerID"));
				cus.setFullName(rs.getString("FullName"));
				cus.setUserName(rs.getString("UserName"));
				cus.setPassword(rs.getString("Password"));
				cus.setAddress(rs.getString("Address"));
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

	public static boolean updateProfile(int id, String username, String password, String fullname, String address, String phone,
			Connection con) {
		PreparedStatement state = null;
		// String updateUserSQL = "update customer set (username,password,fullname,
		// address, phone) values('" + username
		// + "','" + password + "','" + fullname + "','" + address + "','" + phone +
		// "')";
		String updateUserSQL = "update customer set username = '" + username + "', password = '" + password
				+ "',fullname='" + fullname + "', address='" + address + "', phone='" + phone + "') where id='"+id+"'";
		try {
			// register
			state = con.prepareStatement(updateUserSQL);
			state.executeUpdate(updateUserSQL);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
