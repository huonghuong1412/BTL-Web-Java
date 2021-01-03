package DAO;

import models.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO {

	public CustomerDAO() {
	}

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
				cus.setPhone(rs.getString("Phone"));
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
		String sql = "INSERT INTO customer" + " (UserName, Password, FullName, Address, Phone) VALUES "
				+ " (?, ?, ?, ?, ?);";
		try {

			state = con.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, password);
			state.setString(3, fullname);
			state.setString(4, address);
			state.setString(5, phone);
			state.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getMessage();
			return false;
		}

	}

	public static boolean updateProfile(int id, String username, String fullname, String address, String phone,
			Connection con) {
		PreparedStatement state = null;
		String sqlUpdate = "update customer set UserName=?, FullName=?, Address=?, Phone=? where CustomerID=?";
		try {
			state = con.prepareStatement(sqlUpdate);
			state.setString(1, username);
			state.setString(2, fullname);
			state.setString(3, address);
			state.setString(4, phone);
			state.setInt(5, id);
			state.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public static boolean changePassword(int id, String pass, Connection con) {
		PreparedStatement state = null;
		String sql = "update customer set Password=? where CustomerID=?";
		try {
			state = con.prepareStatement(sql);
			state.setString(1, pass);
			state.setInt(2, id);
			state.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
