package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.Contact;
import models.Product;

public class ContactDAO {

	public ContactDAO() {
		
	}

	public static boolean insertFeedBack(Contact contact, Connection conn) {
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO contact (CustomerID,Email,Content) VALUES (?,?,?)";

		try {
			 preparedStatement = conn.prepareStatement(sql);
			 preparedStatement.setInt(1, contact.getCustomerID());
			 preparedStatement.setString(2, contact.getEmail());
			 preparedStatement.setString(3, contact.getContent());
			 System.out.println(preparedStatement);
			 preparedStatement.executeUpdate();
			 return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public static List<Contact> getAllContact(Connection conn) {
		List<Contact> list = new ArrayList<Contact>();

		PreparedStatement state = null;
		String sql = "select * from contact";

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
//				int contactID = rs.getInt("ContactID");
				int customerID = rs.getInt("CustomerID");
				String title = rs.getString("Email");
				String content = rs.getString("Content");
				
				list.add(new Contact(customerID, title, content));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}
	
}
